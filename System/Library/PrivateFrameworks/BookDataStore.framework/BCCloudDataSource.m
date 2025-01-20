@interface BCCloudDataSource
+ (id)_documentsDirectoryURL;
+ (id)_sharedLegacyRootDirectoryURL;
+ (id)_sharedRootDirectoryURL;
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4 delegate:(id)a5;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6;
- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6 delegate:(id)a7;
- (BCCloudDataSourceDelegate)delegate;
- (BOOL)_addStoreAtURL:(id)a3;
- (BOOL)_deleteDirectoryForStoreAtURL:(id)a3;
- (BOOL)_directoryExistsForStoreAtURL:(id)a3;
- (BOOL)_setupPersistentStoreWithRootDirectoryURL:(id)a3 legacyRootDirectoryURL:(id)a4 nameOnDisk:(id)a5;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)_persistentStoreOptions;
- (void)_createDirectoryForStoreAtURL:(id)a3;
- (void)_logIf:(BOOL)a3 error:(id)a4 operation:(id)a5;
- (void)_migrateAndDestroyStoreAtLegacyURL:(id)a3 toModernURL:(id)a4;
- (void)_setupManagedObjectContext;
- (void)setDelegate:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
@end

@implementation BCCloudDataSource

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BCCloudDataSource;
  v5 = [(BCCloudDataSource *)&v36 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFF320]);
    uint64_t v13 = objc_msgSend_initWithManagedObjectModel_(v6, v7, (uint64_t)v4, v8, v9, v10, v11, v12);
    persistentStoreCoordinator = v5->_persistentStoreCoordinator;
    v5->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v13;

    v15 = v5->_persistentStoreCoordinator;
    uint64_t v16 = *MEMORY[0x263EFF000];
    v24 = objc_msgSend__persistentStoreOptions(v5, v17, v18, v19, v20, v21, v22, v23);
    id v27 = (id)objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(v15, v25, v16, 0, 0, (uint64_t)v24, 0, v26);

    objc_msgSend__setupManagedObjectContext(v5, v28, v29, v30, v31, v32, v33, v34);
  }

  return v5;
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4
{
  return (BCCloudDataSource *)((uint64_t (*)(BCCloudDataSource *, char *, id, id, void))MEMORY[0x270F9A6D0])(self, sel_initWithManagedObjectModel_nameOnDisk_delegate_, a3, a4, 0);
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v18 = objc_msgSend__sharedRootDirectoryURL(BCCloudDataSource, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend__sharedLegacyRootDirectoryURL(BCCloudDataSource, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v29 = (BCCloudDataSource *)objc_msgSend_initWithManagedObjectModel_rootDirectoryURL_legacyRootDirectoryURL_nameOnDisk_delegate_(self, v27, (uint64_t)v10, (uint64_t)v18, (uint64_t)v26, (uint64_t)v9, (uint64_t)v8, v28);

  return v29;
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6
{
  return (BCCloudDataSource *)objc_msgSend_initWithManagedObjectModel_rootDirectoryURL_legacyRootDirectoryURL_nameOnDisk_delegate_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, 0, v6);
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  kdebug_trace();
  v56.receiver = self;
  v56.super_class = (Class)BCCloudDataSource;
  id v17 = [(BCCloudDataSource *)&v56 init];
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x263EFF320]);
    uint64_t v25 = objc_msgSend_initWithManagedObjectModel_(v18, v19, (uint64_t)v12, v20, v21, v22, v23, v24);
    uint64_t v26 = (void *)*((void *)v17 + 2);
    *((void *)v17 + 2) = v25;

    objc_storeWeak((id *)v17 + 3, v16);
    if (objc_msgSend__setupPersistentStoreWithRootDirectoryURL_legacyRootDirectoryURL_nameOnDisk_(v17, v27, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, v28, v29, v30)&& (objc_msgSend_persistentStores(*((void **)v17 + 2), v31, v32, v33, v34, v35, v36, v37), v38 = objc_claimAutoreleasedReturnValue(), uint64_t v46 = objc_msgSend_count(v38, v39, v40, v41, v42, v43, v44, v45), v38, v46))
    {
      objc_msgSend__setupManagedObjectContext(v17, v47, v48, v49, v50, v51, v52, v53);
    }
    else
    {
      v54 = BDSCloudKitLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        sub_2361FBFD8((uint64_t *)v17 + 2, v54);
      }
    }
  }
  kdebug_trace();

  return (BCCloudDataSource *)v17;
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v13 = objc_msgSend_defaultManager(v4, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend__sharedLegacyRootDirectoryURL(a1, v14, v15, v16, v17, v18, v19, v20);
  objc_msgSend_removeItemAtURL_error_(v13, v22, (uint64_t)v21, 0, v23, v24, v25, v26);

  uint64_t v34 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v27, v28, v29, v30, v31, v32, v33);
  uint64_t v42 = objc_msgSend__sharedRootDirectoryURL(a1, v35, v36, v37, v38, v39, v40, v41);
  id v51 = 0;
  uint64_t v48 = objc_msgSend_removeItemAtURL_error_(v34, v43, (uint64_t)v42, (uint64_t)&v51, v44, v45, v46, v47);
  id v49 = v51;

  uint64_t v50 = (void (**)(void *, uint64_t, id))_Block_copy(v5);
  if (v50) {
    v50[2](v50, v48, v49);
  }
}

