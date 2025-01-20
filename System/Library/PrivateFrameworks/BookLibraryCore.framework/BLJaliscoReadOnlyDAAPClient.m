@interface BLJaliscoReadOnlyDAAPClient
+ (id)predicateForNonExplicitItems;
+ (id)sharedClient;
+ (id)sortByTitleDescriptor;
- (BLJaliscoReadOnlyDAAPClient)initWithIdentifier:(id)a3 databaseContainerPath:(id)a4 accountDSID:(id)a5;
- (BOOL)_setupCoreDataStack;
- (BOOL)p_createPersistentDirectoryIfNeeded;
- (NSManagedObjectContext)moc;
- (NSManagedObjectModel)model;
- (NSNumber)currentAccountDSID;
- (NSPersistentStoreCoordinator)psc;
- (NSString)databaseContainerPath;
- (NSString)identifier;
- (id)_itemsFetchRequestForDSIDs:(id)a3 excludeStoreIDs:(id)a4 isExplicitRestricted:(BOOL)a5;
- (id)fetchAllServerItemsForDSIDs:(id)a3;
- (id)fetchAllServerItemsWithPredicate:(id)a3 sortDescriptor:(id)a4;
- (id)fetchItemsForDSIDs:(id)a3 excludeStoreIDs:(id)a4 isExplicitRestricted:(BOOL)a5;
- (id)fetchItemsForStoreIDs:(id)a3;
- (id)fetchServerItemsForStoreIDs:(id)a3 andDSIDS:(id)a4;
- (id)p_allItemsFetchRequestForDSIDs:(id)a3;
- (id)p_allItemsFetchRequestForDSIDs:(id)a3 matchingSearchString:(id)a4 isExplicitRestricted:(BOOL)a5;
- (id)p_fetchRequestForStoreIDs:(id)a3 dsids:(id)a4;
- (id)p_itemsFetchRequestIncludingHiddenItems:(BOOL)a3 dsids:(id)a4;
- (id)p_persistentStoreDirectory;
- (id)p_persistentStoreFullPathAtSharediBooksLocation;
- (id)predicateForItems:(BOOL)a3 dsids:(id)a4;
- (id)predicateToExcludeStoreIDs:(id)a3;
- (id)searchAllServerItemsForDSIDs:(id)a3 matchingSearchString:(id)a4 isExplicitRestricted:(BOOL)a5;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)dealloc;
- (void)setCurrentAccountDSID:(id)a3;
- (void)setDatabaseContainerPath:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMoc:(id)a3;
- (void)setModel:(id)a3;
- (void)setPsc:(id)a3;
@end

@implementation BLJaliscoReadOnlyDAAPClient

+ (id)sharedClient
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AB3FF40);
  if (!qword_26AB3FFA8)
  {
    v2 = [BLJaliscoReadOnlyDAAPClient alloc];
    v6 = objc_msgSend_defaultIdentifier(BLJaliscoVersion, v3, v4, v5);
    v10 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v7, v8, v9);
    v14 = objc_msgSend_activeStoreAccount(v10, v11, v12, v13);
    v18 = objc_msgSend_ams_DSID(v14, v15, v16, v17);
    uint64_t v20 = objc_msgSend_initWithIdentifier_databaseContainerPath_accountDSID_(v2, v19, (uint64_t)v6, 0, v18);
    v21 = (void *)qword_26AB3FFA8;
    qword_26AB3FFA8 = v20;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AB3FF40);
  v22 = (void *)qword_26AB3FFA8;

  return v22;
}

- (BLJaliscoReadOnlyDAAPClient)initWithIdentifier:(id)a3 databaseContainerPath:(id)a4 accountDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BLJaliscoReadOnlyDAAPClient;
  v14 = [(BLJaliscoReadOnlyDAAPClient *)&v32 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    databaseContainerPath = v14->_databaseContainerPath;
    v14->_databaseContainerPath = (NSString *)v20;

    objc_storeStrong((id *)&v14->_currentAccountDSID, a5);
    if (!objc_msgSend__setupCoreDataStack(v14, v22, v23, v24))
    {
      v30 = 0;
      goto LABEL_6;
    }
    v28 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v25, v26, v27);
    objc_msgSend_addObserver_accountTypes_(v28, v29, (uint64_t)v14, 1);
  }
  v30 = v14;
