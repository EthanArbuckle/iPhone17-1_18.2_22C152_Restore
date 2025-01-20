@interface CSUSearchableKnowledgeObjectStore
- (BOOL)countEntries:(unint64_t *)a3 error:(id *)a4;
- (BOOL)deleteAllEntities:(id *)a3;
- (BOOL)deleteEntityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 error:(id *)a5;
- (BOOL)deleteEntityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 locale:(id)a5 error:(id *)a6;
- (BOOL)fetchMetadataToMemory:(id *)a3;
- (BOOL)initDB:(id)a3 atURL:(id)a4 error:(id *)a5;
- (BOOL)saveDatabase:(id)a3 error:(id *)a4;
- (BOOL)saveMetadataToStore:(id *)a3;
- (BOOL)setTaxonomyVersion:(int)a3 error:(id *)a4;
- (BOOL)storeEntity:(id)a3 uniqueIdWriteback:(unint64_t *)a4 error:(id *)a5;
- (NSPersistentContainer)persistentContainer;
- (id)entityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 error:(id *)a5;
- (id)entityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 locale:(id)a5 error:(id *)a6;
- (id)fetchEntitiesWithPredicate:(id)a3 error:(id *)a4;
- (id)getDbObjectByIdentifier:(unint64_t)a3 idType:(signed __int16)a4 context:(id)a5 error:(id *)a6;
- (id)getStore:(id *)a3;
- (id)initDB:(id)a3 atPath:(id)a4 error:(id *)a5;
- (id)initDB:(id)a3 error:(id *)a4;
- (id)initExistingDB:(id)a3 atPath:(id)a4 error:(id *)a5;
- (id)initExistingDB:(id)a3 error:(id *)a4;
- (int)getTaxonomyVersion:(id *)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation CSUSearchableKnowledgeObjectStore

- (id)initDB:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSUSearchableKnowledgeObjectStore;
  v12 = [(CSUSearchableKnowledgeObjectStore *)&v17 init];
  if (v12)
  {
    v13 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v10, (uint64_t)v9, 1, v11);
    if (objc_msgSend_initDB_atURL_error_(v12, v14, (uint64_t)v8, (uint64_t)v13, (uint64_t)a5)) {
      v15 = v12;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)initExistingDB:(id)a3 atPath:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v10 = a4;
  if (v10)
  {
    v34.receiver = self;
    v34.super_class = (Class)CSUSearchableKnowledgeObjectStore;
    v15 = [(CSUSearchableKnowledgeObjectStore *)&v34 init];
    if (v15)
    {
      v16 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13, v14);
      if (objc_msgSend_fileExistsAtPath_(v16, v17, (uint64_t)v10, v18, v19))
      {
        v24 = objc_msgSend_fileURLWithPath_(NSURL, v20, (uint64_t)v10, v21, v22);
        if (v24)
        {
          if (objc_msgSend_initDB_atURL_error_(v15, v23, (uint64_t)v8, (uint64_t)v24, (uint64_t)a5))
          {
            v25 = v15;
            goto LABEL_17;
          }
        }
        else if (a5)
        {
          v30 = (void *)MEMORY[0x263F087E8];
          uint64_t v35 = *MEMORY[0x263F08320];
          v36 = @"Invalid path. Failed to create fileUrl from path.";
          v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)&v36, (uint64_t)&v35, 1);
          objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, @"com.apple.coresceneunderstanding", 15, (uint64_t)v31);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = 0;
        goto LABEL_17;
      }
      if (!a5)
      {
        v25 = 0;
LABEL_18:
        self = v15;
        goto LABEL_19;
      }
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      v38 = @"File does not exist.";
      v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)&v38, (uint64_t)&v37, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v29, @"com.apple.coresceneunderstanding", 15, (uint64_t)v24);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    self = 0;
  }
  else if (a5)
  {
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40[0] = @"File path is empty.";
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v40, (uint64_t)&v39, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v26, v27, @"com.apple.coresceneunderstanding", 15, (uint64_t)v16);
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_20;
  }
  v25 = 0;
