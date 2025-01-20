@interface BLJaliscoServerSource
+ (id)sharedSource;
+ (void)preWarmSync;
+ (void)setSharedSource:(id)a3;
- (BLJaliscoServerSource)init;
- (BLJaliscoServerSource)initWithIdentifier:(id)a3 databaseContainerPath:(id)a4;
- (BOOL)_setupCoreDataStack;
- (BOOL)p_createPersistentDirectoryIfNeeded;
- (BOOL)p_databaseExistsAtPrivateiBooksContainerLocation;
- (BOOL)p_databaseExistsAtSharediBooksContainerLocation;
- (BOOL)truncateDatabaseError:(id *)a3;
- (BOOL)workaround_18397698;
- (NSPersistentHistoryToken)currentJaliscoHistoryToken;
- (NSString)databaseContainerPath;
- (NSString)identifier;
- (id)_itemsFetchRequestIncludingHiddenItems:(BOOL)a3 dsids:(id)a4;
- (id)_persistentStoreOptions;
- (id)allItemsFetchRequestForDSIDs:(id)a3;
- (id)existingEntitiesWithName:(id)a3 matchingPredicate:(id)a4 fromManagedObjectContext:(id)a5 limit:(unint64_t)a6 error:(id *)a7;
- (id)existingServerDatabaseWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5;
- (id)existingServerInfoWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5;
- (id)existingServerItemWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5;
- (id)fetchRequestForAllBookletsIDsWithParentStoreIDs:(id)a3;
- (id)fetchRequestForAllCloudIDs:(id)a3 dsids:(id)a4;
- (id)fetchRequestForAllStoreIDs:(id)a3;
- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4;
- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4 isImported:(BOOL)a5;
- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4 isImported:(BOOL)a5 includeHidden:(BOOL)a6;
- (id)fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:(id)a3 dsids:(id)a4;
- (id)fetchRequestForBookletItemsForStoreIDs:(id)a3;
- (id)fetchRequestForBuyParameters:(id)a3;
- (id)fetchRequestForHiddenItemsWithAccountIDs:(id)a3;
- (id)fetchRequestForNeedsImport:(BOOL)a3;
- (id)fetchRequestForNotInStoreAccountIDs:(id)a3;
- (id)fetchRequestForStoreIDs:(id)a3 dsids:(id)a4;
- (id)itemsFetchRequestForDSIDs:(id)a3;
- (id)managedObjectModel;
- (id)newManagedObjectContext;
- (id)newManagedObjectContextWithPrivateQueueConcurrency;
- (id)p_oldPersistentStoreDirectory;
- (id)p_persistentStoreDirectory;
- (id)p_persistentStoreFullPathAtPrivateiBooksLocation;
- (id)p_persistentStoreFullPathAtSharediBooksLocation;
- (id)persistentStoreCoordinator;
- (id)persistentStoreCoordinatorWithError:(id *)a3;
- (id)platformPredicatesForItemsWithActiveUserID:(id)a3;
- (id)predicateForBookletItems:(BOOL)a3 dsids:(id)a4;
- (id)predicateForItems:(BOOL)a3 dsids:(id)a4;
- (id)predicateForNeedsImport:(BOOL)a3;
- (id)predicateForStoreAccountID:(id)a3 storeIDs:(id)a4;
- (id)serverDatabaseForDSID:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5;
- (id)serverDatabaseForDSID:(id)a3 withIdentifier:(id)a4 fromManagedObjectContext:(id)a5 error:(id *)a6;
- (id)serverInfoForDSID:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5;
- (id)serverItemWithStoreID:(id)a3 inDatabaseWithIdentifier:(id)a4 forDSID:(id)a5 fromManagedObjectContext:(id)a6 error:(id *)a7;
- (void)dealloc;
- (void)refreshStoreWithCompletion:(id)a3;
- (void)setDatabaseContainerPath:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation BLJaliscoServerSource

+ (void)preWarmSync
{
  kdebug_trace();
  objc_msgSend_sharedSource(BLJaliscoServerSource, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)objc_msgSend_persistentStoreCoordinator(v9, v5, v6, v7);
  kdebug_trace();
}

+ (id)sharedSource
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_267D25400);
  if (!qword_26AB3FF98)
  {
    id v3 = objc_alloc((Class)a1);
    uint64_t v7 = objc_msgSend_defaultIdentifier(BLJaliscoVersion, v4, v5, v6);
    uint64_t v9 = objc_msgSend_initWithIdentifier_databaseContainerPath_(v3, v8, (uint64_t)v7, 0);
    v10 = (void *)qword_26AB3FF98;
    qword_26AB3FF98 = v9;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_267D25400);
  v11 = (void *)qword_26AB3FF98;

  return v11;
}

+ (void)setSharedSource:(id)a3
{
}

- (BLJaliscoServerSource)initWithIdentifier:(id)a3 databaseContainerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BLJaliscoServerSource;
  v11 = [(BLJaliscoServerSource *)&v25 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    databaseContainerPath = v11->_databaseContainerPath;
    v11->_databaseContainerPath = (NSString *)v17;

    if ((objc_msgSend__setupCoreDataStack(v11, v19, v20, v21) & 1) == 0)
    {
      v22 = BLJaliscoLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_ERROR, "Unable to initialize BLJaliscoServerSource", v24, 2u);
      }

      v11 = 0;
    }
  }
  __dmb(0xBu);

  return v11;
}

- (BLJaliscoServerSource)init
{
  uint64_t v5 = objc_msgSend_defaultIdentifier(BLJaliscoVersion, a2, v2, v3);
  id v7 = (BLJaliscoServerSource *)objc_msgSend_initWithIdentifier_databaseContainerPath_(self, v6, (uint64_t)v5, 0);

  return v7;
}