+ (id)_documentsDirectoryURL
{
  uint64_t v8 = NSURL;
  uint64_t v9 = objc_msgSend_applicationDocumentsDirectory(BDSApplication, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v15 = objc_msgSend_fileURLWithPath_isDirectory_(v8, v10, (uint64_t)v9, 1, v11, v12, v13, v14);

  return v15;
}

+ (id)_sharedRootDirectoryURL
{
  uint64_t v8 = objc_msgSend__documentsDirectoryURL(a1, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v14 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v8, v9, @"BCCloudData-iBooks", 1, v10, v11, v12, v13);

  return v14;
}

+ (id)_sharedLegacyRootDirectoryURL
{
  uint64_t v8 = objc_msgSend__documentsDirectoryURL(a1, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v14 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v8, v9, @"BCCloudAsset-iBooks", 1, v10, v11, v12, v13);

  return v14;
}

- (id)_persistentStoreOptions
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263EFF070];
  v8[0] = *MEMORY[0x263EFF008];
  v8[1] = v5;
  v9[0] = MEMORY[0x263EFFA88];
  v9[1] = MEMORY[0x263EFFA88];
  v8[2] = *MEMORY[0x263EFF0B0];
  v9[2] = MEMORY[0x263EFFA88];
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v9, (uint64_t)v8, 3, v2, v3, v4);
  return v6;
}

- (void)_logIf:(BOOL)a3 error:(id)a4 operation:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v6)
  {
    uint64_t v9 = BDSCloudKitLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2361FC054((uint64_t)v8, v7, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (BOOL)_setupPersistentStoreWithRootDirectoryURL:(id)a3 legacyRootDirectoryURL:(id)a4 nameOnDisk:(id)a5
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(a3, v10, (uint64_t)v9, 1, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v15, v16, (uint64_t)v9, 0, v17, v18, v19, v20);
  if ((objc_msgSend__directoryExistsForStoreAtURL_(self, v22, (uint64_t)v21, v23, v24, v25, v26, v27) & 1) == 0)
  {
    uint64_t v34 = objc_msgSend_URLByAppendingPathComponent_(v8, v28, (uint64_t)v9, v29, v30, v31, v32, v33);
    objc_msgSend__createDirectoryForStoreAtURL_(self, v35, (uint64_t)v21, v36, v37, v38, v39, v40);
    if (objc_msgSend__directoryExistsForStoreAtURL_(self, v41, (uint64_t)v34, v42, v43, v44, v45, v46))
    {
      objc_msgSend__migrateAndDestroyStoreAtLegacyURL_toModernURL_(self, v47, (uint64_t)v34, (uint64_t)v21, v48, v49, v50, v51);
    }
    else
    {
      uint64_t v52 = BDSCloudKitLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        int v122 = 138412290;
        id v123 = v34;
        _os_log_impl(&dword_2360BC000, v52, OS_LOG_TYPE_DEFAULT, "Unable to migrate legacy database since file does not exist at URL %@", (uint8_t *)&v122, 0xCu);
      }
    }
  }
  if (!BDSIsInternalInstall()) {
    goto LABEL_14;
  }
  v60 = objc_msgSend_books(MEMORY[0x263F2BA40], v53, v54, v55, v56, v57, v58, v59);
  v68 = objc_msgSend_userDefaults(v60, v61, v62, v63, v64, v65, v66, v67);

  v75 = objc_msgSend_stringForKey_(v68, v69, @"BDSDevelopmentForceAddStoreFailureOnce", v70, v71, v72, v73, v74);
  if (!objc_msgSend_isEqual_(v75, v76, (uint64_t)v9, v77, v78, v79, v80, v81))
  {

LABEL_14:
    int v89 = objc_msgSend__addStoreAtURL_(self, v53, (uint64_t)v21, v55, v56, v57, v58, v59);
    int v90 = 0;
    goto LABEL_15;
  }
  v82 = BDSCloudKitLog();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    int v122 = 138543874;
    id v123 = v9;
    __int16 v124 = 2160;
    uint64_t v125 = 1752392040;
    __int16 v126 = 2112;
    v127 = v21;
    _os_log_impl(&dword_2360BC000, v82, OS_LOG_TYPE_DEFAULT, "_setupPersistentStoreWithRootDirectoryURL -- Forcing store failure once for %{public}@, url: %{mask.hash}@", (uint8_t *)&v122, 0x20u);
  }

  objc_msgSend_removeObjectForKey_(v68, v83, @"BDSDevelopmentForceAddStoreFailureOnce", v84, v85, v86, v87, v88);
  int v89 = 0;
  int v90 = 1;