LABEL_20:

  return v25;
}

- (id)initExistingDB:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend_stringByAppendingPathComponent_(a3, a2, @"CSUTaxonomy.sqlite", (uint64_t)a4, v4);
  inited = objc_msgSend_initExistingDB_atPath_error_(self, v8, @"CSUTaxonomy", (uint64_t)v7, (uint64_t)a4);

  return inited;
}

- (id)initDB:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend_stringByAppendingPathComponent_(a3, a2, @"CSUTaxonomy.sqlite", (uint64_t)a4, v4);
  inited = objc_msgSend_initDB_atPath_error_(self, v8, @"CSUTaxonomy", (uint64_t)v7, (uint64_t)a4);

  return inited;
}

- (id)getStore:(id *)a3
{
  v6 = objc_msgSend_persistentContainer(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_persistentStoreCoordinator(v6, v7, v8, v9, v10);
  v16 = objc_msgSend_persistentStores(v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_firstObject(v16, v17, v18, v19, v20);

  if (v21)
  {
    id v25 = v21;
  }
  else if (a3)
  {
    objc_msgSend_errorForDatabase_(CSUError, v22, @"Failed to load persistent store", v23, v24);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (BOOL)fetchMetadataToMemory:(id *)a3
{
  v5 = objc_msgSend_getStore_(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = v5;
  if (v5)
  {
    uint64_t v11 = objc_msgSend_metadata(v5, v6, v7, v8, v9);
    uint64_t v16 = objc_msgSend_mutableCopy(v11, v12, v13, v14, v15);
    objc_super v17 = (void *)qword_26B17C808;
    qword_26B17C808 = v16;

    if (!qword_26B17C808)
    {
      uint64_t v22 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v18, v19, v20, v21);
      uint64_t v23 = (void *)qword_26B17C808;
      qword_26B17C808 = v22;
    }
  }

  return v10 != 0;
}

- (BOOL)saveMetadataToStore:(id *)a3
{
  v5 = objc_msgSend_getStore_(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v9 = v5;
  if (v5) {
    objc_msgSend_setMetadata_(v5, v6, qword_26B17C808, v7, v8);
  }

  return v9 != 0;
}

- (BOOL)initDB:(id)a3 atURL:(id)a4 error:(id *)a5
{
  v73[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x263F086E0];
  uint64_t v11 = objc_opt_class();
  uint64_t v15 = objc_msgSend_bundleForClass_(v10, v12, v11, v13, v14);
  uint64_t v21 = objc_msgSend_URLForResource_withExtension_(v15, v16, @"CSUSearchableObjectKnowledgeStorage", @"momd", v17);
  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x263EFF298]);
    v29 = objc_msgSend_initWithContentsOfURL_(v22, v23, (uint64_t)v21, v24, v25);
    if (v29)
    {
      v30 = objc_msgSend_persistentContainerWithName_managedObjectModel_(MEMORY[0x263EFF2E8], v26, (uint64_t)v8, (uint64_t)v29, v28);
      objc_msgSend_setPersistentContainer_(self, v31, (uint64_t)v30, v32, v33);

      id v34 = objc_alloc(MEMORY[0x263EFF328]);
      v63 = objc_msgSend_initWithURL_(v34, v35, (uint64_t)v9, v36, v37);
      v73[0] = v63;
      v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)v73, 1, v39);
      v45 = objc_msgSend_persistentContainer(self, v41, v42, v43, v44);
      objc_msgSend_setPersistentStoreDescriptions_(v45, v46, (uint64_t)v40, v47, v48);

      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = sub_24C68B018;
      v71 = sub_24C68B028;
      id v72 = 0;
      dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
      v54 = objc_msgSend_persistentContainer(self, v50, v51, v52, v53);
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = sub_24C68B030;
      v64[3] = &unk_2652E7E48;
      v66 = &v67;
      v55 = v49;
      v65 = v55;
      objc_msgSend_loadPersistentStoresWithCompletionHandler_(v54, v56, (uint64_t)v64, v57, v58);

      dispatch_semaphore_wait(v55, 0xFFFFFFFFFFFFFFFFLL);
      v59 = (void *)v68[5];
      if (v59)
      {
        if (a5) {
          *a5 = v59;
        }
        int v60 = 1;
      }
      else
      {
        int v60 = 0;
      }

      _Block_object_dispose(&v67, 8);
    }
    else
    {
      if (a5)
      {
        objc_msgSend_errorForDatabase_(CSUError, v26, @"Failed to load model from url", v27, v28);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      int v60 = 1;
    }

    BOOL v61 = v60 == 0;
  }
  else if (a5)
  {
    objc_msgSend_errorForDatabase_(CSUError, v18, @"Error getting modelURL", v19, v20);
    BOOL v61 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v61 = 0;
  }

  return v61;
}

- (id)getDbObjectByIdentifier:(unint64_t)a3 idType:(signed __int16)a4 context:(id)a5 error:(id *)a6
{
  uint64_t v7 = a4;
  id v9 = a5;
  uint64_t UniqueDbId_idType = objc_msgSend_getUniqueDbId_idType_(CSUSearchableKnowledgeDBObject, v10, a3, v7, v11);
  uint64_t v16 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v13, @"CSUSearchableKnowledgeDBObject", v14, v15);
  uint64_t v20 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v17, @"dbUniqueId == %lld", v18, v19, UniqueDbId_idType);
  objc_msgSend_setPredicate_(v16, v21, (uint64_t)v20, v22, v23);
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_24C68B018;
  v55 = sub_24C68B028;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = sub_24C68B018;
  dispatch_semaphore_t v49 = sub_24C68B028;
  id v50 = 0;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  void v40[2] = sub_24C68B370;
  v40[3] = &unk_2652E7E70;
  uint64_t v43 = &v45;
  id v24 = v9;
  id v41 = v24;
  id v25 = v16;
  id v42 = v25;
  uint64_t v44 = &v51;
  objc_msgSend_performBlockAndWait_(v24, v26, (uint64_t)v40, v27, v28);
  uint64_t v33 = (void *)v46[5];
  if (v33)
  {
    if (objc_msgSend_count(v33, v29, v30, v31, v32))
    {
      v38 = objc_msgSend_firstObject((void *)v46[5], v34, v35, v36, v37);
      goto LABEL_7;
    }
  }
  else if (a6)
  {
    v38 = 0;
    *a6 = (id) v52[5];
    goto LABEL_7;
  }
  v38 = 0;