LABEL_6:

  return v30;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3);
  objc_msgSend_removeObserver_accountTypes_(v5, v6, (uint64_t)self, 1);

  model = self->_model;
  self->_model = 0;

  psc = self->_psc;
  self->_psc = 0;

  moc = self->_moc;
  self->_moc = 0;

  v10.receiver = self;
  v10.super_class = (Class)BLJaliscoReadOnlyDAAPClient;
  [(BLJaliscoReadOnlyDAAPClient *)&v10 dealloc];
}

- (id)fetchAllServerItemsForDSIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  moc = self->_moc;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21E0349F8;
  v14[3] = &unk_26448BF70;
  v14[4] = self;
  id v15 = v4;
  id v7 = v5;
  id v16 = v7;
  id v8 = v4;
  objc_msgSend_performBlockAndWait_(moc, v9, (uint64_t)v14, v10);
  v11 = v16;
  id v12 = v7;

  return v12;
}

- (id)searchAllServerItemsForDSIDs:(id)a3 matchingSearchString:(id)a4 isExplicitRestricted:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_21E034CC0;
  uint64_t v26 = sub_21E034CD0;
  id v27 = (id)objc_opt_new();
  moc = self->_moc;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21E034CD8;
  v17[3] = &unk_26448CD28;
  v17[4] = self;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  BOOL v21 = a5;
  id v19 = v12;
  uint64_t v20 = &v22;
  objc_msgSend_performBlockAndWait_(moc, v13, (uint64_t)v17, v14);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)fetchAllServerItemsWithPredicate:(id)a3 sortDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  moc = self->_moc;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21E034F1C;
  v18[3] = &unk_26448AD90;
  id v19 = v6;
  id v20 = v7;
  BOOL v21 = self;
  id v10 = v8;
  id v22 = v10;
  id v11 = v7;
  id v12 = v6;
  objc_msgSend_performBlockAndWait_(moc, v13, (uint64_t)v18, v14);
  id v15 = v22;
  id v16 = v10;

  return v16;
}

- (id)fetchServerItemsForStoreIDs:(id)a3 andDSIDS:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  moc = self->_moc;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21E03519C;
  v18[3] = &unk_26448AD90;
  void v18[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v10 = v8;
  id v21 = v10;
  id v11 = v7;
  id v12 = v6;
  objc_msgSend_performBlockAndWait_(moc, v13, (uint64_t)v18, v14);
  id v15 = v21;
  id v16 = v10;

  return v16;
}

- (id)fetchItemsForStoreIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  moc = self->_moc;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21E0353BC;
  v14[3] = &unk_26448BF70;
  v14[4] = self;
  id v15 = v4;
  id v7 = v5;
  id v16 = v7;
  id v8 = v4;
  objc_msgSend_performBlockAndWait_(moc, v9, (uint64_t)v14, v10);
  id v11 = v16;
  id v12 = v7;

  return v12;
}

- (id)fetchItemsForDSIDs:(id)a3 excludeStoreIDs:(id)a4 isExplicitRestricted:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  moc = self->_moc;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_21E035618;
  v20[3] = &unk_26448CD50;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  BOOL v24 = a5;
  id v12 = v10;
  id v23 = v12;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend_performBlockAndWait_(moc, v15, (uint64_t)v20, v16);
  uint64_t v17 = v23;
  id v18 = v12;

  return v18;
}

+ (id)predicateForNonExplicitItems
{
  return (id)objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], a2, @"(%K == NO OR %K == NULL)", v2, @"isExplicit", @"isExplicit");
}

+ (id)sortByTitleDescriptor
{
  return (id)objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], a2, @"title", 1);
}