LABEL_15:
  v91 = BDSCloudKitLog();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
  {
    int v122 = 138412546;
    id v123 = v21;
    __int16 v124 = 1024;
    LODWORD(v125) = v89;
    _os_log_impl(&dword_2360BC000, v91, OS_LOG_TYPE_DEFAULT, "_setupPersistentStoreWithRootDirectoryURL: %@, storeAdded: %d", (uint8_t *)&v122, 0x12u);
  }

  if (v89) {
    goto LABEL_26;
  }
  v92 = BDSCloudKitLog();
  v93 = v92;
  if (v90)
  {
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      sub_2361FC164(v93);
    }
  }
  else if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
  {
    sub_2361FC1A8(v93);
  }

  if (objc_msgSend__deleteDirectoryForStoreAtURL_(self, v94, (uint64_t)v21, v95, v96, v97, v98, v99))
  {
    objc_msgSend__createDirectoryForStoreAtURL_(self, v100, (uint64_t)v21, v101, v102, v103, v104, v105);
    v113 = objc_msgSend_delegate(self, v106, v107, v108, v109, v110, v111, v112);
    objc_msgSend_dataSource_storeDidReset_(v113, v114, (uint64_t)self, (uint64_t)v9, v115, v116, v117, v118);
  }
  if (objc_msgSend__addStoreAtURL_(self, v100, (uint64_t)v21, v101, v102, v103, v104, v105))
  {
LABEL_26:
    BOOL v119 = 1;
  }
  else
  {
    v120 = BDSCloudKitLog();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT)) {
      sub_2361FC120(v120);
    }

    BOOL v119 = 0;
  }

  return v119;
}

- (void)_setupManagedObjectContext
{
  id v3 = objc_alloc(MEMORY[0x263EFF288]);
  uint64_t v10 = (NSManagedObjectContext *)objc_msgSend_initWithConcurrencyType_(v3, v4, 1, v5, v6, v7, v8, v9);
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v10;

  objc_msgSend_setPersistentStoreCoordinator_(self->_managedObjectContext, v12, (uint64_t)self->_persistentStoreCoordinator, v13, v14, v15, v16, v17);
  uint64_t v23 = self->_managedObjectContext;
  MEMORY[0x270F9A6D0](v23, sel_setUndoManager_, 0, v18, v19, v20, v21, v22);
}

- (BOOL)_directoryExistsForStoreAtURL:(id)a3
{
  uint64_t v8 = objc_msgSend_URLByDeletingLastPathComponent(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  char v15 = objc_msgSend_checkResourceIsReachableAndReturnError_(v8, v9, 0, v10, v11, v12, v13, v14);

  return v15;
}

- (void)_createDirectoryForStoreAtURL:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  uint64_t v13 = objc_msgSend_defaultManager(v4, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_URLByDeletingLastPathComponent(v5, v14, v15, v16, v17, v18, v19, v20);

  id v30 = 0;
  LODWORD(v5) = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v13, v22, (uint64_t)v21, 1, 0, (uint64_t)&v30, v23, v24);
  id v25 = v30;

  objc_msgSend__logIf_error_operation_(self, v26, v5 ^ 1, (uint64_t)v25, @"creating directory for store", v27, v28, v29);
}