LABEL_7:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v38;
}

- (BOOL)saveDatabase:(id)a3 error:(id *)a4
{
  id v9 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_24C68B018;
  uint64_t v28 = sub_24C68B028;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (byte_2697ED7C0) {
    objc_msgSend_saveMetadataToStore_(self, v6, (uint64_t)a4, v7, v8);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_24C68B594;
  v16[3] = &unk_2652E7E98;
  id v10 = v9;
  id v17 = v10;
  uint64_t v18 = &v20;
  uint64_t v19 = &v24;
  objc_msgSend_performBlockAndWait_(v10, v11, (uint64_t)v16, v12, v13);
  int v14 = *((unsigned __int8 *)v21 + 24);
  if (*((unsigned char *)v21 + 24))
  {
    byte_2697ED7C0 = 0;
  }
  else if (a4)
  {
    *a4 = (id) v25[5];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v14 != 0;
}

- (id)fetchEntitiesWithPredicate:(id)a3 error:(id *)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v48 = a3;
  dispatch_semaphore_t v49 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v5, @"CSUSearchableKnowledgeDBObject", v6, v7);
  objc_msgSend_setPredicate_(v49, v8, (uint64_t)v48, v9, v10);
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_24C68B018;
  v86 = sub_24C68B028;
  id v87 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = sub_24C68B018;
  v80 = sub_24C68B028;
  id v81 = 0;
  uint64_t v15 = objc_msgSend_persistentContainer(self, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_newBackgroundContext(v15, v16, v17, v18, v19);

  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = sub_24C68BB64;
  v71[3] = &unk_2652E7E70;
  v74 = &v76;
  id v72 = v20;
  id v21 = v49;
  id v73 = v21;
  v75 = &v82;
  uint64_t v52 = v72;
  objc_msgSend_performBlockAndWait_(v72, v22, (uint64_t)v71, v23, v24);
  uint64_t v47 = v21;
  if (v77[5])
  {
    uint64_t v29 = objc_msgSend_array(MEMORY[0x263EFF980], v25, v26, v27, v28);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = (id)v77[5];
    uint64_t v53 = (void *)v29;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v67, (uint64_t)v88, 16);
    if (v34)
    {
      uint64_t v35 = *(void *)v68;
LABEL_4:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v68 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void *)(*((void *)&v67 + 1) + 8 * v36);
        uint64_t v61 = 0;
        v62 = &v61;
        uint64_t v63 = 0x3032000000;
        v64 = sub_24C68B018;
        v65 = sub_24C68B028;
        id v66 = 0;
        uint64_t v55 = 0;
        id v56 = &v55;
        uint64_t v57 = 0x3032000000;
        uint64_t v58 = sub_24C68B018;
        v59 = sub_24C68B028;
        id v60 = 0;
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = sub_24C68BBDC;
        v54[3] = &unk_2652E7E98;
        v54[4] = v37;
        v54[5] = &v61;
        v54[6] = &v55;
        objc_msgSend_performBlockAndWait_(v52, v31, (uint64_t)v54, v32, v33);
        uint64_t v41 = v62[5];
        if (v41)
        {
          objc_msgSend_addObject_(v53, v38, v62[5], v39, v40);
        }
        else
        {
          if (a4) {
            *a4 = (id) v56[5];
          }

          uint64_t v53 = 0;
        }
        _Block_object_dispose(&v55, 8);

        _Block_object_dispose(&v61, 8);
        if (!v41) {
          break;
        }
        if (v34 == ++v36)
        {
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v67, (uint64_t)v88, 16);
          if (v34) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v45 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v42, (uint64_t)v53, v43, v44);
  }
  else
  {
    uint64_t v45 = 0;
    if (a4) {
      *a4 = (id) v83[5];
    }
  }

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  return v45;
}