- (BOOL)workaround_18397698
{
  v100[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x223C1EB90](self, a2);
  id v7 = objc_msgSend_newManagedObjectContext(self, v4, v5, v6);
  id v8 = objc_alloc(MEMORY[0x263EFF260]);
  v11 = objc_msgSend_initWithEntityName_(v8, v9, @"BLJaliscoServerItem", v10);
  objc_msgSend_setResultType_(v11, v12, 4, v13);
  id v95 = 0;
  uint64_t v15 = objc_msgSend_executeFetchRequest_error_(v7, v14, (uint64_t)v11, (uint64_t)&v95);
  id v16 = v95;
  uint64_t v20 = objc_msgSend_firstObject(v15, v17, v18, v19);

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x263EFF260]);
    v24 = objc_msgSend_initWithEntityName_(v21, v22, @"BLJaliscoServerItem", v23);
    objc_msgSend_setReturnsDistinctResults_(v24, v25, 1, v26);
    objc_msgSend_setResultType_(v24, v27, 2, v28);
    v100[0] = @"storeID";
    v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v100, 1);
    objc_msgSend_setPropertiesToGroupBy_(v24, v31, (uint64_t)v30, v32);

    v99 = @"storeID";
    v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v33, (uint64_t)&v99, 1);
    objc_msgSend_setPropertiesToFetch_(v24, v35, (uint64_t)v34, v36);

    id v94 = v16;
    v38 = objc_msgSend_executeFetchRequest_error_(v7, v37, (uint64_t)v24, (uint64_t)&v94);
    id v39 = v94;

    if (v24)
    {
      uint64_t v43 = objc_msgSend_integerValue(v20, v40, v41, v42);
      uint64_t v47 = objc_msgSend_count(v38, v44, v45, v46);
      char v51 = 0;
      if (v43 < 2001 || v43 <= 3 * v47) {
        goto LABEL_29;
      }
      v82 = v38;
      v83 = v24;
      v84 = v20;
      v85 = v11;
      v86 = v7;
      v87 = v3;
      v52 = objc_msgSend_persistentStoreCoordinator(v7, v48, v49, v50);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      v56 = objc_msgSend_persistentStores(v52, v53, v54, v55);
      v60 = objc_msgSend_copy(v56, v57, v58, v59);

      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v90, (uint64_t)v98, 16);
      if (v62)
      {
        uint64_t v66 = v62;
        char v88 = 0;
        uint64_t v67 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v66; ++i)
          {
            if (*(void *)v91 != v67) {
              objc_enumerationMutation(v60);
            }
            v69 = *(void **)(*((void *)&v90 + 1) + 8 * i);
            v70 = objc_msgSend_URL(v69, v63, v64, v65);
            v75 = objc_msgSend_type(v69, v71, v72, v73);
            if (v70)
            {
              id v89 = v39;
              char v76 = objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(v52, v74, (uint64_t)v70, (uint64_t)v75, 0, &v89);
              id v77 = v89;

              if (v76)
              {
                char v88 = 1;
              }
              else
              {
                v78 = BLJaliscoLog();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v97 = v77;
                  _os_log_impl(&dword_21DFE3000, v78, OS_LOG_TYPE_ERROR, "Failed to delete database:  %@", buf, 0xCu);
                }
              }
              id v39 = v77;
            }
          }
          uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v90, (uint64_t)v98, 16);
        }
        while (v66);
      }
      else
      {
        char v88 = 0;
      }

      id v7 = v86;
      uint64_t v3 = v87;
      uint64_t v20 = v84;
      v11 = v85;
      v38 = v82;
      v24 = v83;
      char v51 = v88;
    }
    else
    {
      v52 = BLJaliscoLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v97 = v39;
        _os_log_impl(&dword_21DFE3000, v52, OS_LOG_TYPE_ERROR, "Failed to fetch distinct items count:  %@", buf, 0xCu);
      }
      char v51 = 0;
    }

LABEL_29:
    BOOL v80 = v51 & 1;
    id v16 = v39;
    goto LABEL_30;
  }
  v79 = BLJaliscoLog();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v97 = v16;
    _os_log_impl(&dword_21DFE3000, v79, OS_LOG_TYPE_ERROR, "Failed to fetch all items count:  %@", buf, 0xCu);
  }

  BOOL v80 = 0;
LABEL_30:

  return v80;
}

- (void)dealloc
{
  model = self->_model;
  self->_model = 0;

  psc = self->_psc;
  self->_psc = 0;

  v5.receiver = self;
  v5.super_class = (Class)BLJaliscoServerSource;
  [(BLJaliscoServerSource *)&v5 dealloc];
}

- (id)managedObjectModel
{
  int64_t modelSentinel = self->_modelSentinel;
  p_int64_t modelSentinel = &self->_modelSentinel;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E0142E0;
  block[3] = &unk_26448B708;
  block[4] = self;
  if (modelSentinel != -1) {
    dispatch_once(p_modelSentinel, block);
  }
  return self->_model;
}

- (id)p_oldPersistentStoreDirectory
{
  objc_super v5 = objc_msgSend_databaseContainerPath(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = objc_msgSend_databaseContainerPath(self, v6, v7, v8);
  }
  else
  {
    uint64_t v10 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v14 = objc_msgSend_lastObject(v10, v11, v12, v13);
    uint64_t v9 = objc_msgSend_stringByAppendingPathComponent_(v14, v15, @"BKJaliscoServerSource", v16);
  }

  return v9;
}

- (id)p_persistentStoreDirectory
{
  objc_super v5 = objc_msgSend_databaseContainerPath(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = objc_msgSend_databaseContainerPath(self, v6, v7, v8);
  }
  else
  {
    uint64_t v10 = objc_msgSend_bu_booksGroupContainerDocumentsURL(NSURL, v6, v7, v8);
    v14 = objc_msgSend_path(v10, v11, v12, v13);

    uint64_t v9 = objc_msgSend_stringByAppendingPathComponent_(v14, v15, @"BKJaliscoServerSource", v16);
  }

  return v9;
}