- (BOOL)_deleteDirectoryForStoreAtURL:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  uint64_t v13 = objc_msgSend_defaultManager(v4, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_URLByDeletingLastPathComponent(v5, v14, v15, v16, v17, v18, v19, v20);

  id v33 = 0;
  LODWORD(v5) = objc_msgSend_removeItemAtURL_error_(v13, v22, (uint64_t)v21, (uint64_t)&v33, v23, v24, v25, v26);
  id v27 = v33;

  objc_msgSend__logIf_error_operation_(self, v28, v5 ^ 1, (uint64_t)v27, @"deleting directory for store", v29, v30, v31);
  return (char)v5;
}

- (void)_migrateAndDestroyStoreAtLegacyURL:(id)a3 toModernURL:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BDSCloudKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v48 = v6;
    __int16 v49 = 2112;
    id v50 = v7;
    _os_log_impl(&dword_2360BC000, v8, OS_LOG_TYPE_INFO, "Migrating legacy cloud data source from %@ to %@", buf, 0x16u);
  }

  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  uint64_t v17 = objc_msgSend__persistentStoreOptions(self, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v25 = objc_msgSend__persistentStoreOptions(self, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v26 = *MEMORY[0x263EFF168];
  id v46 = 0;
  int v28 = objc_msgSend_replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_(persistentStoreCoordinator, v27, (uint64_t)v7, (uint64_t)v17, (uint64_t)v6, (uint64_t)v25, v26, (uint64_t)&v46);
  id v29 = v46;

  objc_msgSend__logIf_error_operation_(self, v30, v28 ^ 1u, (uint64_t)v29, @"[MIGRATE] migrate legacy store", v31, v32, v33);
  uint64_t v34 = BDSCloudKitLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v6;
    _os_log_impl(&dword_2360BC000, v34, OS_LOG_TYPE_INFO, "Destroying legacy cloud data source at %@", buf, 0xCu);
  }

  uint64_t v35 = self->_persistentStoreCoordinator;
  id v45 = 0;
  int v39 = objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(v35, v36, (uint64_t)v6, v26, 0, (uint64_t)&v45, v37, v38);
  id v40 = v45;
  objc_msgSend__logIf_error_operation_(self, v41, v39 ^ 1u, (uint64_t)v40, @"[MIGRATE] destroy legacy store", v42, v43, v44);
}

- (BOOL)_addStoreAtURL:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = objc_msgSend_lastPathComponent(v4, v6, v7, v8, v9, v10, v11, v12);
    *(_DWORD *)buf = 138412290;
    uint64_t v56 = v13;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_INFO, "Adding cloud data source persistent store for %@", buf, 0xCu);
  }
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  uint64_t v15 = *MEMORY[0x263EFF168];
  uint64_t v23 = objc_msgSend__persistentStoreOptions(self, v16, v17, v18, v19, v20, v21, v22);
  id v54 = 0;
  uint64_t v26 = objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(persistentStoreCoordinator, v24, v15, 0, (uint64_t)v4, (uint64_t)v23, (uint64_t)&v54, v25);
  id v27 = v54;

  if (objc_msgSend_isReadOnly(v26, v28, v29, v30, v31, v32, v33, v34))
  {
    id v40 = self->_persistentStoreCoordinator;
    id v53 = 0;
    int v41 = objc_msgSend_removePersistentStore_error_(v40, v35, (uint64_t)v26, (uint64_t)&v53, v36, v37, v38, v39);
    id v42 = v53;
    objc_msgSend__logIf_error_operation_(self, v43, v41 ^ 1u, (uint64_t)v42, @"removing read-only cloud data source persistent store", v44, v45, v46);

    uint64_t v51 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v47, @"BDSErrorDomain", 1002, 0, v48, v49, v50);

    uint64_t v26 = 0;
    id v27 = (id)v51;
  }
  if (v26) {
    objc_msgSend__logIf_error_operation_(self, v35, 0, (uint64_t)v27, @"adding cloud data source persistent store", v37, v38, v39);
  }
  else {
    objc_msgSend__logIf_error_operation_(self, v35, 1, (uint64_t)v27, @"adding cloud data source persistent store", v37, v38, v39);
  }

  return v26 != 0;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (BCCloudDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BCCloudDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end