- (BOOL)storeEntity:(id)a3 uniqueIdWriteback:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v13 = objc_msgSend_persistentContainer(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_newBackgroundContext(v13, v14, v15, v16, v17);

  uint64_t v23 = objc_msgSend_qid(v8, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_idType(v8, v24, v25, v26, v27);
  uint64_t v30 = objc_msgSend_getDbObjectByIdentifier_idType_context_error_(self, v29, v23, v28, (uint64_t)v18, a5);
  uint64_t v34 = v30;
  if (v30)
  {
    objc_msgSend_copyFromEntity_(v30, v31, (uint64_t)v8, v32, v33);
  }
  else
  {
    uint64_t v37 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x263EFF240], v31, @"CSUSearchableKnowledgeDBObject", (uint64_t)v18, v33);
    objc_msgSend_copyFromEntity_(v37, v38, (uint64_t)v8, v39, v40);
  }
  char v45 = objc_msgSend_saveDatabase_error_(self, v35, (uint64_t)v18, (uint64_t)a5, v36);
  char v46 = v45 ^ 1;
  if (!a4) {
    char v46 = 1;
  }
  if ((v46 & 1) == 0)
  {
    uint64_t v47 = objc_msgSend_qid(v8, v41, v42, v43, v44);
    uint64_t v52 = objc_msgSend_idType(v8, v48, v49, v50, v51);
    *a4 = objc_msgSend_getUniqueDbId_idType_(CSUSearchableKnowledgeDBObject, v53, v47, v52, v54);
  }

  return v45;
}