- (id)p_persistentStoreFullPathAtPrivateiBooksLocation
{
  uint64_t v4 = objc_msgSend_p_oldPersistentStoreDirectory(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_persistentStoreFileName(BLJaliscoVersion, v5, v6, v7);
  v11 = objc_msgSend_stringByAppendingPathComponent_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (id)p_persistentStoreFullPathAtSharediBooksLocation
{
  uint64_t v4 = objc_msgSend_p_persistentStoreDirectory(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_persistentStoreFileName(BLJaliscoVersion, v5, v6, v7);
  v11 = objc_msgSend_stringByAppendingPathComponent_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (BOOL)p_databaseExistsAtPrivateiBooksContainerLocation
{
  objc_super v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  uint64_t v9 = objc_msgSend_p_persistentStoreFullPathAtPrivateiBooksLocation(self, v6, v7, v8);
  char v12 = objc_msgSend_fileExistsAtPath_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (BOOL)p_databaseExistsAtSharediBooksContainerLocation
{
  objc_super v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  uint64_t v9 = objc_msgSend_p_persistentStoreFullPathAtSharediBooksLocation(self, v6, v7, v8);
  char v12 = objc_msgSend_fileExistsAtPath_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (BOOL)p_createPersistentDirectoryIfNeeded
{
  uint64_t v4 = objc_msgSend_p_persistentStoreDirectory(self, a2, v2, v3);
  uint64_t v6 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v5, (uint64_t)v4, 1);
  uint64_t v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9);
  v14 = objc_msgSend_relativePath(v6, v11, v12, v13);
  uint64_t v18 = 0;
  char v16 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v10, v15, (uint64_t)v14, 1, 0, &v18);

  return v16;
}

- (id)_persistentStoreOptions
{
  v7[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFF070];
  v6[0] = *MEMORY[0x263EFF008];
  v6[1] = v2;
  v7[0] = MEMORY[0x263EFFA88];
  v7[1] = MEMORY[0x263EFFA88];
  uint64_t v3 = *MEMORY[0x263EFF0B0];
  v6[2] = *MEMORY[0x263EFF108];
  v6[3] = v3;
  v7[2] = MEMORY[0x263EFFA88];
  v7[3] = MEMORY[0x263EFFA88];
  v6[4] = *MEMORY[0x263EFF0E0];
  v7[4] = *MEMORY[0x263F080B0];
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v7, (uint64_t)v6, 5);

  return v4;
}

- (BOOL)_setupCoreDataStack
{
  v11[6] = *(id *)MEMORY[0x263EF8340];
  id v5 = (id)objc_msgSend_managedObjectModel(self, a2, v2, v3);
  v11[0] = 0;
  id v8 = (id)objc_msgSend_persistentStoreCoordinatorWithError_(self, v6, (uint64_t)v11, v7);
  id v9 = v11[0];

  return v9 == 0;
}

- (id)persistentStoreCoordinatorWithError:(id *)a3
{
  int64_t pscSentinel = self->_pscSentinel;
  p_int64_t pscSentinel = &self->_pscSentinel;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_21E014A70;
  v7[3] = &unk_26448BD28;
  v7[4] = self;
  v7[5] = a3;
  if (pscSentinel != -1) {
    dispatch_once(p_pscSentinel, v7);
  }
  return self->_psc;
}

- (id)persistentStoreCoordinator
{
  return (id)objc_msgSend_persistentStoreCoordinatorWithError_(self, a2, 0, v2);
}

- (NSPersistentHistoryToken)currentJaliscoHistoryToken
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v10 = 0;
  uint64_t v3 = objc_msgSend_persistentStoreCoordinatorWithError_(self, a2, (uint64_t)&v10, v2);
  id v6 = v10;
  if (v3)
  {
    uint64_t v7 = objc_msgSend_currentPersistentHistoryTokenFromStores_(v3, v4, 0, v5);
    id v8 = BLJaliscoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[BLJaliscoServerSource currentJaliscoHistoryToken] token:(%@) from psc:(%@)", buf, 0x16u);
    }
  }
  else
  {
    id v8 = BLJaliscoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource currentJaliscoHistoryToken] Failed to get currentJaliscoHistoryToken %@", buf, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return (NSPersistentHistoryToken *)v7;
}

- (id)newManagedObjectContext
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v17 = 0;
  uint64_t v3 = objc_msgSend_persistentStoreCoordinatorWithError_(self, a2, (uint64_t)&v17, v2);
  id v4 = v17;
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x263EFF288]);
    id v8 = objc_msgSend_initWithConcurrencyType_(v5, v6, 0, v7);
    objc_msgSend_setPersistentStoreCoordinator_(v8, v9, (uint64_t)v3, v10);
    objc_msgSend_setUndoManager_(v8, v11, 0, v12);
    objc_msgSend_setMergePolicy_(v8, v13, *MEMORY[0x263EFF060], v14);
  }
  else
  {
    uint64_t v15 = BLJaliscoLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_21DFE3000, v15, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource newManagedObjectContext] Failed to create newManagedObjectContext %@", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)newManagedObjectContextWithPrivateQueueConcurrency
{
  id v16 = 0;
  uint64_t v3 = objc_msgSend_persistentStoreCoordinatorWithError_(self, a2, (uint64_t)&v16, v2);
  id v4 = v16;
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x263EFF288]);
    id v8 = objc_msgSend_initWithConcurrencyType_(v5, v6, 1, v7);
    objc_msgSend_setPersistentStoreCoordinator_(v8, v9, (uint64_t)v3, v10);
    objc_msgSend_setUndoManager_(v8, v11, 0, v12);
    objc_msgSend_setMergePolicy_(v8, v13, *MEMORY[0x263EFF060], v14);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)serverInfoForDSID:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x263F08A98];
  id v9 = a4;
  uint64_t v12 = objc_msgSend_predicateWithFormat_(v8, v10, @"userUID = %@", v11, a3);
  id v17 = 0;
  uint64_t v14 = objc_msgSend_existingServerInfoWithPredicate_fromManagedObjectContext_error_(self, v13, (uint64_t)v12, (uint64_t)v9, &v17);

  id v15 = v17;
  if (a5 && !v14) {
    *a5 = v15;
  }

  return v14;
}