- (id)predicateToExcludeStoreIDs:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    id v9 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v7, @"NOT (storeID IN %@)", v8, v3);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_setupCoreDataStack
{
  v75[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  id v7 = objc_msgSend_bundleForClass_(v3, v5, v4, v6);
  id v9 = objc_msgSend_pathForResource_ofType_(v7, v8, @"BKPurchases", @"momd");

  if (!v9) {
    objc_msgSend_raise_format_(MEMORY[0x263EFF940], v10, @"[BLJaliscoServerSource managedObjectModel]", @"[[NSBundle bundleForClass:[self class]] pathForResource:@'BKPurchases' ofType:@'momd'] failed");
  }
  id v11 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v10, (uint64_t)v9, 1);
  id v12 = objc_alloc(MEMORY[0x263EFF298]);
  id v15 = (NSManagedObjectModel *)objc_msgSend_initWithContentsOfURL_(v12, v13, (uint64_t)v11, v14);
  model = self->_model;
  self->_model = v15;

  if (!self->_model)
  {
    id v50 = objc_alloc(MEMORY[0x263EFF940]);
    v53 = objc_msgSend_stringWithFormat_(NSString, v51, @"Failed to load model %@", v52, v11);
    id v55 = (id)objc_msgSend_initWithName_reason_userInfo_(v50, v54, @"Nil jalisco model", (uint64_t)v53, 0);

    objc_exception_throw(v55);
  }
  uint64_t v18 = *MEMORY[0x263EFF0E0];
  v74[0] = *MEMORY[0x263EFF138];
  v74[1] = v18;
  uint64_t v19 = *MEMORY[0x263F080B0];
  v75[0] = MEMORY[0x263EFFA88];
  v75[1] = v19;
  id v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v75, (uint64_t)v74, 2);
  id v21 = NSURL;
  v25 = objc_msgSend_p_persistentStoreFullPathAtSharediBooksLocation(self, v22, v23, v24);
  id v27 = objc_msgSend_fileURLWithPath_isDirectory_(v21, v26, (uint64_t)v25, 0);

  id v28 = objc_alloc(MEMORY[0x263EFF320]);
  v31 = (NSPersistentStoreCoordinator *)objc_msgSend_initWithManagedObjectModel_(v28, v29, (uint64_t)self->_model, v30);
  psc = self->_psc;
  self->_psc = v31;

  v33 = self->_psc;
  uint64_t v34 = *MEMORY[0x263EFF168];
  v71[0] = 0;
  v36 = objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(v33, v35, v34, 0, v27, v20, v71);
  id v37 = v71[0];
  if (!v36)
  {
    id v56 = objc_alloc(MEMORY[0x263EFF940]);
    v62 = objc_msgSend_stringWithFormat_(NSString, v57, @"Failed to create a moc for the persistent store %@", v58, v27);
    uint64_t v72 = *MEMORY[0x263F08608];
    v63 = v37;
    if (!v37)
    {
      v63 = objc_msgSend_null(MEMORY[0x263EFF9D0], v59, v60, v61);
    }
    v73 = v63;
    v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)&v73, (uint64_t)&v72, 1);
    id v66 = (id)objc_msgSend_initWithName_reason_userInfo_(v56, v65, @"Nil jalisco persistentStore", (uint64_t)v62, v64);

    if (!v37) {
LABEL_13:
    }

    objc_exception_throw(v66);
  }
  id v38 = objc_alloc(MEMORY[0x263EFF288]);
  v41 = (NSManagedObjectContext *)objc_msgSend_initWithConcurrencyType_(v38, v39, 1, v40);
  moc = self->_moc;
  self->_moc = v41;

  objc_msgSend_setPersistentStoreCoordinator_(self->_moc, v43, (uint64_t)self->_psc, v44);
  objc_msgSend_setUndoManager_(self->_moc, v45, 0, v46);
  objc_msgSend_setMergePolicy_(self->_moc, v47, *MEMORY[0x263EFF068], v48);
  if (!self->_moc)
  {
    id v67 = objc_alloc(MEMORY[0x263EFF940]);
    v62 = objc_msgSend_stringWithFormat_(NSString, v68, @"Failed to create a moc for the persistent store %@", v69, v27);
    id v66 = (id)objc_msgSend_initWithName_reason_userInfo_(v67, v70, @"Nil jalisco moc", (uint64_t)v62, 0);
    goto LABEL_13;
  }

  return 1;
}

- (id)p_allItemsFetchRequestForDSIDs:(id)a3
{
  return (id)objc_msgSend_p_itemsFetchRequestIncludingHiddenItems_dsids_(self, a2, 1, (uint64_t)a3);
}