- (id)entityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 locale:(id)a5 error:(id *)a6
{
  uint64_t v6 = objc_msgSend_entityForIdentifier_idType_error_(self, a2, a3, a4, (uint64_t)a6);
  return v6;
}

- (id)entityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v9 = objc_msgSend_persistentContainer(self, a2, a3, a4, (uint64_t)a5);
  uint64_t v14 = objc_msgSend_newBackgroundContext(v9, v10, v11, v12, v13);

  uint64_t v16 = objc_msgSend_getDbObjectByIdentifier_idType_context_error_(self, v15, a3, v6, (uint64_t)v14, a5);
  uint64_t v17 = v16;
  if (v16)
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    uint64_t v37 = sub_24C68B018;
    v38 = sub_24C68B028;
    id v39 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = sub_24C68B018;
    uint64_t v32 = sub_24C68B028;
    id v33 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_24C68C064;
    v24[3] = &unk_2652E7E98;
    id v25 = v16;
    uint64_t v26 = &v34;
    uint64_t v27 = &v28;
    objc_msgSend_performBlockAndWait_(v14, v18, (uint64_t)v24, v19, v20);
    uint64_t v21 = (void *)v35[5];
    if (v21)
    {
      id v22 = v21;
    }
    else if (a5)
    {
      *a5 = (id) v29[5];
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (BOOL)deleteEntityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 locale:(id)a5 error:(id *)a6
{
  return MEMORY[0x270F9A6D0](self, sel_deleteEntityForIdentifier_idType_error_, a3, a4, a6);
}

- (BOOL)deleteEntityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v9 = objc_msgSend_persistentContainer(self, a2, a3, a4, (uint64_t)a5);
  uint64_t v14 = objc_msgSend_newBackgroundContext(v9, v10, v11, v12, v13);

  uint64_t v16 = objc_msgSend_getDbObjectByIdentifier_idType_context_error_(self, v15, a3, v6, (uint64_t)v14, a5);
  if (v16)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = sub_24C68C23C;
    uint64_t v28 = &unk_2652E7EC0;
    id v17 = v14;
    id v29 = v17;
    id v30 = v16;
    objc_msgSend_performBlockAndWait_(v17, v18, (uint64_t)&v25, v19, v20);
    char v23 = objc_msgSend_saveDatabase_error_(self, v21, (uint64_t)v17, (uint64_t)a5, v22, v25, v26, v27, v28);
  }
  else
  {
    char v23 = 1;
  }

  return v23;
}