- (BOOL)truncateDatabaseError:(id *)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend_newManagedObjectContext(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend__persistentStoreOptions(self, v7, v8, v9);
  __int16 v13 = objc_msgSend_persistentStoreCoordinatorWithError_(self, v11, (uint64_t)a3, v12);
  id v17 = objc_msgSend_persistentStores(v13, v14, v15, v16);
  id v21 = objc_msgSend_lastObject(v17, v18, v19, v20);

  v22 = NSURL;
  uint64_t v26 = objc_msgSend_p_persistentStoreFullPathAtSharediBooksLocation(self, v23, v24, v25);
  uint64_t v28 = objc_msgSend_fileURLWithPath_isDirectory_(v22, v27, (uint64_t)v26, 0);

  if (v21)
  {
    uint64_t v31 = objc_msgSend_URLForPersistentStore_(v13, v29, (uint64_t)v21, v30);

    objc_msgSend_removePersistentStore_error_(v13, v32, (uint64_t)v21, 0);
    objc_msgSend_reset(v6, v33, v34, v35);
    uint64_t v36 = *MEMORY[0x263EFF168];
    int v38 = objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(v13, v37, v31, *MEMORY[0x263EFF168], v10, a3);
    id v39 = BLJaliscoLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v63 = 138412546;
      uint64_t v64 = v31;
      __int16 v65 = 1024;
      LODWORD(v66) = v38;
      _os_log_impl(&dword_21DFE3000, v39, OS_LOG_TYPE_DEFAULT, "[BLJaliscoServerSource truncateDatabaseError] Removing store:%@ destroyed:%{BOOL}d", (uint8_t *)&v63, 0x12u);
    }

    if (!v38)
    {
      char v56 = 0;
      uint64_t v28 = (void *)v31;
      goto LABEL_15;
    }
    uint64_t v28 = (void *)v31;
    objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(self->_psc, v40, v36, 0, v31, v10, a3);
  }
  else
  {
    uint64_t v43 = BLJaliscoLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v63) = 0;
      _os_log_impl(&dword_21DFE3000, v43, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource truncateDatabaseError] There's nothing to truncate!", (uint8_t *)&v63, 2u);
    }

    objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(self->_psc, v44, *MEMORY[0x263EFF168], 0, v28, v10, a3);
  uint64_t v45 = };
  if (v45)
  {
    uint64_t v46 = (void *)v45;
    uint64_t v47 = BLJaliscoLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      char v51 = objc_msgSend_identifier(v46, v48, v49, v50);
      uint64_t v55 = objc_msgSend_currentJaliscoHistoryToken(self, v52, v53, v54);
      int v63 = 138413058;
      uint64_t v64 = (uint64_t)v28;
      __int16 v65 = 2112;
      uint64_t v66 = v51;
      __int16 v67 = 2112;
      v68 = v10;
      __int16 v69 = 2112;
      v70 = v55;
      _os_log_impl(&dword_21DFE3000, v47, OS_LOG_TYPE_DEFAULT, "Added new store at storeURL:(%@), persistentstoreID:(%@), storeOptions:(%@) Setup jalisco stack with history token after truncate:(%@)", (uint8_t *)&v63, 0x2Au);
    }
    char v56 = 1;
  }
  else
  {
    char v56 = 0;
  }
LABEL_15:
  v57 = objc_msgSend_sharedClient(BLJaliscoDAAPClient, v40, v41, v42);
  char v61 = objc_msgSend_resetPoliteTimers(v57, v58, v59, v60);

  return v56 & v61;
}

- (void)refreshStoreWithCompletion:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v55 = 0;
  id v4 = a3;
  uint64_t v7 = objc_msgSend_persistentStoreCoordinatorWithError_(self, v5, (uint64_t)&v55, v6);
  id v8 = v55;
  uint64_t v12 = objc_msgSend_persistentStores(v7, v9, v10, v11);
  uint64_t v16 = objc_msgSend_lastObject(v12, v13, v14, v15);

  id v17 = NSURL;
  id v21 = objc_msgSend_p_persistentStoreFullPathAtSharediBooksLocation(self, v18, v19, v20);
  uint64_t v23 = objc_msgSend_fileURLWithPath_isDirectory_(v17, v22, (uint64_t)v21, 0);

  v27 = objc_msgSend__persistentStoreOptions(self, v24, v25, v26);
  uint64_t v28 = BLJaliscoLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = objc_msgSend_identifier(v16, v29, v30, v31);
    *(_DWORD *)buf = 138412546;
    id v57 = v23;
    __int16 v58 = 2112;
    uint64_t v59 = v32;
    _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_DEFAULT, "Trying to refresh store at storeURL:(%@), persistentstoreID:(%@)", buf, 0x16u);
  }
  if (v16)
  {
    uint64_t v35 = objc_msgSend_URLForPersistentStore_(v7, v33, (uint64_t)v16, v34);

    objc_msgSend_removePersistentStore_error_(v7, v36, (uint64_t)v16, 0);
    psc = self->_psc;
    uint64_t v38 = *MEMORY[0x263EFF168];
    id v54 = v8;
    v40 = objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(psc, v39, v38, 0, v35, v27, &v54);
    id v41 = v54;

    uint64_t v42 = BLJaliscoLog();
    uint64_t v43 = v42;
    if (v40)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = objc_msgSend_identifier(v40, v44, v45, v46);
        char v51 = objc_msgSend_currentJaliscoHistoryToken(self, v48, v49, v50);
        *(_DWORD *)buf = 138413058;
        id v57 = v35;
        __int16 v58 = 2112;
        uint64_t v59 = v47;
        __int16 v60 = 2112;
        char v61 = v27;
        __int16 v62 = 2112;
        int v63 = v51;
        _os_log_impl(&dword_21DFE3000, v43, OS_LOG_TYPE_DEFAULT, "Refreshed store at storeURL:(%@), persistentstoreID:(%@) storeOptions:(%@) History token(%@)", buf, 0x2Au);
      }
      v52 = v40;
    }
    else
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v41;
        _os_log_impl(&dword_21DFE3000, v43, OS_LOG_TYPE_ERROR, "Refresh store Failed to re-add store %@", buf, 0xCu);
      }
      v52 = 0;
      v40 = v43;
    }
  }
  else
  {
    v40 = BLJaliscoLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v8;
      _os_log_impl(&dword_21DFE3000, v40, OS_LOG_TYPE_ERROR, "Refresh store failed - no store to refresh %@", buf, 0xCu);
    }
    v52 = 0;
    uint64_t v35 = v23;
    id v41 = v8;
  }

  uint64_t v53 = (void (**)(void, void))MEMORY[0x223C1EDC0](v4);
  if (v53) {
    ((void (**)(void, BOOL))v53)[2](v53, v52 != 0);
  }
}