- (id)p_allItemsFetchRequestForDSIDs:(id)a3 matchingSearchString:(id)a4 isExplicitRestricted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x263EFF260];
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  id v15 = objc_msgSend_fetchRequestWithEntityName_(v10, v13, (uint64_t)v12, v14);

  uint64_t v19 = objc_msgSend_currentAccountDSID(self, v16, v17, v18);
  if (v19 && (uint64_t v23 = (void *)v19, v24 = objc_msgSend_length(v9, v20, v21, v22), v23, v24))
  {
    id v69 = v8;
    v25 = objc_msgSend_valueForKey_(v8, v20, @"stringValue", v22);
    uint64_t v26 = NSString;
    v29 = objc_msgSend_escapedPatternForString_(MEMORY[0x263F08AE8], v27, (uint64_t)v9, v28);
    objc_super v32 = objc_msgSend_stringWithFormat_(v26, v30, @".*\\b%@.*", v31, v29);

    uint64_t v35 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v33, @"database.server.userUID IN %@", v34, v25);
    id v38 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v36, @"(%K == NO OR %K == NULL)", v37, @"isHidden", @"isHidden");
    v41 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v39, @"(%K MATCHES[cd] %@ OR %K MATCHES[cd] %@)", v40, @"title", v32, @"artist", v32);
    id v42 = objc_alloc(MEMORY[0x263EFF980]);
    v70 = (void *)v35;
    v45 = objc_msgSend_initWithObjects_(v42, v43, v35, v44, v38, v41, 0);
    if (v5)
    {
      uint64_t v46 = objc_opt_class();
      id v50 = objc_msgSend_predicateForNonExplicitItems(v46, v47, v48, v49);
      objc_msgSend_addObject_(v45, v51, (uint64_t)v50, v52);
    }
    id v53 = objc_alloc(MEMORY[0x263F08730]);
    id v55 = objc_msgSend_initWithType_subpredicates_(v53, v54, 1, (uint64_t)v45);
    objc_msgSend_setPredicate_(v15, v56, (uint64_t)v55, v57);

    uint64_t v58 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v60 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], v59, @"sortedTitle", 1);
    v63 = objc_msgSend_arrayWithObject_(v58, v61, (uint64_t)v60, v62);
    objc_msgSend_setSortDescriptors_(v15, v64, (uint64_t)v63, v65);

    id v8 = v69;
  }
  else
  {
    v25 = objc_msgSend_predicateWithValue_(MEMORY[0x263F08A98], v20, 0, v22);
    objc_msgSend_setPredicate_(v15, v66, (uint64_t)v25, v67);
  }

  return v15;
}

- (id)p_fetchRequestForStoreIDs:(id)a3 dsids:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_p_allItemsFetchRequestForDSIDs_(self, v8, (uint64_t)v7, v9);
  if (objc_msgSend_count(v7, v11, v12, v13))
  {
    uint64_t v17 = objc_msgSend_count(v6, v14, v15, v16);
    uint64_t v21 = objc_msgSend_count(v7, v18, v19, v20);
    objc_msgSend_setFetchLimit_(v10, v22, v21 * v17, v23);
  }
  uint64_t v24 = (void *)MEMORY[0x263EFF980];
  v25 = objc_msgSend_predicate(v10, v14, v15, v16);
  uint64_t v28 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v26, @"storeID IN %@", v27, v6);
  uint64_t v31 = objc_msgSend_arrayWithObjects_(v24, v29, (uint64_t)v25, v30, v28, 0);

  id v32 = objc_alloc(MEMORY[0x263F08730]);
  uint64_t v34 = objc_msgSend_initWithType_subpredicates_(v32, v33, 1, (uint64_t)v31);
  objc_msgSend_setPredicate_(v10, v35, (uint64_t)v34, v36);

  return v10;
}

- (id)predicateForItems:(BOOL)a3 dsids:(id)a4
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_currentAccountDSID(self, v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_opt_new();
    if (objc_msgSend_count(v6, v14, v15, v16))
    {
      uint64_t v19 = objc_msgSend_valueForKey_(v6, v17, @"stringValue", v18);
      uint64_t v22 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v20, @"database.server.userUID IN %@", v21, v19);
      objc_msgSend_addObject_(v13, v23, (uint64_t)v22, v24);
    }
    if (!a3)
    {
      v25 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v17, @"(%K == NO OR %K == NULL)", v18, @"isHidden", @"isHidden");
      objc_msgSend_addObject_(v13, v26, (uint64_t)v25, v27);
    }
    id v28 = objc_alloc(MEMORY[0x263F08730]);
    uint64_t v30 = objc_msgSend_initWithType_subpredicates_(v28, v29, 1, (uint64_t)v13);
  }
  else
  {
    uint64_t v30 = objc_msgSend_predicateWithValue_(MEMORY[0x263F08A98], v11, 0, v12);
  }

  return v30;
}

- (id)p_itemsFetchRequestIncludingHiddenItems:(BOOL)a3 dsids:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x263EFF260];
  id v7 = a4;
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v12 = objc_msgSend_fetchRequestWithEntityName_(v6, v10, (uint64_t)v9, v11);

  uint64_t v14 = objc_msgSend_predicateForItems_dsids_(self, v13, v4, (uint64_t)v7);

  objc_msgSend_setPredicate_(v12, v15, (uint64_t)v14, v16);
  uint64_t v20 = objc_msgSend_currentAccountDSID(self, v17, v18, v19);

  if (v20)
  {
    uint64_t v22 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v23 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], v21, @"artist", 1);
    uint64_t v26 = objc_msgSend_arrayWithObject_(v22, v24, (uint64_t)v23, v25);
    objc_msgSend_setSortDescriptors_(v12, v27, (uint64_t)v26, v28);
  }

  return v12;
}