- (BOOL)deleteAllEntities:(id *)a3
{
  uint64_t v7 = objc_msgSend_fetchRequest(CSUSearchableKnowledgeDBObject, a2, (uint64_t)a3, v3, v4);
  id v8 = objc_alloc(MEMORY[0x263EFF1D0]);
  Request = objc_msgSend_initWithFetchRequest_(v8, v9, (uint64_t)v7, v10, v11);
  id v17 = objc_msgSend_persistentContainer(self, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_newBackgroundContext(v17, v18, v19, v20, v21);

  id v32 = 0;
  id v25 = (id)objc_msgSend_executeRequest_error_(v22, v23, (uint64_t)Request, (uint64_t)&v32, v24);
  id v26 = v32;
  id v29 = v26;
  if (v26)
  {
    char v30 = 0;
    if (a3) {
      *a3 = v26;
    }
  }
  else
  {
    char v30 = objc_msgSend_saveDatabase_error_(self, v27, (uint64_t)v22, (uint64_t)a3, v28);
  }

  return v30;
}

- (BOOL)countEntries:(unint64_t *)a3 error:(id *)a4
{
  id v8 = objc_msgSend_fetchRequest(CSUSearchableKnowledgeDBObject, a2, (uint64_t)a3, (uint64_t)a4, v4);
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_24C68B018;
  id v39 = sub_24C68B028;
  id v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v13 = objc_msgSend_persistentContainer(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_newBackgroundContext(v13, v14, v15, v16, v17);

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_24C68C57C;
  v26[3] = &unk_2652E7E70;
  id v29 = &v31;
  id v19 = v18;
  id v27 = v19;
  id v20 = v8;
  id v28 = v20;
  char v30 = &v35;
  objc_msgSend_performBlockAndWait_(v19, v21, (uint64_t)v26, v22, v23);
  *a3 = v32[3];
  uint64_t v24 = (void *)v36[5];
  if (a4 && v24) {
    *a4 = v24;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v24 == 0;
}

- (int)getTaxonomyVersion:(id *)a3
{
  uint64_t v6 = (void *)qword_26B17C808;
  if (!qword_26B17C808)
  {
    if (!objc_msgSend_fetchMetadataToMemory_(self, a2, (uint64_t)a3, v3, v4)) {
      return 0;
    }
    uint64_t v6 = (void *)qword_26B17C808;
  }
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v6, a2, @"TaxonomyVersion", v3, v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v12 = objc_msgSend_integerValue(v7, v8, v9, v10, v11);

    return v12;
  }
  else
  {

    return 0;
  }
}

- (BOOL)setTaxonomyVersion:(int)a3 error:(id *)a4
{
  v5 = a4;
  uint64_t v6 = *(void *)&a3;
  v51[1] = *MEMORY[0x263EF8340];
  if (qword_26B17C808 || (objc_msgSend_fetchMetadataToMemory_(self, a2, (uint64_t)a4, (uint64_t)a4, v4) & 1) == 0)
  {
    id v8 = objc_msgSend_numberWithInt_(NSNumber, a2, v6, (uint64_t)a4, v4);
    int v12 = objc_msgSend_objectForKeyedSubscript_((void *)qword_26B17C808, v9, @"TaxonomyVersion", v10, v11);
    int v17 = objc_msgSend_intValue(v12, v13, v14, v15, v16);

    if (v17 <= (int)v6)
    {
      uint64_t v31 = objc_msgSend_objectForKeyedSubscript_((void *)qword_26B17C808, v18, @"TaxonomyVersion", v19, v20);

      if (v31 == v8)
      {
        LOBYTE(v5) = 1;
        goto LABEL_12;
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_26B17C808, v32, (uint64_t)v8, @"TaxonomyVersion", v33);
      if (!objc_msgSend_saveMetadataToStore_(self, v34, (uint64_t)v5, v35, v36)) {
        goto LABEL_10;
      }
      byte_2697ED7C0 = 1;
      uint64_t v41 = objc_msgSend_persistentContainer(self, v37, v38, v39, v40);
      char v46 = objc_msgSend_newBackgroundContext(v41, v42, v43, v44, v45);

      LOBYTE(v5) = objc_msgSend_saveDatabase_error_(self, v47, (uint64_t)v46, (uint64_t)v5, v48);
    }
    else if (v5)
    {
      uint64_t v21 = NSString;
      uint64_t v22 = objc_msgSend_objectForKeyedSubscript_((void *)qword_26B17C808, v18, @"TaxonomyVersion", v19, v20);
      id v26 = objc_msgSend_stringWithFormat_(v21, v23, @"Setting version is too old. Already on %@, but setting to %d", v24, v25, v22, v6);

      id v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v50 = *MEMORY[0x263F08320];
      v51[0] = v26;
      id v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v51, (uint64_t)&v50, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, @"com.apple.coresceneunderstanding", 17, (uint64_t)v29);
      id *v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
      LOBYTE(v5) = 0;
    }
LABEL_12:

    return (char)v5;
  }
  LOBYTE(v5) = 0;
  return (char)v5;
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end