- (id)serverDatabaseForDSID:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x263F08A98];
  id v9 = a4;
  uint64_t v12 = objc_msgSend_predicateWithFormat_(v8, v10, @"server.userUID = %@", v11, a3);
  id v17 = 0;
  uint64_t v14 = objc_msgSend_existingServerDatabaseWithPredicate_fromManagedObjectContext_error_(self, v13, (uint64_t)v12, (uint64_t)v9, &v17);

  id v15 = v17;
  if (a5 && !v14) {
    *a5 = v15;
  }

  return v14;
}

- (id)serverDatabaseForDSID:(id)a3 withIdentifier:(id)a4 fromManagedObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v10 = (void *)MEMORY[0x263F08A98];
  id v11 = a5;
  uint64_t v14 = objc_msgSend_predicateWithFormat_(v10, v12, @"identifier = %@ AND server.userUID = %@", v13, a4, a3);
  id v19 = 0;
  uint64_t v16 = objc_msgSend_existingServerDatabaseWithPredicate_fromManagedObjectContext_error_(self, v15, (uint64_t)v14, (uint64_t)v11, &v19);

  id v17 = v19;
  if (a6 && !v16) {
    *a6 = v17;
  }

  return v16;
}

- (id)existingEntitiesWithName:(id)a3 matchingPredicate:(id)a4 fromManagedObjectContext:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void *)MEMORY[0x223C1EB90]();
  id v15 = objc_alloc_init(MEMORY[0x263EFF260]);
  id v17 = objc_msgSend_entityForName_inManagedObjectContext_(MEMORY[0x263EFF240], v16, (uint64_t)v11, (uint64_t)v13);
  objc_msgSend_setEntity_(v15, v18, (uint64_t)v17, v19);

  objc_msgSend_setPredicate_(v15, v20, (uint64_t)v12, v21);
  objc_msgSend_setResultType_(v15, v22, 1, v23);
  if (a6) {
    objc_msgSend_setFetchLimit_(v15, v24, a6, v25);
  }
  id v33 = 0;
  uint64_t v26 = objc_msgSend_executeFetchRequest_error_(v13, v24, (uint64_t)v15, (uint64_t)&v33);
  id v27 = v33;
  uint64_t v31 = v27;
  if (v27)
  {
    if (a7) {
      *a7 = v27;
    }
    objc_msgSend_logRecursively(v31, v28, v29, v30);
  }

  return v26;
}

- (id)existingServerInfoWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v23 = 0;
  uint64_t v10 = objc_msgSend_existingEntitiesWithName_matchingPredicate_fromManagedObjectContext_limit_error_(self, v9, @"BLJaliscoServerInfo", (uint64_t)a3, v8, 1, &v23);
  id v11 = v23;
  id v15 = objc_msgSend_lastObject(v10, v12, v13, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_lastObject(v10, v16, v17, v18);
    uint64_t v21 = objc_msgSend_existingObjectWithID_error_(v8, v20, (uint64_t)v19, 0);
  }
  else
  {
    uint64_t v21 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v21;
}

- (id)existingServerDatabaseWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v23 = 0;
  uint64_t v10 = objc_msgSend_existingEntitiesWithName_matchingPredicate_fromManagedObjectContext_limit_error_(self, v9, @"BLJaliscoServerDatabase", (uint64_t)a3, v8, 1, &v23);
  id v11 = v23;
  id v15 = objc_msgSend_lastObject(v10, v12, v13, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_lastObject(v10, v16, v17, v18);
    uint64_t v21 = objc_msgSend_existingObjectWithID_error_(v8, v20, (uint64_t)v19, 0);
  }
  else
  {
    uint64_t v21 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v21;
}

- (id)existingServerItemWithPredicate:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v23 = 0;
  uint64_t v10 = objc_msgSend_existingEntitiesWithName_matchingPredicate_fromManagedObjectContext_limit_error_(self, v9, @"BLJaliscoServerItem", (uint64_t)a3, v8, 1, &v23);
  id v11 = v23;
  id v15 = objc_msgSend_lastObject(v10, v12, v13, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_lastObject(v10, v16, v17, v18);
    uint64_t v21 = objc_msgSend_existingObjectWithID_error_(v8, v20, (uint64_t)v19, 0);
  }
  else
  {
    uint64_t v21 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v21;
}

- (id)serverItemWithStoreID:(id)a3 inDatabaseWithIdentifier:(id)a4 forDSID:(id)a5 fromManagedObjectContext:(id)a6 error:(id *)a7
{
  id v12 = (void *)MEMORY[0x263F08A98];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v19 = objc_msgSend_stringValue(a3, v16, v17, v18);
  v22 = objc_msgSend_predicateWithFormat_(v12, v20, @"storeID = %@ AND database.identifier = %@ and database.server.userUID = %@", v21, v19, v15, v14);

  id v27 = 0;
  uint64_t v24 = objc_msgSend_existingServerItemWithPredicate_fromManagedObjectContext_error_(self, v23, (uint64_t)v22, (uint64_t)v13, &v27);

  id v25 = v27;
  if (a7 && !v24) {
    *a7 = v25;
  }

  return v24;
}