- (id)_itemsFetchRequestForDSIDs:(id)a3 excludeStoreIDs:(id)a4 isExplicitRestricted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v11 = objc_msgSend_p_itemsFetchRequestIncludingHiddenItems_dsids_(self, v10, 0, (uint64_t)v9);
  uint64_t v15 = objc_msgSend_count(v9, v12, v13, v14);

  if (v15)
  {
    uint64_t v19 = (void *)MEMORY[0x263EFF980];
    uint64_t v20 = objc_msgSend_predicate(v11, v16, v17, v18);
    uint64_t v23 = objc_msgSend_arrayWithObject_(v19, v21, (uint64_t)v20, v22);

    v29 = objc_msgSend_predicateToExcludeStoreIDs_(self, v24, (uint64_t)v8, v25);
    if (v29) {
      objc_msgSend_addObject_(v23, v26, (uint64_t)v29, v28);
    }
    if (v5)
    {
      uint64_t v30 = objc_msgSend_predicateForNonExplicitItems(BLJaliscoReadOnlyDAAPClient, v26, v27, v28);
      objc_msgSend_addObject_(v23, v31, (uint64_t)v30, v32);
    }
    v33 = objc_msgSend_andPredicateWithSubpredicates_(MEMORY[0x263F08730], v26, (uint64_t)v23, v28);
    objc_msgSend_setPredicate_(v11, v34, (uint64_t)v33, v35);

    uint64_t v36 = (void *)MEMORY[0x263EFF8C0];
    id v38 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], v37, @"sortedTitle", 1);
    v41 = objc_msgSend_arrayWithObject_(v36, v39, (uint64_t)v38, v40);
    objc_msgSend_setSortDescriptors_(v11, v42, (uint64_t)v41, v43);
  }
  else
  {
    uint64_t v23 = objc_msgSend_predicateWithValue_(MEMORY[0x263F08A98], v16, 0, v18);
    objc_msgSend_setPredicate_(v11, v44, (uint64_t)v23, v45);
  }

  return v11;
}

- (id)p_persistentStoreDirectory
{
  BOOL v4 = objc_msgSend_databaseContainerPath(self, a2, v2, v3);
  if (!objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_bu_booksGroupContainerDocumentsURL(NSURL, v8, v9, v10);
    uint64_t v15 = objc_msgSend_path(v11, v12, v13, v14);

    uint64_t v18 = objc_msgSend_stringByAppendingPathComponent_(v15, v16, @"BKJaliscoServerSource", v17);

    BOOL v4 = (void *)v18;
  }

  return v4;
}

- (BOOL)p_createPersistentDirectoryIfNeeded
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend_p_persistentStoreDirectory(self, a2, v2, v3);
  uint64_t v6 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v5, (uint64_t)v4, 1);
  uint64_t v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9);
  uint64_t v14 = objc_msgSend_relativePath(v6, v11, v12, v13);
  id v20 = 0;
  char v16 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v10, v15, (uint64_t)v14, 1, 0, &v20);
  id v17 = v20;

  if (v17)
  {
    uint64_t v18 = BLJaliscoLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v6;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "BLJaliscoReadOnlyDAAPClient: Failed to create a persistent store directory at URL %@. Error: %@", buf, 0x16u);
    }
  }
  return v16;
}

- (id)p_persistentStoreFullPathAtSharediBooksLocation
{
  BOOL v4 = objc_msgSend_p_persistentStoreDirectory(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_persistentStoreFileName(BLJaliscoVersion, v5, v6, v7);
  uint64_t v11 = objc_msgSend_stringByAppendingPathComponent_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  if (a4)
  {
    objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, a3, a4);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend_activeStoreAccount(v14, v5, v6, v7);
    objc_msgSend_ams_DSID(v8, v9, v10, v11);
    uint64_t v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    currentAccountDSID = self->_currentAccountDSID;
    self->_currentAccountDSID = v12;
  }
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSPersistentStoreCoordinator)psc
{
  return self->_psc;
}

- (void)setPsc:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
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

- (NSNumber)currentAccountDSID
{
  return self->_currentAccountDSID;
}

- (void)setCurrentAccountDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAccountDSID, 0);
  objc_storeStrong((id *)&self->_databaseContainerPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_psc, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end