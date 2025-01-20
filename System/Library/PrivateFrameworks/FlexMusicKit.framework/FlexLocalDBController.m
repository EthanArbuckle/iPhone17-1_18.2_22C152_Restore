@interface FlexLocalDBController
- (BOOL)createSongEntryWithSongData:(id)a3 error:(id *)a4;
- (BOOL)deleteFieldsForSongUID:(id)a3 deletions:(id)a4 error:(id *)a5;
- (BOOL)updateSongWithData:(id)a3 error:(id *)a4;
- (FlexLocalDBController)initWithDestinationURL:(id)a3;
- (NSArray)allSongEntries;
- (NSDate)lastCloudCheckDate;
- (void)_insertFirstCloudCheckDate:(id)a3 andSave:(BOOL)a4;
- (void)setLastCloudCheckDate:(id)a3;
@end

@implementation FlexLocalDBController

- (FlexLocalDBController)initWithDestinationURL:(id)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)FlexLocalDBController;
  v6 = [(FlexLocalDBController *)&v51 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_destinationURL, a3);
    v8 = (void *)MEMORY[0x263F086E0];
    uint64_t v9 = objc_opt_class();
    v13 = objc_msgSend_bundleForClass_(v8, v10, v9, v11, v12);
    v16 = objc_msgSend_URLForResource_withExtension_(v13, v14, @"LocalDatabase", @"momd", v15);

    id v17 = objc_alloc(MEMORY[0x263EFF298]);
    v21 = objc_msgSend_initWithContentsOfURL_(v17, v18, (uint64_t)v16, v19, v20);
    uint64_t v24 = objc_msgSend_persistentContainerWithName_managedObjectModel_(MEMORY[0x263EFF2E8], v22, @"SongDatabase", (uint64_t)v21, v23);
    localSongDatabase = v7->_localSongDatabase;
    v7->_localSongDatabase = (NSPersistentContainer *)v24;

    v29 = objc_msgSend_URLByAppendingPathComponent_(v7->_destinationURL, v26, @"SongDatabase", v27, v28);
    v33 = objc_msgSend_URLByAppendingPathExtension_(v29, v30, @"sqlite", v31, v32);

    v37 = objc_msgSend_persistentStoreDescriptionWithURL_(MEMORY[0x263EFF328], v34, (uint64_t)v33, v35, v36);
    v52[0] = v37;
    v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)v52, 1, v39);
    objc_msgSend_setPersistentStoreDescriptions_(v7->_localSongDatabase, v41, (uint64_t)v40, v42, v43);

    v44 = v7->_localSongDatabase;
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = sub_217A413DC;
    v49[3] = &unk_2642B7238;
    v50 = v7;
    objc_msgSend_loadPersistentStoresWithCompletionHandler_(v44, v45, (uint64_t)v49, v46, v47);
  }
  return v7;
}

- (NSArray)allSongEntries
{
  if (objc_msgSend_isMainThread(MEMORY[0x263F08B88], a2, v2, v3, v4))
  {
    uint64_t v9 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v6, @"LocalSongs", v7, v8);
    v14 = objc_msgSend_viewContext(self->_localSongDatabase, v10, v11, v12, v13);
    id v24 = 0;
    id v17 = objc_msgSend_executeFetchRequest_error_(v14, v15, (uint64_t)v9, (uint64_t)&v24, v16);
    id v18 = v24;

    if (v17) {
      goto LABEL_9;
    }
    if (v18)
    {
      FlexLogForCategory(3uLL);
      uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_217A42E50(v18, v19, v20, v21, v22);
      }
    }
  }
  else
  {
    id v18 = 0;
  }
  id v17 = (void *)MEMORY[0x263EFFA68];
LABEL_9:

  return (NSArray *)v17;
}

- (BOOL)createSongEntryWithSongData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_217A4177C;
  id v24 = sub_217A4178C;
  id v25 = 0;
  objc_initWeak(&location, self->_backgroundContext);
  backgroundContext = self->_backgroundContext;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_217A41794;
  v14[3] = &unk_2642B7260;
  objc_copyWeak(&v18, &location);
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = &v20;
  id v17 = &v26;
  objc_msgSend_performBlockAndWait_(backgroundContext, v9, (uint64_t)v14, v10, v11);
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v12 = *((unsigned char *)v27 + 24);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (BOOL)updateSongWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_217A4177C;
  id v24 = sub_217A4178C;
  id v25 = 0;
  objc_initWeak(&location, self->_backgroundContext);
  backgroundContext = self->_backgroundContext;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_217A41E38;
  v14[3] = &unk_2642B7260;
  objc_copyWeak(&v18, &location);
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = &v20;
  id v17 = &v26;
  objc_msgSend_performBlockAndWait_(backgroundContext, v9, (uint64_t)v14, v10, v11);
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v12 = *((unsigned char *)v27 + 24);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (BOOL)deleteFieldsForSongUID:(id)a3 deletions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_217A4177C;
  char v29 = sub_217A4178C;
  id v30 = 0;
  objc_initWeak(&location, self->_backgroundContext);
  backgroundContext = self->_backgroundContext;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_217A42444;
  v18[3] = &unk_2642B7288;
  objc_copyWeak(&v23, &location);
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  uint64_t v21 = &v25;
  uint64_t v22 = &v31;
  objc_msgSend_performBlockAndWait_(backgroundContext, v13, (uint64_t)v18, v14, v15);
  if (a5) {
    *a5 = (id) v26[5];
  }
  char v16 = *((unsigned char *)v32 + 24);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v16;
}

- (NSDate)lastCloudCheckDate
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_217A4177C;
  id v20 = sub_217A4178C;
  id v21 = 0;
  id v5 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"LastCloudUpdate", v2, v3);
  backgroundContext = self->_backgroundContext;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_217A42954;
  v13[3] = &unk_2642B72B0;
  v13[4] = self;
  id v7 = v5;
  id v14 = v7;
  uint64_t v15 = &v16;
  objc_msgSend_performBlockAndWait_(backgroundContext, v8, (uint64_t)v13, v9, v10);
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return (NSDate *)v11;
}

- (void)setLastCloudCheckDate:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v5, @"LastCloudUpdate", v6, v7);
  backgroundContext = self->_backgroundContext;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_217A42B70;
  v15[3] = &unk_2642B72D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v4;
  id v10 = v4;
  id v11 = v8;
  objc_msgSend_performBlockAndWait_(backgroundContext, v12, (uint64_t)v15, v13, v14);
}

- (void)_insertFirstCloudCheckDate:(id)a3 andSave:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)MEMORY[0x263EFF240];
  backgroundContext = self->_backgroundContext;
  id v8 = a3;
  id v11 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(v6, v9, @"LastCloudUpdate", (uint64_t)backgroundContext, v10);
  objc_msgSend_setDate_(v11, v12, (uint64_t)v8, v13, v14);

  if (v4)
  {
    uint64_t v18 = self->_backgroundContext;
    id v25 = 0;
    char v19 = objc_msgSend_save_(v18, v15, (uint64_t)&v25, v16, v17);
    id v20 = v25;
    if ((v19 & 1) == 0)
    {
      FlexLogForCategory(0);
      id v21 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        sub_217A43090(v20, v21, v22, v23, v24);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundContext, 0);
  objc_storeStrong((id *)&self->_localSongDatabase, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end