- (id)allItemsFetchRequestForDSIDs:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel__itemsFetchRequestIncludingHiddenItems_dsids_, 1, a3);
}

- (id)itemsFetchRequestForDSIDs:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel__itemsFetchRequestIncludingHiddenItems_dsids_, 0, a3);
}

- (id)_itemsFetchRequestIncludingHiddenItems:(BOOL)a3 dsids:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void *)MEMORY[0x263F2BA38];
  id v7 = a4;
  id v11 = objc_msgSend_sharedProvider(v6, v8, v9, v10);
  id v15 = objc_msgSend_activeStoreAccount(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_ams_DSID(v15, v16, v17, v18);

  uint64_t v20 = (void *)MEMORY[0x263EFF260];
  uint64_t v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  id v25 = objc_msgSend_fetchRequestWithEntityName_(v20, v23, (uint64_t)v22, v24);

  id v27 = objc_msgSend_predicateForItems_dsids_(self, v26, v4, (uint64_t)v7);

  objc_msgSend_setPredicate_(v25, v28, (uint64_t)v27, v29);
  if (v19)
  {
    uint64_t v31 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v32 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], v30, @"artist", 1);
    uint64_t v35 = objc_msgSend_arrayWithObject_(v31, v33, (uint64_t)v32, v34);
    objc_msgSend_setSortDescriptors_(v25, v36, (uint64_t)v35, v37);
  }

  return v25;
}

- (id)platformPredicatesForItemsWithActiveUserID:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  id v5 = (void *)MEMORY[0x263F08A98];
  uint64_t v9 = objc_msgSend_stringValue(v3, v6, v7, v8);
  uint64_t v13 = objc_msgSend_stringValue(v3, v10, v11, v12);

  uint64_t v16 = objc_msgSend_predicateWithFormat_(v5, v14, @"(((database.server.userUID == %@) AND (%K == NO OR %K == NULL)) OR ((database.server.userUID != %@) AND (%K == YES)))", v15, v9, @"isAudiobook", @"isAudiobook", v13, @"isAudiobook");
  objc_msgSend_addObject_(v4, v17, (uint64_t)v16, v18);

  return v4;
}

- (id)predicateForItems:(BOOL)a3 dsids:(id)a4
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v7, v8, v9);
  uint64_t v14 = objc_msgSend_activeStoreAccount(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_ams_DSID(v14, v15, v16, v17);

  if (v18)
  {
    uint64_t v21 = objc_msgSend_valueForKey_(v6, v19, @"stringValue", v20);
    v22 = (void *)v21;
    id v23 = (void *)MEMORY[0x263EFFA68];
    if (v21) {
      id v23 = (void *)v21;
    }
    id v24 = v23;

    id v27 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v25, @"database.server.userUID IN %@", v26, v24);

    uint64_t v30 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v28, (uint64_t)v27, v29);
    id v33 = objc_msgSend_platformPredicatesForItemsWithActiveUserID_(self, v31, (uint64_t)v18, v32);
    objc_msgSend_addObjectsFromArray_(v30, v34, (uint64_t)v33, v35);

    if (!a3)
    {
      uint64_t v38 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v36, @"(%K == NO OR %K == NULL)", v37, @"isHidden", @"isHidden");
      objc_msgSend_addObject_(v30, v39, (uint64_t)v38, v40);
    }
    id v41 = objc_alloc(MEMORY[0x263F08730]);
    uint64_t v43 = objc_msgSend_initWithType_subpredicates_(v41, v42, 1, (uint64_t)v30);
  }
  else
  {
    uint64_t v43 = objc_msgSend_predicateWithValue_(MEMORY[0x263F08A98], v19, 0, v20);
  }

  return v43;
}

- (id)predicateForBookletItems:(BOOL)a3 dsids:(id)a4
{
  id v5 = a4;
  uint64_t v9 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v6, v7, v8);
  uint64_t v13 = objc_msgSend_activeStoreAccount(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_ams_DSID(v13, v14, v15, v16);

  if (v17)
  {
    uint64_t v20 = objc_msgSend_valueForKey_(v5, v18, @"stringValue", v19);
    uint64_t v21 = (void *)v20;
    v22 = (void *)MEMORY[0x263EFFA68];
    if (v20) {
      v22 = (void *)v20;
    }
    id v23 = v22;

    uint64_t v26 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v24, @"parentItem.database.server.userUID IN %@", v25, v23);

    uint64_t v31 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v27, (uint64_t)v26, v28);
    if (!a3)
    {
      uint64_t v32 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v29, @"(parentItem.%K == NO OR parentItem.%K == NULL)", v30, @"isHidden", @"isHidden");
      objc_msgSend_addObject_(v31, v33, (uint64_t)v32, v34);
    }
    id v35 = objc_alloc(MEMORY[0x263F08730]);
    uint64_t v37 = objc_msgSend_initWithType_subpredicates_(v35, v36, 1, (uint64_t)v31);
  }
  else
  {
    uint64_t v37 = objc_msgSend_predicateWithValue_(MEMORY[0x263F08A98], v18, 0, v19);
  }

  return v37;
}

- (id)fetchRequestForAllCloudIDs:(id)a3 dsids:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_msgSend_itemsFetchRequestForDSIDs_(self, v8, (uint64_t)v6, v9);
  uint64_t v14 = objc_msgSend_count(v7, v11, v12, v13);
  uint64_t v18 = objc_msgSend_count(v6, v15, v16, v17);

  objc_msgSend_setFetchLimit_(v10, v19, v18 * v14, v20);
  uint64_t v21 = (void *)MEMORY[0x263EFF980];
  uint64_t v25 = objc_msgSend_predicate(v10, v22, v23, v24);
  uint64_t v28 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v26, @"cloudID IN %@", v27, v7);

  uint64_t v31 = objc_msgSend_arrayWithObjects_(v21, v29, (uint64_t)v25, v30, v28, 0);

  id v32 = objc_alloc(MEMORY[0x263F08730]);
  uint64_t v34 = objc_msgSend_initWithType_subpredicates_(v32, v33, 1, (uint64_t)v31);
  objc_msgSend_setPredicate_(v10, v35, (uint64_t)v34, v36);

  return v10;
}

- (id)fetchRequestForStoreIDs:(id)a3 dsids:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_msgSend_itemsFetchRequestForDSIDs_(self, v8, (uint64_t)v6, v9);
  uint64_t v14 = objc_msgSend_count(v7, v11, v12, v13);
  uint64_t v18 = objc_msgSend_count(v6, v15, v16, v17);

  objc_msgSend_setFetchLimit_(v10, v19, v18 * v14, v20);
  uint64_t v21 = (void *)MEMORY[0x263EFF980];
  uint64_t v25 = objc_msgSend_predicate(v10, v22, v23, v24);
  uint64_t v28 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v26, @"storeID IN %@", v27, v7);

  uint64_t v31 = objc_msgSend_arrayWithObjects_(v21, v29, (uint64_t)v25, v30, v28, 0);

  id v32 = objc_alloc(MEMORY[0x263F08730]);
  uint64_t v34 = objc_msgSend_initWithType_subpredicates_(v32, v33, 1, (uint64_t)v31);
  objc_msgSend_setPredicate_(v10, v35, (uint64_t)v34, v36);

  return v10;
}

- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_msgSend_allItemsFetchRequestForDSIDs_(self, v8, (uint64_t)v6, v9);
  uint64_t v14 = objc_msgSend_count(v7, v11, v12, v13);
  uint64_t v18 = objc_msgSend_count(v6, v15, v16, v17);

  objc_msgSend_setFetchLimit_(v10, v19, v18 * v14, v20);
  uint64_t v21 = (void *)MEMORY[0x263EFF980];
  uint64_t v25 = objc_msgSend_predicate(v10, v22, v23, v24);
  uint64_t v28 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v26, @"storeID IN %@", v27, v7);

  uint64_t v31 = objc_msgSend_arrayWithObjects_(v21, v29, (uint64_t)v25, v30, v28, 0);

  id v32 = objc_alloc(MEMORY[0x263F08730]);
  uint64_t v34 = objc_msgSend_initWithType_subpredicates_(v32, v33, 1, (uint64_t)v31);
  objc_msgSend_setPredicate_(v10, v35, (uint64_t)v34, v36);

  return v10;
}

- (id)fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:(id)a3 dsids:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = objc_msgSend_allItemsFetchRequestForDSIDs_(self, v8, (uint64_t)v6, v9);
  uint64_t v14 = objc_msgSend_count(v7, v11, v12, v13);
  uint64_t v18 = objc_msgSend_count(v6, v15, v16, v17);

  objc_msgSend_setFetchLimit_(v10, v19, v18 * v14, v20);
  uint64_t v21 = (void *)MEMORY[0x263EFF980];
  uint64_t v25 = objc_msgSend_predicate(v10, v22, v23, v24);
  uint64_t v28 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v26, @"storeID IN %@", v27, v7);
  uint64_t v31 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v29, @"purchasedTokenCode != NULL and purchasedTokenCode != 0", v30, v7);

  uint64_t v34 = objc_msgSend_arrayWithObjects_(v21, v32, (uint64_t)v25, v33, v28, v31, 0);

  id v35 = objc_alloc(MEMORY[0x263F08730]);
  uint64_t v37 = objc_msgSend_initWithType_subpredicates_(v35, v36, 1, (uint64_t)v34);
  objc_msgSend_setPredicate_(v10, v38, (uint64_t)v37, v39);

  return v10;
}

- (id)fetchRequestForAllStoreIDs:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x263EFF260];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v9 = objc_msgSend_fetchRequestWithEntityName_(v4, v7, (uint64_t)v6, v8);

  uint64_t v13 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v10, v11, v12);
  uint64_t v17 = objc_msgSend_activeStoreAccount(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_ams_DSID(v17, v18, v19, v20);

  if (v21)
  {
    uint64_t v24 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v25 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], v22, @"artist", 1);
    uint64_t v28 = objc_msgSend_arrayWithObject_(v24, v26, (uint64_t)v25, v27);
    objc_msgSend_setSortDescriptors_(v9, v29, (uint64_t)v28, v30);
  }
  uint64_t v31 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v22, @"storeID IN %@", v23, v3);
  objc_msgSend_setPredicate_(v9, v32, (uint64_t)v31, v33);

  return v9;
}

- (id)fetchRequestForNeedsImport:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x263EFF260];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v10 = objc_msgSend_fetchRequestWithEntityName_(v5, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_predicateForNeedsImport_(self, v11, v3, v12);
  objc_msgSend_setPredicate_(v10, v14, (uint64_t)v13, v15);

  return v10;
}

- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4 isImported:(BOOL)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_fetchRequestForAllStoreIDs_dsids_isImported_includeHidden_, a3, a4);
}

- (id)fetchRequestForAllStoreIDs:(id)a3 dsids:(id)a4 isImported:(BOOL)a5 includeHidden:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v9 = objc_msgSend_fetchRequestForAllStoreIDs_dsids_(self, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  uint64_t v14 = objc_msgSend_predicate(v9, v11, v12, v13);
  uint64_t v17 = objc_msgSend_predicateForNeedsImport_(self, v15, !v7, v16);
  uint64_t v20 = objc_msgSend_arrayWithObjects_(v10, v18, (uint64_t)v14, v19, v17, 0);

  if (!a6)
  {
    uint64_t v23 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v21, @"(%K == NO OR %K == NULL)", v22, @"isHidden", @"isHidden");
    objc_msgSend_addObject_(v20, v24, (uint64_t)v23, v25);
  }
  id v26 = objc_alloc(MEMORY[0x263F08730]);
  uint64_t v28 = objc_msgSend_initWithType_subpredicates_(v26, v27, 1, (uint64_t)v20);
  objc_msgSend_setPredicate_(v9, v29, (uint64_t)v28, v30);

  return v9;
}

- (id)predicateForNeedsImport:(BOOL)a3
{
  if (a3) {
    objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], a2, @"(%K == YES)", v3, @"needsImport", @"needsImport");
  }
  else {
  id v5 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], a2, @"(%K == NO OR %K == NULL)", v3, @"needsImport", @"needsImport");
  }
  uint64_t v8 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v6, (uint64_t)v5, v7);
  uint64_t v12 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v9, v10, v11);
  uint64_t v16 = objc_msgSend_activeStoreAccount(v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_ams_DSID(v16, v17, v18, v19);
  uint64_t v21 = (void *)v20;
  uint64_t v22 = &unk_26CEE4060;
  if (v20) {
    uint64_t v22 = (void *)v20;
  }
  id v23 = v22;

  id v26 = objc_msgSend_platformPredicatesForItemsWithActiveUserID_(self, v24, (uint64_t)v23, v25);

  objc_msgSend_addObjectsFromArray_(v8, v27, (uint64_t)v26, v28);
  uint64_t v31 = objc_msgSend_andPredicateWithSubpredicates_(MEMORY[0x263F08730], v29, (uint64_t)v8, v30);

  return v31;
}

- (id)fetchRequestForBuyParameters:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v9 = objc_msgSend_fetchRequestWithEntityName_(v3, v7, (uint64_t)v6, v8);

  uint64_t v12 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v10, @"storeDownloadParameters == %@", v11, v4);

  objc_msgSend_setPredicate_(v9, v13, (uint64_t)v12, v14);

  return v9;
}

- (id)fetchRequestForNotInStoreAccountIDs:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v9 = objc_msgSend_fetchRequestWithEntityName_(v3, v7, (uint64_t)v6, v8);

  uint64_t v12 = objc_msgSend_valueForKey_(v4, v10, @"stringValue", v11);

  uint64_t v15 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v13, @"NOT (storeAccountID IN %@)", v14, v12);
  objc_msgSend_setPredicate_(v9, v16, (uint64_t)v15, v17);

  return v9;
}

- (id)predicateForStoreAccountID:(id)a3 storeIDs:(id)a4
{
  v48[2] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F08A98];
  id v7 = a4;
  uint64_t v11 = objc_msgSend_stringValue(a3, v8, v9, v10);
  uint64_t v14 = objc_msgSend_predicateWithFormat_(v6, v12, @"storeAccountID = %@", v13, v11);
  uint64_t v17 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v15, @"storeID IN %@", v16, v7, v14);

  v48[1] = v17;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, (uint64_t)v48, 2);
  id v23 = objc_msgSend_mutableCopy(v19, v20, v21, v22);

  uint64_t v27 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v24, v25, v26);
  uint64_t v31 = objc_msgSend_activeStoreAccount(v27, v28, v29, v30);
  uint64_t v35 = objc_msgSend_ams_DSID(v31, v32, v33, v34);
  uint64_t v36 = (void *)v35;
  uint64_t v37 = &unk_26CEE4060;
  if (v35) {
    uint64_t v37 = (void *)v35;
  }
  id v38 = v37;

  id v41 = objc_msgSend_platformPredicatesForItemsWithActiveUserID_(self, v39, (uint64_t)v38, v40);

  objc_msgSend_addObjectsFromArray_(v23, v42, (uint64_t)v41, v43);
  uint64_t v46 = objc_msgSend_andPredicateWithSubpredicates_(MEMORY[0x263F08730], v44, (uint64_t)v23, v45);

  return v46;
}

- (id)fetchRequestForBookletItemsForStoreIDs:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v9 = objc_msgSend_fetchRequestWithEntityName_(v3, v7, (uint64_t)v6, v8);

  uint64_t v10 = (void *)MEMORY[0x263F08730];
  uint64_t v13 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v11, @"storeID IN %@", v12, v4);

  v22[0] = v13;
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v22, 1);
  uint64_t v18 = objc_msgSend_andPredicateWithSubpredicates_(v10, v16, (uint64_t)v15, v17);
  objc_msgSend_setPredicate_(v9, v19, (uint64_t)v18, v20);

  return v9;
}

- (id)fetchRequestForAllBookletsIDsWithParentStoreIDs:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v9 = objc_msgSend_fetchRequestWithEntityName_(v3, v7, (uint64_t)v6, v8);

  uint64_t v12 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v10, @"parentItem.storeID IN %@", v11, v4);

  objc_msgSend_setPredicate_(v9, v13, (uint64_t)v12, v14);
  objc_msgSend_setReturnsDistinctResults_(v9, v15, 1, v16);
  objc_msgSend_setResultType_(v9, v17, 2, v18);
  v29[0] = @"storeID";
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v29, 1);
  objc_msgSend_setPropertiesToGroupBy_(v9, v21, (uint64_t)v20, v22);

  uint64_t v28 = @"storeID";
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v23, (uint64_t)&v28, 1);
  objc_msgSend_setPropertiesToFetch_(v9, v25, (uint64_t)v24, v26);

  return v9;
}

- (id)fetchRequestForHiddenItemsWithAccountIDs:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v9 = objc_msgSend_fetchRequestWithEntityName_(v3, v7, (uint64_t)v6, v8);

  uint64_t v12 = objc_msgSend_valueForKey_(v4, v10, @"stringValue", v11);

  uint64_t v15 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v13, @"database.server.userUID IN %@", v14, v12);
  uint64_t v18 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v16, @"(%K == YES)", v17, @"isHidden");
  uint64_t v19 = (void *)MEMORY[0x263F08730];
  v28[0] = v15;
  v28[1] = v18;
  uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v20, (uint64_t)v28, 2);
  uint64_t v24 = objc_msgSend_andPredicateWithSubpredicates_(v19, v22, (uint64_t)v21, v23);
  objc_msgSend_setPredicate_(v9, v25, (uint64_t)v24, v26);

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)databaseContainerPath
{
  return self->_databaseContainerPath;
}

- (void)setDatabaseContainerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseContainerPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_psc, 0);
}

@end