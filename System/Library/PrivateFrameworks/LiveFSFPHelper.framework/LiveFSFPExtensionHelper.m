@interface LiveFSFPExtensionHelper
+ (id)getNSErrorFromLiveFSErrno:(int)a3;
+ (id)getNSErrorFromUnknownError:(id)a3;
- (BOOL)_hasManagerOrError:(id *)a3;
- (BOOL)_isLoggedInOrError:(id *)a3;
- (BOOL)_isLoggedInOrErrorLocked:(id *)a3;
- (BOOL)fetchRoot;
- (BOOL)idsPersist;
- (BOOL)isClusterDomain;
- (BOOL)isClusterMaster;
- (BOOL)isDead;
- (BOOL)isReadOnlyVolume;
- (BOOL)serverSearchUsesCS;
- (BOOL)supportsTagging;
- (BOOL)supportsTrash;
- (LiveFSClient)manager;
- (LiveFSFPExtensionHelper)init;
- (LiveFSVolumeClient)serviceClient;
- (NSString)clusterMasterID;
- (NSURL)docPath;
- (NSURL)mountPath;
- (NSXPCConnection)conn;
- (OS_dispatch_queue)enumeratorHelperQueue;
- (id)LiveFSDefaultMover;
- (id)URLForItemWithIdentifier:(id)a3;
- (id)clusterDomainItemsOrError:(id *)a3;
- (id)disconnectWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (id)ensureMountPathSetup;
- (id)enumeratorForContainerItemIdentifier:(id)a3 error:(id *)a4;
- (id)enumeratorForSearchQuery:(id)a3 error:(id *)a4;
- (id)fileProviderErrorFromFSError:(id)a3;
- (id)getEnumeratorForContainer:(id)a3;
- (id)getItemForFileHandle:(id)a3;
- (id)getItemForParent:(id)a3 name:(id)a4;
- (id)getVolumeManagerWithError:(id *)a3;
- (id)itemAtPath:(id)a3 parent:(id)a4;
- (id)itemAtPathLocked:(id)a3 parent:(id)a4;
- (id)itemAtPathLocked:(id)a3 parent:(id)a4 cachedOnly:(BOOL)a5;
- (id)itemForIdentifier:(id)a3 error:(id *)a4;
- (id)itemForIdentifierLocked:(id)a3 error:(id *)a4;
- (id)itemForPath:(id)a3 cachedOnly:(BOOL)a4 error:(id *)a5;
- (id)itemForURL:(id)a3 cachedOnly:(BOOL)a4 error:(id *)a5;
- (id)itemForURL:(id)a3 error:(id *)a4;
- (id)itemPathForURL:(id)a3;
- (id)makeVolumeListenerEndpointAndReturnError:(id *)a3;
- (id)makeVolumeListenerEndpointAndReturnErrorLocked:(id *)a3;
- (id)pathForInodeID:(id)a3 error:(id *)a4;
- (id)persistentIdentifierForItemAtURL:(id)a3;
- (id)supportedServiceSourcesForItemIdentifier:(id)a3 error:(id *)a4;
- (void)addDirContainer:(id)a3 forContainerID:(id)a4;
- (void)addFileHandle:(id)a3 toItem:(id)a4;
- (void)addItem:(id)a3 identifier:(id)a4 fileHandle:(id)a5;
- (void)createDirectoryWithName:(id)a3 inParentItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dispatchOntoRenameQueue:(id)a3;
- (void)enumerateRootContainer;
- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3;
- (void)getVolumeInfoLocked;
- (void)handleInterruption;
- (void)handleInvalidation;
- (void)importDocumentAtURL:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)init;
- (void)invalidate;
- (void)itemChangedAtURL:(id)a3;
- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4;
- (void)reIDItem:(id)a3 oldID:(id)a4;
- (void)refreshVolumeInfo;
- (void)removeEnumeratorForContainer:(id)a3;
- (void)removeEnumeratorForContainerLocked:(id)a3;
- (void)removeItem:(id)a3 parent:(id)a4 name:(id)a5 fileHandle:(id)a6;
- (void)renameItemWithIdentifier:(id)a3 toName:(id)a4 completionHandler:(id)a5;
- (void)reparentItem:(id)a3 oldID:(id)a4 oldParent:(id)a5 oldName:(id)a6 newParent:(id)a7 newName:(id)a8;
- (void)reparentItemWithIdentifier:(id)a3 toParentItemWithIdentifier:(id)a4 newName:(id)a5 completionHandler:(id)a6;
- (void)setClusterDomain:(BOOL)a3;
- (void)setClusterMaster:(BOOL)a3;
- (void)setFavoriteRank:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setFetchRoot:(BOOL)a3;
- (void)setLastUsedDate:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setMountPath:(id)a3;
- (void)setTagData:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)startProvidingItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)stopProvidingItemAtURL:(id)a3;
- (void)trashItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unlockWithPassword:(id)a3 remember:(BOOL)a4 completionHandler:(id)a5;
- (void)untrashItemWithIdentifier:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation LiveFSFPExtensionHelper

- (LiveFSFPExtensionHelper)init
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[LiveFSFPExtensionHelper init]";
    _os_log_impl(&dword_22CE49000, v4, OS_LOG_TYPE_DEFAULT, "%s starting", buf, 0xCu);
  }

  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    docPath = self->_docPath;
    providerName = self->providerName;
    v8 = [(NSFileProviderExtension *)self domain];
    v9 = [(NSFileProviderExtension *)self domain];
    if (v9)
    {
      v2 = [(NSFileProviderExtension *)self domain];
      v10 = [v2 identifier];
    }
    else
    {
      v10 = &stru_26E048A08;
    }
    *(_DWORD *)buf = 136316162;
    v45 = "-[LiveFSFPExtensionHelper init]";
    __int16 v46 = 2112;
    v47 = docPath;
    __int16 v48 = 2112;
    v49 = providerName;
    __int16 v50 = 2112;
    v51 = v8;
    __int16 v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_INFO, "%s starting for docpath %@, providerName %@, domain: %@, identifier; %@",
      buf,
      0x34u);
    if (v9)
    {
    }
  }

  v43.receiver = self;
  v43.super_class = (Class)LiveFSFPExtensionHelper;
  v11 = [(NSFileProviderExtension *)&v43 init];
  if (!v11) {
    goto LABEL_26;
  }
  v12 = livefs_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v11->_docPath;
    v14 = v11->providerName;
    v15 = [(NSFileProviderExtension *)v11 domain];
    v16 = [(NSFileProviderExtension *)v11 domain];
    if (v16)
    {
      v2 = [(NSFileProviderExtension *)v11 domain];
      v17 = [v2 identifier];
    }
    else
    {
      v17 = &stru_26E048A08;
    }
    *(_DWORD *)buf = 136316162;
    v45 = "-[LiveFSFPExtensionHelper init]";
    __int16 v46 = 2112;
    v47 = v13;
    __int16 v48 = 2112;
    v49 = v14;
    __int16 v50 = 2112;
    v51 = v15;
    __int16 v52 = 2112;
    v53 = v17;
    _os_log_impl(&dword_22CE49000, v12, OS_LOG_TYPE_INFO, "%s starting for docpath %@, providerName %@, domain: %@, identifier; %@",
      buf,
      0x34u);
    if (v16)
    {
    }
  }

  manager = v11->_manager;
  v11->_manager = 0;

  uint64_t v19 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  itemHandleMap = v11->itemHandleMap;
  v11->itemHandleMap = (NSMapTable *)v19;

  uint64_t v21 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  itemIDMap = v11->itemIDMap;
  v11->itemIDMap = (NSMapTable *)v21;

  uint64_t v23 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  enumerators = v11->enumerators;
  v11->enumerators = (NSMapTable *)v23;

  uint64_t v25 = objc_opt_new();
  itemCache = v11->itemCache;
  v11->itemCache = (LiveFSLRUCache *)v25;

  uint64_t v27 = objc_opt_new();
  serviceClient = v11->_serviceClient;
  v11->_serviceClient = (LiveFSVolumeClient *)v27;

  dispatch_queue_t v29 = dispatch_queue_create("com.apple.userfsfp.rename_queue", 0);
  renameUpdateQueue = v11->renameUpdateQueue;
  v11->renameUpdateQueue = (OS_dispatch_queue *)v29;

  if (v11->itemHandleMap && v11->itemCache && v11->_serviceClient && v11->itemIDMap && v11->enumerators)
  {
    v31 = [NSURL fileURLWithPath:@"/private/var/mobile/Library/LiveFiles"];
    conn = v11->_conn;
    v11->_conn = 0;

    [(LiveFSLRUCache *)v11->itemCache setCountLimit:128];
    v33 = v11->_docPath;
    v11->_docPath = v31;
    v34 = v31;

    v11->_supportsTagging = 0;
    v11->_isDead = 0;
    v35 = [[LiveFSThumbnailsServiceSource alloc] initWithFileProviderExtension:v11];
    thumbnailsServiceSource = v11->thumbnailsServiceSource;
    v11->thumbnailsServiceSource = v35;

    dispatch_queue_t v37 = dispatch_queue_create("com.apple.LiveFSFPEnumeratorHelperQueue", 0);
    enumeratorHelperQueue = v11->_enumeratorHelperQueue;
    v11->_enumeratorHelperQueue = (OS_dispatch_queue *)v37;

    v39 = livefs_std_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[LiveFSFPExtensionHelper init]";
      _os_log_impl(&dword_22CE49000, v39, OS_LOG_TYPE_DEFAULT, "%s done", buf, 0xCu);
    }

LABEL_26:
    v40 = v11;
    goto LABEL_30;
  }
  v41 = livefs_std_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    -[LiveFSFPExtensionHelper init]();
  }

  v40 = 0;
LABEL_30:

  return v40;
}

- (BOOL)serverSearchUsesCS
{
  return 0;
}

- (BOOL)supportsTrash
{
  return 0;
}

- (id)ensureMountPathSetup
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_mountPath)
  {
    v4 = 0;
    goto LABEL_21;
  }
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    docPath = v3->_docPath;
    providerName = v3->providerName;
    v8 = [(NSFileProviderExtension *)v3 domain];
    v9 = [(NSFileProviderExtension *)v3 domain];
    if (v9)
    {
      v2 = [(NSFileProviderExtension *)v3 domain];
      v10 = [v2 identifier];
    }
    else
    {
      v10 = @"N/A";
    }
    int v36 = 136316162;
    dispatch_queue_t v37 = "-[LiveFSFPExtensionHelper ensureMountPathSetup]";
    __int16 v38 = 2112;
    v39 = (__CFString *)docPath;
    __int16 v40 = 2112;
    v41 = (__CFString *)providerName;
    __int16 v42 = 2112;
    objc_super v43 = v8;
    __int16 v44 = 2112;
    v45 = v10;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_INFO, "%s starting for docpath %@, providerName %@, domain: %@, identifier: %@", (uint8_t *)&v36, 0x34u);
    if (v9)
    {
    }
  }

  if (!v3->_docPath) {
    goto LABEL_18;
  }
  if (!v3->providerName) {
    goto LABEL_18;
  }
  v11 = [(NSFileProviderExtension *)v3 domain];
  if (!v11) {
    goto LABEL_18;
  }
  v12 = [(NSFileProviderExtension *)v3 domain];
  v13 = [v12 identifier];
  BOOL v14 = v13 == 0;

  if (v14)
  {
LABEL_18:
    uint64_t v27 = livefs_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      if (v3->_docPath) {
        dispatch_queue_t v29 = &stru_26E048A08;
      }
      else {
        dispatch_queue_t v29 = @"doc path, ";
      }
      if (v3->providerName) {
        v30 = &stru_26E048A08;
      }
      else {
        v30 = @"provider name, ";
      }
      v31 = [(NSFileProviderExtension *)v3 domain];
      if (v31) {
        v32 = &stru_26E048A08;
      }
      else {
        v32 = @"domain, ";
      }
      v33 = [(NSFileProviderExtension *)v3 domain];
      v34 = [v33 identifier];
      dispatch_queue_t v37 = "-[LiveFSFPExtensionHelper ensureMountPathSetup]";
      v35 = @"domain identifier";
      int v36 = 136316162;
      if (v34) {
        v35 = &stru_26E048A08;
      }
      __int16 v38 = 2112;
      v39 = v29;
      __int16 v40 = 2112;
      v41 = v30;
      __int16 v42 = 2112;
      objc_super v43 = v32;
      __int16 v44 = 2112;
      v45 = v35;
      _os_log_error_impl(&dword_22CE49000, v27, OS_LOG_TYPE_ERROR, "%s - Missing %@%@%@%@", (uint8_t *)&v36, 0x34u);
    }
    v4 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    v15 = 0;
    goto LABEL_20;
  }
  v15 = [(NSURL *)v3->_docPath URLByAppendingPathComponent:v3->providerName isDirectory:1];
  v16 = [(NSFileProviderExtension *)v3 domain];
  v17 = [v16 identifier];
  uint64_t v18 = [v15 URLByAppendingPathComponent:v17 isDirectory:1];
  mountPath = v3->_mountPath;
  v3->_mountPath = (NSURL *)v18;

  if (v3->_clusterDomain)
  {
    v20 = [(NSFileProviderExtension *)v3 domain];
    uint64_t v21 = [v20 identifier];
    BOOL v22 = (unint64_t)[v21 length] > 6;

    if (!v22)
    {
      v4 = 0;
      v3->_clusterMaster = 1;
      goto LABEL_20;
    }
    v3->_clusterMaster = 0;
    uint64_t v23 = [(NSFileProviderExtension *)v3 domain];
    v24 = [v23 identifier];
    uint64_t v25 = [v24 substringToIndex:6];
    clusterMasterID = v3->_clusterMasterID;
    v3->_clusterMasterID = (NSString *)v25;
  }
  v4 = 0;
LABEL_20:

LABEL_21:
  objc_sync_exit(v3);

  return v4;
}

- (NSURL)mountPath
{
  return self->_mountPath;
}

- (void)getVolumeInfoLocked
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2810000000;
  v12 = &unk_22CE6D123;
  uint64_t v13 = 0;
  conn = self->_conn;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke;
  v8[3] = &unk_264934180;
  v8[4] = &v14;
  v4 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_2;
  v7[3] = &unk_264934270;
  v7[4] = &v14;
  v7[5] = &v20;
  [v4 getRootFileHandleWithError:v7];
  if (v21[5])
  {
    if (!v15[5])
    {
      v6[6] = MEMORY[0x263EF8330];
      v6[7] = 3221225472;
      v6[8] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_3;
      v6[9] = &unk_264934298;
      v6[10] = &v9;
      v6[11] = &v14;
      objc_msgSend(v4, "otherAttributeOf:named:requestID:reply:");
      if (!v15[5])
      {
        self->_idsPersist = v10[4] & 1;
        uint64_t v5 = v21[5];
        v6[0] = MEMORY[0x263EF8330];
        v6[1] = 3221225472;
        v6[2] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_4;
        v6[3] = &unk_264934298;
        v6[4] = &v9;
        v6[5] = &v14;
        [v4 otherAttributeOf:v5 named:@"_N_mntflags" requestID:-1 reply:v6];
        if (!v15[5])
        {
          self->_isReadOnlyVolume = v10[4] & 1;
          self->_supportsTagging = 1;
        }
      }
    }
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke(uint64_t a1, void *a2)
{
}

void __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void *__46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_3(uint64_t a1, uint64_t a2, id a3)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:a2];
    return (void *)MEMORY[0x270F9A758]();
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    result = (void *)[a3 bytes];
    *(void *)(v4 + 32) = *result;
  }
  return result;
}

void *__46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_4(uint64_t a1, uint64_t a2, id a3)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:a2];
    return (void *)MEMORY[0x270F9A758]();
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    result = (void *)[a3 bytes];
    *(void *)(v4 + 32) = *result;
  }
  return result;
}

- (void)refreshVolumeInfo
{
  obj = self;
  objc_sync_enter(obj);
  [(LiveFSFPExtensionHelper *)obj getVolumeInfoLocked];
  objc_sync_exit(obj);
}

- (id)itemPathForURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = [a3 standardizedURL];
  uint64_t v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    docPath = self->_docPath;
    providerName = self->providerName;
    uint64_t v9 = [(NSFileProviderExtension *)self domain];
    v10 = [(NSFileProviderExtension *)self domain];
    if (v10)
    {
      v3 = [(NSFileProviderExtension *)self domain];
      uint64_t v11 = [v3 identifier];
    }
    else
    {
      uint64_t v11 = &stru_26E048A08;
    }
    int v27 = 136316418;
    v28 = "-[LiveFSFPExtensionHelper itemPathForURL:]";
    __int16 v29 = 2112;
    v30 = v5;
    __int16 v31 = 2112;
    v32 = docPath;
    __int16 v33 = 2112;
    v34 = providerName;
    __int16 v35 = 2112;
    int v36 = v9;
    __int16 v37 = 2112;
    __int16 v38 = v11;
    _os_log_impl(&dword_22CE49000, v6, OS_LOG_TYPE_INFO, "%s starting for url %@, docpath %@, providerName %@, domain: %@, identifier; %@",
      (uint8_t *)&v27,
      0x3Eu);
    if (v10)
    {
    }
  }

  v12 = 0;
  if ([(LiveFSFPExtensionHelper *)self _isLoggedInOrError:0])
  {
    uint64_t v13 = [(NSURL *)self->_docPath URLByAppendingPathComponent:self->providerName isDirectory:1];
    uint64_t v14 = [(NSFileProviderExtension *)self domain];
    v15 = [v14 pathRelativeToDocumentStorage];
    uint64_t v16 = [v13 URLByAppendingPathComponent:v15 isDirectory:1];

    v17 = livefs_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      v28 = v16;
      _os_log_impl(&dword_22CE49000, v17, OS_LOG_TYPE_INFO, "perItemDirectory: %@", (uint8_t *)&v27, 0xCu);
    }

    uint64_t v18 = [v16 path];
    id v19 = [v5 path];
    if ([v19 hasPrefix:@"/var/mobile"])
    {
      uint64_t v20 = [@"/private" stringByAppendingString:v19];

      id v19 = (void *)v20;
    }
    if ([v19 hasPrefix:v18])
    {
      objc_msgSend(v19, "substringFromIndex:", -[__CFString length](v18, "length"));
      uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (([(__CFString *)v21 isEqualToString:&stru_26E048A08] & 1) != 0
        || [(__CFString *)v21 isEqualToString:@"/._"])
      {
        uint64_t v22 = livefs_std_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[LiveFSFPExtensionHelper itemPathForURL:]();
        }

        v12 = &stru_26E048A08;
        uint64_t v18 = v21;
      }
      else
      {
        if ([(__CFString *)v21 hasPrefix:@"/"])
        {
          uint64_t v24 = [(__CFString *)v21 substringFromIndex:1];

          uint64_t v21 = (__CFString *)v24;
        }
        id v25 = livefs_std_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[LiveFSFPExtensionHelper itemPathForURL:]();
        }

        uint64_t v18 = v21;
        v12 = v18;
      }
    }
    else
    {
      uint64_t v23 = livefs_std_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper itemPathForURL:]((uint64_t)v19);
      }

      v12 = 0;
    }
  }
  return v12;
}

- (id)itemForPath:(id)a3 cachedOnly:(BOOL)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(LiveFSFPExtensionHelper *)self ensureMountPathSetup];
  uint64_t v9 = v8;
  if (v8)
  {
    v10 = v8;
    uint64_t v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper itemForPath:cachedOnly:error:]();
    }

    v12 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    v10 = self;
    objc_sync_enter(v10);
    if ([(LiveFSFPExtensionHelper *)v10 _isLoggedInOrErrorLocked:0])
    {
      uint64_t v13 = livefs_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v7;
        _os_log_impl(&dword_22CE49000, v13, OS_LOG_TYPE_DEFAULT, "perItemPath is '%@'", (uint8_t *)&v19, 0xCu);
      }

      if (([v7 isEqualToString:&stru_26E048A08] & 1) != 0
        || ([v7 isEqualToString:@"._"] & 1) != 0
        || [v7 isEqualToString:@"/._"])
      {
        uint64_t v14 = livefs_std_log();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        uint64_t v16 = (void *)*MEMORY[0x263F053F0];
        if (v15)
        {
          int v19 = 138412290;
          id v20 = v16;
          _os_log_impl(&dword_22CE49000, v14, OS_LOG_TYPE_DEFAULT, "About to return ID %@", (uint8_t *)&v19, 0xCu);
        }

        v12 = [(LiveFSFPExtensionHelper *)v10 itemForIdentifierLocked:v16 error:0];
      }
      else
      {
        uint64_t v18 = [(LiveFSFPExtensionHelper *)v10 itemForIdentifierLocked:*MEMORY[0x263F053F0] error:0];
        v12 = [(LiveFSFPExtensionHelper *)v10 itemAtPathLocked:v7 parent:v18];
      }
    }
    else
    {
      v12 = 0;
    }
    objc_sync_exit(v10);
  }

  return v12;
}

- (id)itemForURL:(id)a3 cachedOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v8 = [(LiveFSFPExtensionHelper *)self itemPathForURL:a3];
  if (v8)
  {
    uint64_t v9 = [(LiveFSFPExtensionHelper *)self itemForPath:v8 cachedOnly:v6 error:a5];
    if (!a5) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (!a5) {
      goto LABEL_10;
    }
  }
  if (!v9 && !*a5)
  {
    *a5 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:2];
  }
LABEL_10:

  return v9;
}

- (id)itemForURL:(id)a3 error:(id *)a4
{
  return [(LiveFSFPExtensionHelper *)self itemForURL:a3 cachedOnly:0 error:a4];
}

- (id)fileProviderErrorFromFSError:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v12 = 0;
    goto LABEL_19;
  }
  BOOL v6 = [v4 domain];
  if (![v6 isEqualToString:*MEMORY[0x263F07F70]])
  {

    goto LABEL_11;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 516)
  {
LABEL_11:
    uint64_t v13 = [v5 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x263F08438]];

    if (v14)
    {
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", [v5 code]);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = v5;
    }
    id v12 = v15;
    goto LABEL_19;
  }
  id v8 = objc_msgSend(v5, "fp_collidingURL");
  if (v8)
  {
    uint64_t v9 = [(LiveFSFPExtensionHelper *)self itemForURL:v8 error:0];
    v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      uint64_t v18 = "-[LiveFSFPExtensionHelper fileProviderErrorFromFSError:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_error_impl(&dword_22CE49000, v10, OS_LOG_TYPE_ERROR, "%s: got error %@, URL %@, item %@", (uint8_t *)&v17, 0x2Au);
    }

    if (v9)
    {
      id v11 = [MEMORY[0x263F087E8] fileProviderErrorForCollisionWithItem:v9];
    }
    else
    {
      id v11 = v5;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = v5;
  }

LABEL_19:
  return v12;
}

- (void)handleInterruption
{
}

- (void)handleInvalidation
{
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 domain];
  id v4 = [v3 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_22CE49000, a2, v5, "extension invalidate called on %@", v6);
}

- (void)dispatchOntoRenameQueue:(id)a3
{
}

- (BOOL)_hasManagerOrError:(id *)a3
{
  if (self->_isDead)
  {
    if (a3)
    {
      getNSErrorFromLiveFSErrno();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v4 = livefs_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_22CE49000, v4, OS_LOG_TYPE_INFO, "Call to _hasManagerOrError after extension torn down", v12, 2u);
    }
LABEL_6:

    return 0;
  }
  if (!self->_manager)
  {
    uint64_t v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(LiveFSFPExtensionHelper *)v7 _hasManagerOrError:v9];
    }

    v10 = (LiveFSClient *)[MEMORY[0x263F52270] newConnectionForService:self->connectionURL];
    manager = self->_manager;
    self->_manager = v10;

    if (!self->_manager)
    {
      if (a3)
      {
        getNSErrorFromLiveFSErrno();
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v4 = livefs_std_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper _hasManagerOrError:]();
      }
      goto LABEL_6;
    }
  }
  return 1;
}

- (id)getVolumeManagerWithError:(id *)a3
{
  if (-[LiveFSFPExtensionHelper _hasManagerOrError:](self, "_hasManagerOrError:"))
  {
    uint64_t v5 = self->_manager;
  }
  else
  {
    BOOL v6 = livefs_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper getVolumeManagerWithError:]((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v5 = 0;
  }
  return v5;
}

- (id)makeVolumeListenerEndpointAndReturnErrorLocked:(id *)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (!-[LiveFSFPExtensionHelper _hasManagerOrError:](self, "_hasManagerOrError:"))
  {
LABEL_20:
    id v18 = 0;
    int v17 = 0;
    goto LABEL_21;
  }
  uint64_t v5 = [(NSFileProviderExtension *)self domain];
  if (!v5) {
    goto LABEL_13;
  }
  BOOL v6 = (void *)v5;
  uint64_t v7 = [(NSFileProviderExtension *)self domain];
  uint64_t v8 = [v7 identifier];
  if (!v8)
  {

    goto LABEL_13;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [(NSFileProviderExtension *)self domain];
  uint64_t v11 = [v10 identifier];
  int v12 = [v11 isEqualToString:&stru_26E048A08];

  if (v12)
  {
LABEL_13:
    uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1004 userInfo:0];
    if (v22)
    {
      __int16 v23 = livefs_std_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:]();
      }
    }
    if (a3) {
      *a3 = v22;
    }

    goto LABEL_20;
  }
  uint64_t v13 = livefs_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [(NSFileProviderExtension *)self domain];
    id v15 = [v14 identifier];
    *(_DWORD *)buf = 136315394;
    objc_super v43 = "-[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:]";
    __int16 v44 = 2112;
    v45 = v15;
    _os_log_impl(&dword_22CE49000, v13, OS_LOG_TYPE_DEFAULT, "%s: About to get listener for volume %@", buf, 0x16u);
  }
  manager = self->_manager;
  id v41 = 0;
  int v17 = [(LiveFSClient *)manager volumes:&v41];
  id v18 = v41;
  __int16 v19 = livefs_std_log();
  id v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:].cold.4();
    }

    id v21 = v18;
    id v20 = livefs_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:]();
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v43 = "-[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:]";
    __int16 v44 = 2112;
    v45 = v17;
    __int16 v46 = 2112;
    uint64_t v47 = 0;
    _os_log_impl(&dword_22CE49000, v20, OS_LOG_TYPE_DEFAULT, "%s: got vols %@ error %@", buf, 0x20u);
  }

  if (a3) {
    *a3 = v18;
  }

  if (!v17) {
    goto LABEL_21;
  }
  if ([v17 count])
  {
    v26 = [(NSFileProviderExtension *)self domain];
    int v27 = [v26 identifier];
    v28 = [v17 objectForKey:v27];

    if (v28)
    {
      __int16 v29 = self->_manager;
      v30 = [(NSFileProviderExtension *)self domain];
      __int16 v31 = [v30 identifier];
      uint64_t v24 = [(LiveFSClient *)v29 listenerForVolume:v31 error:a3];

      goto LABEL_22;
    }
    __int16 v33 = livefs_std_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:](v33, v34, v35, v36, v37, v38, v39, v40);
    }

    if (a3)
    {
      uint64_t v32 = 2;
      goto LABEL_39;
    }
LABEL_21:
    uint64_t v24 = 0;
    goto LABEL_22;
  }
  if (!a3) {
    goto LABEL_21;
  }
  uint64_t v32 = 65;
LABEL_39:
  +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:v32];
  uint64_t v24 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v24;
}

- (id)makeVolumeListenerEndpointAndReturnError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(LiveFSFPExtensionHelper *)v4 makeVolumeListenerEndpointAndReturnErrorLocked:a3];
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)_isLoggedInOrErrorLocked:(id *)a3
{
  uint64_t v5 = [(NSFileProviderExtension *)self domain];
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v6 = (void *)v5;
  uint64_t v7 = [(NSFileProviderExtension *)self domain];
  uint64_t v8 = [v7 identifier];
  if (!v8)
  {

    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [(NSFileProviderExtension *)self domain];
  uint64_t v11 = [v10 identifier];
  int v12 = [v11 isEqualToString:&stru_26E048A08];

  if (v12)
  {
LABEL_8:
    int v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1004 userInfo:0];
    if (!v14)
    {
LABEL_12:
      if (a3) {
        *a3 = v14;
      }

      LOBYTE(v16) = 0;
      return v16;
    }
    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:]();
    }
LABEL_11:

    goto LABEL_12;
  }
  if (self->_conn)
  {
    uint64_t v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.6(self, v13);
    }
LABEL_19:

    if (a3) {
      *a3 = 0;
    }
LABEL_21:
    LOBYTE(v16) = 1;
    return v16;
  }
  if (self->_clusterMaster)
  {
    uint64_t v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.5(self, v13);
    }
    goto LABEL_19;
  }
  BOOL isDead = self->_isDead;
  id v18 = livefs_std_log();
  __int16 v19 = v18;
  if (isDead)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22CE49000, v19, OS_LOG_TYPE_INFO, "isLoggedInOrError called on dead extension", (uint8_t *)buf, 2u);
    }

    int v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1004 userInfo:0];
    if (!v14) {
      goto LABEL_12;
    }
    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:]();
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:](self, v19);
  }

  uint64_t v16 = [(LiveFSFPExtensionHelper *)self makeVolumeListenerEndpointAndReturnError:a3];
  if (v16)
  {
    id v20 = (void *)v16;
    id v21 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v16];
    conn = self->_conn;
    self->_conn = v21;

    __int16 v23 = livefs_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      [(LiveFSFPExtensionHelper *)v23 _isLoggedInOrErrorLocked:v25];
    }

    v26 = self->_conn;
    int v27 = [MEMORY[0x263F52270] interfaceForListeners];
    [(NSXPCConnection *)v26 setRemoteObjectInterface:v27];

    v28 = self->_conn;
    __int16 v29 = [MEMORY[0x263F522B8] exportedClientInterface];
    [(NSXPCConnection *)v28 setExportedInterface:v29];

    [(NSXPCConnection *)self->_conn setExportedObject:self->_serviceClient];
    objc_initWeak(buf, self);
    v30 = self->_conn;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke;
    v38[3] = &unk_2649342E8;
    objc_copyWeak(&v39, buf);
    [(NSXPCConnection *)v30 setInterruptionHandler:v38];
    __int16 v31 = self->_conn;
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    uint64_t v35 = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_3;
    uint64_t v36 = &unk_2649342E8;
    objc_copyWeak(&v37, buf);
    [(NSXPCConnection *)v31 setInvalidationHandler:&v33];
    [(NSXPCConnection *)self->_conn resume];
    [(LiveFSFPExtensionHelper *)self getVolumeInfoLocked];
    if (a3) {
      *a3 = 0;
    }
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(buf);

    goto LABEL_21;
  }
  return v16;
}

void __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_2;
    block[3] = &unk_2649342C0;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

uint64_t __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInterruption];
}

void __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_4;
    block[3] = &unk_2649342C0;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

uint64_t __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInvalidation];
}

- (BOOL)_isLoggedInOrError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  LOBYTE(a3) = [(LiveFSFPExtensionHelper *)v4 _isLoggedInOrErrorLocked:a3];
  objc_sync_exit(v4);

  return (char)a3;
}

- (id)pathForInodeID:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v41 = 0;
  __int16 v42 = &v41;
  uint64_t v43 = 0x3032000000;
  __int16 v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__0;
  id v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  if ((unint64_t)[v6 length] <= 0xC)
  {
    uint64_t v7 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    uint64_t v8 = (void *)v42[5];
    v42[5] = v7;

    id v9 = (id)v42[5];
    if (v9)
    {
      uint64_t v10 = livefs_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper pathForInodeID:error:]();
      }
    }
    if (a4)
    {
      id v9 = v9;
      id v11 = 0;
      *a4 = v9;
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  id v9 = [v6 substringToIndex:12];
  int v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v9 options:0];
  if (!v12)
  {
    uint64_t v24 = livefs_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v6;
      _os_log_impl(&dword_22CE49000, v24, OS_LOG_TYPE_INFO, "pathForInodeID given invalid ID %@", buf, 0xCu);
    }

    uint64_t v25 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    v26 = (void *)v42[5];
    v42[5] = v25;

    id v27 = (id)v42[5];
    if (v27)
    {
      v28 = livefs_std_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper pathForInodeID:error:]();
      }
    }
    if (a4) {
      *a4 = v27;
    }

LABEL_26:
    id v11 = 0;
    goto LABEL_29;
  }
  id v13 = v12;
  int v14 = (void *)[v13 bytes];
  uint64_t v15 = *v14;
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:*v14];
  int v17 = livefs_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v48 = v9;
    __int16 v49 = 2112;
    id v50 = v13;
    __int16 v51 = 2048;
    uint64_t v52 = v15;
    __int16 v53 = 2112;
    uint64_t v54 = v16;
    _os_log_impl(&dword_22CE49000, v17, OS_LOG_TYPE_DEFAULT, "pathForID got base64 %@, parentData %@, number %llu, number %@", buf, 0x2Au);
  }

  conn = self->_conn;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke;
  v34[3] = &unk_264934180;
  v34[4] = &v41;
  __int16 v19 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v34];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke_2;
  v30[3] = &unk_264934310;
  uint64_t v32 = &v41;
  id v20 = v16;
  id v31 = v20;
  uint64_t v33 = &v35;
  [v19 pathsAndAttributesForItemsByIDs:v13 requestID:-1 reply:v30];
  id v21 = (void *)v42[5];
  if (v21)
  {
    id v22 = v21;
    __int16 v23 = livefs_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper pathForInodeID:error:]();
    }

    if (a4) {
      *a4 = v22;
    }

    id v11 = 0;
  }
  else
  {
    id v11 = (id)v36[5];
  }

  id v9 = v19;
LABEL_29:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v11;
}

void __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_22CE49000, v6, OS_LOG_TYPE_DEFAULT, "GetPaths result %d results dict %@", (uint8_t *)v13, 0x12u);
  }

  if (a2)
  {
    uint64_t v7 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:a2];
    uint64_t v8 = *(void *)(a1[5] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:a1[4]];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"path"];
    uint64_t v11 = *(void *)(a1[6] + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)itemForIdentifierLocked:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:].cold.4();
  }

  if (![(LiveFSFPExtensionHelper *)self _isLoggedInOrError:a4])
  {
    uint64_t v10 = 0;
    goto LABEL_55;
  }
  id v8 = [(NSMapTable *)self->itemIDMap objectForKey:v6];
  if (v8)
  {
    id v9 = (id)[(LiveFSLRUCache *)self->itemCache objectForKey:v6];
LABEL_53:
    id v8 = v8;
    uint64_t v10 = v8;
    goto LABEL_54;
  }
  uint64_t v11 = *MEMORY[0x263F053F0];
  if (![v6 isEqualToString:*MEMORY[0x263F053F0]])
  {
    id v45 = 0;
    id v18 = [(LiveFSFPExtensionHelper *)self itemForIdentifierLocked:v11 error:&v45];
    id v19 = v45;
    id v20 = v19;
    if (!v18)
    {
      id v25 = 0;
      goto LABEL_43;
    }
    if (self->_idsPersist)
    {
      id v44 = v19;
      id v8 = [(LiveFSFPExtensionHelper *)self pathForInodeID:v6 error:&v44];
      id v21 = v44;

      if (!v8)
      {
        id v25 = 0;
        goto LABEL_46;
      }
      id v22 = livefs_std_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = [v6 substringFromIndex:12];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v68 = v23;
        _os_log_impl(&dword_22CE49000, v22, OS_LOG_TYPE_DEFAULT, "id->item, id %@ building path %@ with name %@", buf, 0x20u);
      }
      uint64_t v24 = [v6 substringFromIndex:12];
      id v25 = [v8 stringByAppendingPathComponent:v24];
    }
    else
    {
      id v25 = v6;
      id v21 = v20;
    }
    id v8 = [(LiveFSFPExtensionHelper *)self itemAtPathLocked:v25 parent:v18];
    if (!v8)
    {
      uint64_t v35 = livefs_std_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LiveFSFPExtensionHelper itemForIdentifierLocked:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_22CE49000, v35, OS_LOG_TYPE_INFO, "%s: asked for non-existent item %@", buf, 0x16u);
      }

      id v20 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v6];

LABEL_43:
      id v8 = 0;
      if (!v20) {
        goto LABEL_52;
      }
      goto LABEL_47;
    }
LABEL_46:
    id v20 = v21;
    if (!v21)
    {
LABEL_52:

      goto LABEL_53;
    }
LABEL_47:
    id v36 = v20;
    uint64_t v37 = livefs_std_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:]();
    }

    if (a4) {
      *a4 = v36;
    }

    goto LABEL_52;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v68 = __Block_byref_object_copy__0;
  v69 = __Block_byref_object_dispose__0;
  id v70 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__0;
  v59 = __Block_byref_object_dispose__0;
  id v60 = 0;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__0;
  __int16 v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  if (self->_clusterMaster)
  {
    int v12 = 0;
    id v60 = 0;
  }
  else
  {
    conn = self->_conn;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke;
    v48[3] = &unk_264934180;
    v48[4] = buf;
    int v12 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v48];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_2;
    v47[3] = &unk_264934270;
    v47[4] = buf;
    v47[5] = &v55;
    [v12 getRootFileHandleWithError:v47];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      id v27 = livefs_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v61 = 138412290;
        uint64_t v62 = v28;
        _os_log_impl(&dword_22CE49000, v27, OS_LOG_TYPE_INFO, "Getting RootFH failed with %@", v61, 0xCu);
      }

      id v15 = *(id *)(*(void *)&buf[8] + 40);
      if (v15)
      {
        __int16 v29 = livefs_std_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:]();
        }
      }
      if (a4)
      {
        id v17 = v15;
        goto LABEL_32;
      }
      goto LABEL_35;
    }
    uint64_t v39 = v56[5];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_213;
    v46[3] = &unk_264934298;
    v46[4] = buf;
    v46[5] = &v49;
    [v12 fileAttributes:v39 requestID:-1 reply:v46];
  }
  id v13 = livefs_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v40 = *(void *)(*(void *)&buf[8] + 40);
    uint64_t v41 = v56[5];
    __int16 v42 = [(NSFileProviderExtension *)self domain];
    uint64_t v43 = [v42 identifier];
    *(_DWORD *)v61 = 138412802;
    uint64_t v62 = v40;
    __int16 v63 = 2112;
    uint64_t v64 = v41;
    __int16 v65 = 2112;
    v66 = v43;
    _os_log_debug_impl(&dword_22CE49000, v13, OS_LOG_TYPE_DEBUG, "LIGetRootFileHandle returned e %@ fh %@ in domain %@", v61, 0x20u);
  }
  __int16 v14 = *(void **)(*(void *)&buf[8] + 40);
  if (!v14)
  {
    Class ItemClass = self->ItemClass;
    uint64_t v32 = v56[5];
    id v15 = [(NSFileProviderExtension *)self domain];
    uint64_t v33 = [v15 displayName];
    uint64_t v34 = [(objc_class *)self->ItemClass dt_dir];
    id v8 = (id)[(objc_class *)ItemClass newItemForFH:v32 withReference:v32 != 0 name:v33 parent:0 type:v34 attrs:v50[5] extension:self];

    char v30 = 1;
    goto LABEL_36;
  }
  id v15 = v14;
  uint64_t v16 = livefs_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:]();
  }

  if (a4)
  {
    id v17 = v15;
LABEL_32:
    id v8 = 0;
    char v30 = 0;
    *a4 = v17;
    goto LABEL_36;
  }
LABEL_35:
  id v8 = 0;
  char v30 = 0;
LABEL_36:

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(buf, 8);
  if (v30) {
    goto LABEL_53;
  }
  uint64_t v10 = 0;
LABEL_54:

LABEL_55:
  return v10;
}

void __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke(uint64_t a1, void *a2)
{
}

void __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_213(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (a2)
  {
    uint64_t v6 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:a2];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v5;
    id v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
}

- (id)itemForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(LiveFSFPExtensionHelper *)self ensureMountPathSetup];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper itemForIdentifier:error:]();
    }

    if (a4) {
      *a4 = v9;
    }

    id v11 = 0;
  }
  else
  {
    int v12 = self;
    objc_sync_enter(v12);
    id v11 = [(LiveFSFPExtensionHelper *)v12 itemForIdentifierLocked:v6 error:a4];
    objc_sync_exit(v12);
  }
  return v11;
}

- (void)addItem:(id)a3 identifier:(id)a4 fileHandle:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v14 parent];
  id v11 = v10;
  if (v10)
  {
    int v12 = [v10 itemNameCache];
    id v13 = [v14 filename];
    [v12 setObject:v14 forKey:v13];
  }
  if (v8) {
    [(NSMapTable *)self->itemHandleMap setObject:v14 forKey:v8];
  }
  [(NSMapTable *)self->itemIDMap setObject:v14 forKey:v9];
  [(LiveFSLRUCache *)self->itemCache setObject:v14 forKey:v9];
}

- (void)addFileHandle:(id)a3 toItem:(id)a4
{
}

- (id)getItemForParent:(id)a3 name:(id)a4
{
  id v5 = a4;
  id v6 = [a3 itemNameCache];
  uint64_t v7 = [v6 objectForKey:v5];

  return v7;
}

- (id)getItemForFileHandle:(id)a3
{
  return [(NSMapTable *)self->itemHandleMap objectForKey:a3];
}

- (void)reparentItem:(id)a3 oldID:(id)a4 oldParent:(id)a5 oldName:(id)a6 newParent:(id)a7 newName:(id)a8
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v14)
  {
    [(LiveFSFPExtensionHelper *)self reIDItem:v23 oldID:v14];
    [(LiveFSLRUCache *)self->itemCache removeObjectForKey:v14];
  }
  if (![v17 isEqual:v15] || (objc_msgSend(v18, "isEqualToString:", v16) & 1) == 0)
  {
    id v19 = [v17 itemNameCache];
    [v19 setObject:v23 forKey:v18];

    id v20 = [v15 itemNameCache];
    [v20 removeObjectForKey:v16];
  }
  itemCache = self->itemCache;
  id v22 = [v23 itemIdentifier];
  [(LiveFSLRUCache *)itemCache setObject:v23 forKey:v22];
}

- (void)reIDItem:(id)a3 oldID:(id)a4
{
  itemIDMap = self->itemIDMap;
  id v7 = a3;
  [(NSMapTable *)itemIDMap removeObjectForKey:a4];
  id v8 = self->itemIDMap;
  id v9 = [v7 itemIdentifier];
  [(NSMapTable *)v8 setObject:v7 forKey:v9];
}

- (void)removeItem:(id)a3 parent:(id)a4 name:(id)a5 fileHandle:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(NSMapTable *)self->itemIDMap setObject:0 forKey:v14];
  if (v10)
  {
    id v13 = [v10 itemNameCache];
    [v13 removeObjectForKey:v11];
  }
  if (v12) {
    [(NSMapTable *)self->itemHandleMap removeObjectForKey:v12];
  }
  [(LiveFSLRUCache *)self->itemCache removeObjectForKey:v14];
}

- (void)addDirContainer:(id)a3 forContainerID:(id)a4
{
}

- (id)getEnumeratorForContainer:(id)a3
{
  return [(NSMapTable *)self->enumerators objectForKey:a3];
}

- (void)removeEnumeratorForContainerLocked:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMapTable objectForKey:](self->enumerators, "objectForKey:");

  if (v4) {
    [(NSMapTable *)self->enumerators setObject:0 forKey:v5];
  }
}

- (void)removeEnumeratorForContainer:(id)a3
{
  id v4 = a3;
  enumeratorHelperQueue = self->_enumeratorHelperQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__LiveFSFPExtensionHelper_removeEnumeratorForContainer___block_invoke;
  v7[3] = &unk_264934338;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(enumeratorHelperQueue, v7);
}

void __56__LiveFSFPExtensionHelper_removeEnumeratorForContainer___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) removeEnumeratorForContainerLocked:*(void *)(a1 + 40)];
  objc_sync_exit(obj);
}

- (id)URLForItemWithIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSFileProviderExtension *)self domain];
  if (!v5)
  {
LABEL_9:
    id v23 = livefs_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[LiveFSFPExtensionHelper URLForItemWithIdentifier:]();
    }
    goto LABEL_11;
  }
  id v6 = (void *)v5;
  id v7 = [(NSFileProviderExtension *)self domain];
  uint64_t v8 = [v7 identifier];
  if (!v8)
  {

    goto LABEL_9;
  }
  id v9 = (void *)v8;
  id v10 = [(NSFileProviderExtension *)self domain];
  id v11 = [v10 identifier];
  int v12 = [v11 isEqualToString:&stru_26E048A08];

  if (v12) {
    goto LABEL_9;
  }
  id v13 = livefs_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPExtensionHelper URLForItemWithIdentifier:]((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
  }

  id v20 = [(LiveFSFPExtensionHelper *)self ensureMountPathSetup];
  if (v20)
  {
    id v21 = 0;
    id v22 = 0;
    goto LABEL_13;
  }
  BOOL v25 = [(LiveFSFPExtensionHelper *)self _isLoggedInOrError:0];
  id v20 = 0;
  id v21 = 0;
  id v22 = 0;
  if (v25)
  {
    if ([v4 isEqualToString:*MEMORY[0x263F053F0]])
    {
      id v21 = &stru_26E048A08;
LABEL_23:
      id v27 = livefs_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v31 = "-[LiveFSFPExtensionHelper URLForItemWithIdentifier:]";
        __int16 v32 = 2112;
        uint64_t v33 = v21;
        __int16 v34 = 2112;
        id v35 = v4;
        _os_log_impl(&dword_22CE49000, v27, OS_LOG_TYPE_DEFAULT, "%s: returning perVolPath %@ for item %@", buf, 0x20u);
      }

      id v23 = [(LiveFSFPExtensionHelper *)self mountPath];
      id v22 = [v23 URLByAppendingPathComponent:v21 isDirectory:0];
      goto LABEL_12;
    }
    if (!self->_idsPersist)
    {
      id v21 = (__CFString *)v4;
      goto LABEL_23;
    }
    id v29 = 0;
    v26 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v4 error:&v29];
    id v23 = v29;
    if (v26)
    {
      id v21 = [v26 path];

      goto LABEL_23;
    }
    uint64_t v28 = livefs_std_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = (const char *)v4;
      _os_log_impl(&dword_22CE49000, v28, OS_LOG_TYPE_DEFAULT, "URLForItem: didn't find item for ID %@", buf, 0xCu);
    }

LABEL_11:
    id v21 = 0;
    id v22 = 0;
LABEL_12:

    id v20 = 0;
  }
LABEL_13:

  return v22;
}

- (id)itemAtPathLocked:(id)a3 parent:(id)a4 cachedOnly:(BOOL)a5
{
  BOOL v33 = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__0;
  id v50 = __Block_byref_object_dispose__0;
  id v51 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__0;
  id v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  uint64_t v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = __Block_byref_object_copy__0;
  v38[3] = __Block_byref_object_dispose__0;
  id v39 = 0;
  id v31 = v7;
  id v9 = [v7 pathComponents];
  if (self->_clusterMaster)
  {
    __int16 v34 = 0;
    BOOL v33 = 1;
  }
  else
  {
    conn = self->_conn;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke;
    v36[3] = &unk_264934180;
    v36[4] = &v37;
    __int16 v34 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v36];
  }
  id v32 = v8;
  uint64_t v11 = [v9 count];
  if (!v11)
  {
    uint64_t v16 = 0;
    int v12 = 0;
    uint64_t v14 = v32;
LABEL_19:
    itemCache = self->itemCache;
    BOOL v25 = [v14 itemIdentifier];
    id v26 = (id)[(LiveFSLRUCache *)itemCache objectForKey:v25];

    id v27 = v14;
    uint64_t v15 = v9;
    id v17 = v12;
    goto LABEL_20;
  }
  int v12 = 0;
  id v13 = 0;
  char v30 = v38;
  uint64_t v14 = v32;
  uint64_t v15 = v9;
  while (1)
  {
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];

    if (([v16 isEqualToString:@"/"] & 1) == 0) {
      break;
    }
LABEL_14:
    id v9 = (void *)MEMORY[0x263EFFA68];
    if ((int)v11 >= 2)
    {
      id v9 = objc_msgSend(v15, "subarrayWithRange:", 1, (v11 - 1));
    }

    id v13 = v16;
    uint64_t v15 = v9;
    LODWORD(v11) = v11 - 1;
    if (!v11) {
      goto LABEL_19;
    }
  }
  id v17 = v14;

  uint64_t v14 = [(LiveFSFPExtensionHelper *)self getItemForParent:v17 name:v16];

  if (v14)
  {
LABEL_13:
    int v12 = v17;
    goto LABEL_14;
  }
  if (!v33)
  {
    uint64_t v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v15 objectAtIndexedSubscript:0];
      *(_DWORD *)buf = 138412290;
      __int16 v53 = v19;
      _os_log_impl(&dword_22CE49000, v18, OS_LOG_TYPE_DEFAULT, "About to look up name '%@'", buf, 0xCu);
    }
    id v20 = [v17 fh];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke_216;
    v35[3] = &unk_264934360;
    v35[4] = &v37;
    v35[5] = &v46;
    v35[6] = &v40;
    [v34 lookupIn:v20 name:v16 usingFlags:0 requestID:-1 reply:v35];

    if (*(void *)(v38[0] + 40))
    {
      id v29 = livefs_std_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper itemAtPathLocked:parent:cachedOnly:]((uint64_t)v30, v29);
      }
      goto LABEL_28;
    }
    Class ItemClass = self->ItemClass;
    uint64_t v22 = v47[5];
    uint64_t v23 = [(objc_class *)ItemClass dt_examine];
    uint64_t v14 = (void *)-[objc_class newItemForFH:withReference:name:parent:type:attrs:extension:](ItemClass, "newItemForFH:withReference:name:parent:type:attrs:extension:", v22, 1, v16, v17, v23, v41[5], self, v30);
    goto LABEL_13;
  }
  id v29 = livefs_std_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v53 = v31;
    _os_log_impl(&dword_22CE49000, v29, OS_LOG_TYPE_INFO, "Cache miss for name %@", buf, 0xCu);
  }
LABEL_28:

  id v27 = 0;
LABEL_20:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v27;
}

void __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke(uint64_t a1, void *a2)
{
}

void __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke_216(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v15 = a4;
  id v9 = a5;
  if (a2)
  {
    uint64_t v10 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:a2];
    uint64_t v11 = *(void *)(a1[4] + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v14 = v9;
    int v12 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }
}

- (id)itemAtPathLocked:(id)a3 parent:(id)a4
{
  return [(LiveFSFPExtensionHelper *)self itemAtPathLocked:a3 parent:a4 cachedOnly:0];
}

- (id)itemAtPath:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if ([(LiveFSFPExtensionHelper *)v8 _isLoggedInOrErrorLocked:0])
  {
    id v9 = [(LiveFSFPExtensionHelper *)v8 itemAtPathLocked:v6 parent:v7 cachedOnly:0];
  }
  else
  {
    id v9 = 0;
  }
  objc_sync_exit(v8);

  return v9;
}

- (void)enumerateRootContainer
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = *MEMORY[0x263F053F0];
  id v4 = [(LiveFSFPExtensionHelper *)v2 getEnumeratorForContainer:*MEMORY[0x263F053F0]];
  objc_sync_exit(v2);

  if (v4)
  {
    +[LiveFSFPEnumeratorHelper applyParentUpdateAcrossEnumerators:v4];
    id v5 = 0;
    id v6 = 0;
  }
  else
  {
    v2->_fetchRoot = 1;
    id v7 = 0;
    id v5 = +[LiveFSFPEnumeratorHelper newWithEnumeratedItem:v3 extension:v2 error:&v7];
    id v6 = v7;
    if (!v6) {
      [v5 signalEnumeratedItemChanged];
    }
  }
}

- (id)persistentIdentifierForItemAtURL:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = [a3 standardizedURL];
  id v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    docPath = self->_docPath;
    providerName = self->providerName;
    id v9 = [(NSFileProviderExtension *)self domain];
    uint64_t v10 = [(NSFileProviderExtension *)self domain];
    if (v10)
    {
      uint64_t v3 = [(NSFileProviderExtension *)self domain];
      uint64_t v11 = [v3 identifier];
    }
    else
    {
      uint64_t v11 = &stru_26E048A08;
    }
    int v24 = 136316418;
    BOOL v25 = "-[LiveFSFPExtensionHelper persistentIdentifierForItemAtURL:]";
    __int16 v26 = 2112;
    id v27 = v5;
    __int16 v28 = 2112;
    id v29 = docPath;
    __int16 v30 = 2112;
    id v31 = providerName;
    __int16 v32 = 2112;
    BOOL v33 = v9;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl(&dword_22CE49000, v6, OS_LOG_TYPE_DEFAULT, "%s starting for url %@, docpath %@, providerName %@, domain: %@, identifier; %@",
      (uint8_t *)&v24,
      0x3Eu);
    if (v10)
    {
    }
  }

  int v12 = [(LiveFSFPExtensionHelper *)self itemPathForURL:v5];
  uint64_t v13 = self;
  objc_sync_enter(v13);
  if ([(LiveFSFPExtensionHelper *)v13 _isLoggedInOrErrorLocked:0])
  {
    id v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      BOOL v25 = v12;
      _os_log_impl(&dword_22CE49000, v14, OS_LOG_TYPE_DEFAULT, "perItemPath is '%@'", (uint8_t *)&v24, 0xCu);
    }

    if ([v12 isEqualToString:&stru_26E048A08])
    {
      id v15 = livefs_std_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      id v17 = (void *)*MEMORY[0x263F053F0];
      if (v16) {
        -[LiveFSFPExtensionHelper persistentIdentifierForItemAtURL:]();
      }

      uint64_t v18 = v17;
    }
    else
    {
      if (v13->_idsPersist)
      {
        id v20 = [(LiveFSFPExtensionHelper *)v13 itemForPath:v12 cachedOnly:0 error:0];
        id v21 = v20;
        if (v20)
        {
          uint64_t v19 = [v20 itemIdentifier];
        }
        else
        {
          uint64_t v19 = 0;
        }

        goto LABEL_25;
      }
      uint64_t v22 = livefs_std_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSFPExtensionHelper persistentIdentifierForItemAtURL:]();
      }

      uint64_t v18 = v12;
    }
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_25:
  objc_sync_exit(v13);

  return v19;
}

- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPExtensionHelper providePlaceholderAtURL:completionHandler:]();
  }

  v6[2](v6, 0);
}

- (void)startProvidingItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPExtensionHelper startProvidingItemAtURL:completionHandler:]();
  }

  v6[2](v6, 0);
}

- (void)itemChangedAtURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(LiveFSFPExtensionHelper *)self itemForURL:v4 cachedOnly:1 error:0];
  id v6 = v5;
  if (v5) {
    [v5 setAttributesStale];
  }
  id v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = " found item at";
    uint64_t v10 = "-[LiveFSFPExtensionHelper itemChangedAtURL:]";
    int v9 = 136315650;
    if (!v6) {
      id v8 = "";
    }
    __int16 v11 = 2080;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22CE49000, v7, OS_LOG_TYPE_DEFAULT, "%s: called on%s url %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)stopProvidingItemAtURL:(id)a3
{
  id v3 = a3;
  id v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPExtensionHelper stopProvidingItemAtURL:]();
  }
}

- (id)LiveFSDefaultMover
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__LiveFSFPExtensionHelper_LiveFSDefaultMover__block_invoke;
  v5[3] = &unk_264934388;
  v5[4] = self;
  v2 = (void *)MEMORY[0x230F765B0](v5, a2);
  id v3 = (void *)MEMORY[0x230F765B0]();

  return v3;
}

BOOL __45__LiveFSFPExtensionHelper_LiveFSDefaultMover__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a2;
  int v9 = (const char *)[v7 fileSystemRepresentation];
  id v10 = v8;
  __int16 v11 = (const char *)[v10 fileSystemRepresentation];

  char dst = 0;
  int v12 = copyfile_state_alloc();
  if (v12)
  {
    __int16 v13 = v12;
    copyfile_state_set(v12, 6u, copyFileFromPath_callback);
    int v14 = copyfile(v11, v9, v13, 0x10E800Fu);
    BOOL v15 = v14 == 0;
    if (v14)
    {
      if (a4)
      {
        if (*__error() == 17)
        {
          BOOL v16 = [*(id *)(a1 + 32) itemForURL:v7 error:a4];
          if (v16)
          {
            *a4 = [MEMORY[0x263F087E8] fileProviderErrorForCollisionWithItem:v16];
          }
        }
        else
        {
          *a4 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:*__error()];
        }
      }
    }
    else
    {
      copyfile_state_get(v13, 0xAu, &dst);
    }
    copyfile_state_free(v13);
  }
  else if (a4)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:12];
    BOOL v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)importDocumentAtURL:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v9];
  int v12 = livefs_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_22CE49000, v12, OS_LOG_TYPE_DEFAULT, "importing document at %@ to %@", buf, 0x16u);
  }

  if (v11)
  {
    __int16 v13 = [(LiveFSFPExtensionHelper *)self LiveFSDefaultMover];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_2649343B0;
    v15[4] = self;
    id v17 = v10;
    id v16 = v8;
    objc_msgSend(v16, "fp_importUnderFolder:usingBlock:completionHandler:", v11, v13, v15);
  }
  else
  {
    int v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CE49000, v14, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    __int16 v13 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v9];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

void __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_2((uint64_t)v5);
  }

  id v8 = [*(id *)(a1 + 32) fileProviderErrorFromFSError:v6];

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    id v15 = 0;
    id v10 = [v9 itemForURL:v5 error:&v15];
    id v11 = v15;
    if (!v10)
    {
      int v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_1();
      }
    }
    __int16 v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_22CE49000, v13, OS_LOG_TYPE_DEFAULT, "importing document at %@ to item %@, error %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)createDirectoryWithName:(id)a3 inParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_DEFAULT, "creating directory %@ under %@", buf, 0x16u);
  }

  int v12 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v9 error:0];
  if (!v12)
  {
    __int16 v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CE49000, v18, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    id v15 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v9];
    goto LABEL_14;
  }
  id v32 = 0;
  BOOL v13 = [(LiveFSFPExtensionHelper *)self _isLoggedInOrError:&v32];
  id v14 = v32;
  id v15 = v14;
  if (!v13)
  {
    id v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper createDirectoryWithName:inParentItemIdentifier:completionHandler:]();
    }

LABEL_14:
    v10[2](v10, 0, v15);
    goto LABEL_19;
  }
  if (self->_clusterMaster)
  {
    id v16 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:30];

    uint64_t v17 = livefs_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper createDirectoryWithName:inParentItemIdentifier:completionHandler:](self, v17);
    }
LABEL_18:

    v10[2](v10, 0, v16);
    id v15 = v16;
    goto LABEL_19;
  }
  id v31 = v14;
  int v20 = [v12 ensureFileHandleOrError:&v31];
  id v16 = v31;

  if (v20)
  {
    uint64_t v17 = livefs_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper createDirectoryWithName:inParentItemIdentifier:completionHandler:]();
    }
    goto LABEL_18;
  }
  uint64_t v21 = [(LiveFSFPExtensionHelper *)self itemAtPath:v8 parent:v12];
  if (v21)
  {
    id v15 = (void *)v21;
    uint64_t v22 = livefs_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v8;
      __int16 v35 = 2112;
      id v36 = v15;
      _os_log_impl(&dword_22CE49000, v22, OS_LOG_TYPE_DEFAULT, "creating directory %@ colliding with %@", buf, 0x16u);
    }

    uint64_t v23 = [MEMORY[0x263F087E8] fileProviderErrorForCollisionWithItem:v15];
    v10[2](v10, 0, v23);
  }
  else
  {
    int v24 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v9];
    BOOL v25 = [v24 URLByAppendingPathComponent:v8];

    uint64_t v39 = *MEMORY[0x263F08078];
    v40[0] = &unk_26E04CB48;
    __int16 v26 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    id v27 = [MEMORY[0x263F08850] defaultManager];
    id v30 = v16;
    [v27 createDirectoryAtURL:v25 withIntermediateDirectories:0 attributes:v26 error:&v30];
    id v28 = v30;

    if (v28)
    {
      id v15 = 0;
    }
    else
    {
      id v15 = [(LiveFSFPExtensionHelper *)self itemAtPath:v8 parent:v12];
    }
    id v29 = livefs_std_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v8;
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v28;
      _os_log_impl(&dword_22CE49000, v29, OS_LOG_TYPE_DEFAULT, "creating directory %@ returning %@ and error %@", buf, 0x20u);
    }

    ((void (**)(id, void *, void *))v10)[2](v10, v15, v28);
  }
LABEL_19:
}

- (void)renameItemWithIdentifier:(id)a3 toName:(id)a4 completionHandler:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v37 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__0;
  __int16 v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  id v10 = livefs_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v56 = v8;
    __int16 v57 = 2112;
    id v58 = v37;
    _os_log_impl(&dword_22CE49000, v10, OS_LOG_TYPE_DEFAULT, "renaming %@ to %@", buf, 0x16u);
  }

  id v11 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v8 error:0];
  int v12 = v11;
  if (!v11)
  {
    int v24 = livefs_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CE49000, v24, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    BOOL v25 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v8];
    v9[2](v9, 0, v25);
    id v21 = 0;
    id v22 = 0;
    id v26 = 0;
    id v13 = 0;
    uint64_t v23 = 0;
    goto LABEL_14;
  }
  id v13 = [v11 parent];
  if (!v13)
  {
    BOOL v25 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    v9[2](v9, 0, v25);
    id v21 = 0;
    id v22 = 0;
    id v26 = 0;
    id v13 = 0;
    uint64_t v23 = 0;
LABEL_14:

    id v16 = v26;
    goto LABEL_16;
  }
  id v48 = 0;
  BOOL v14 = [(LiveFSFPExtensionHelper *)self _isLoggedInOrError:&v48];
  id v15 = v48;
  id v16 = v15;
  if (!v14)
  {
    v9[2](v9, 0, v15);
    id v21 = 0;
    id v22 = 0;
    uint64_t v23 = 0;
    goto LABEL_16;
  }
  if (!self->_clusterMaster)
  {
    id v47 = v15;
    int v27 = [v13 ensureFileHandleOrError:&v47];
    id v26 = v47;

    if (v27)
    {
      v9[2](v9, 0, v26);
      id v21 = 0;
      id v22 = 0;
      uint64_t v23 = 0;
      id v16 = v26;
      goto LABEL_16;
    }
    uint64_t v23 = [(LiveFSFPExtensionHelper *)self itemAtPath:v37 parent:v13];
    if (v23)
    {
      id v28 = livefs_std_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v56 = v8;
        __int16 v57 = 2112;
        id v58 = v23;
        _os_log_impl(&dword_22CE49000, v28, OS_LOG_TYPE_DEFAULT, "renaming %@ colliding with %@", buf, 0x16u);
      }

      BOOL v25 = [MEMORY[0x263F087E8] fileProviderErrorForCollisionWithItem:v23];
      v9[2](v9, 0, v25);
      id v21 = 0;
      id v22 = 0;
    }
    else
    {
      id v21 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v8];
      id v29 = [v21 URLByDeletingLastPathComponent];
      id v22 = [v29 URLByAppendingPathComponent:v37];

      uint64_t v30 = [v13 itemIdentifier];
      id v46 = v26;
      uint64_t v31 = [(LiveFSFPExtensionHelper *)self enumeratorForContainerItemIdentifier:v30 error:&v46];
      id v36 = (void *)v30;
      id v16 = v46;

      id v32 = (void *)v50[5];
      v50[5] = v31;

      BOOL v33 = (void *)v50[5];
      if (v33)
      {
        uint64_t v34 = [v33 ensureConnectedForUpdates];

        id v16 = (id)v34;
      }
      if (v16)
      {
        v9[2](v9, 0, v16);
        uint64_t v23 = 0;
        goto LABEL_16;
      }
      renameUpdateQueue = self->renameUpdateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke;
      block[3] = &unk_264934400;
      id v39 = v12;
      id v13 = v13;
      id v40 = v13;
      uint64_t v41 = self;
      id v22 = v22;
      id v42 = v22;
      id v45 = &v49;
      id v44 = v9;
      id v21 = v21;
      id v43 = v21;
      dispatch_async(renameUpdateQueue, block);

      id v26 = 0;
      uint64_t v23 = 0;
      BOOL v25 = v39;
    }
    goto LABEL_14;
  }
  uint64_t v17 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:30];

  __int16 v18 = livefs_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = [(NSFileProviderExtension *)self domain];
    int v20 = [v19 identifier];
    -[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:](v20, buf, v18, v19);
  }

  v9[2](v9, 0, (void *)v17);
  id v21 = 0;
  id v22 = 0;
  uint64_t v23 = 0;
  id v16 = (id)v17;
LABEL_16:
  _Block_object_dispose(&v49, 8);
}

void __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) filename];
  id v3 = (void *)[v2 copy];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke_2;
  v15[3] = &unk_2649343D8;
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 56);
  v15[4] = *(void *)(a1 + 48);
  id v16 = v5;
  long long v13 = *(_OWORD *)(a1 + 72);
  id v6 = (id)v13;
  long long v17 = v13;
  [v4 afterRename:v3 performBlock:v15];
  id v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:]_block_invoke";
    _os_log_impl(&dword_22CE49000, v7, OS_LOG_TYPE_DEFAULT, "%s: rename about to happen", buf, 0xCu);
  }

  id v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v14 = 0;
  [v8 moveItemAtURL:v9 toURL:v10 error:&v14];
  id v11 = v14;

  int v12 = livefs_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_22CE49000, v12, OS_LOG_TYPE_DEFAULT, "%s: got error %@", buf, 0x16u);
  }

  if (v11)
  {
    [*(id *)(a1 + 40) dropAfterRenameBlockForName:v3];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  id v4 = [v2 itemForURL:v3 error:&v9];
  id v5 = v9;
  id v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_22CE49000, v6, OS_LOG_TYPE_DEFAULT, "Reparented, it is item %@ newError %@", buf, 0x16u);
  }

  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)reparentItemWithIdentifier:(id)a3 toParentItemWithIdentifier:(id)a4 newName:(id)a5 completionHandler:(id)a6
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v42 = a4;
  id v41 = a5;
  uint64_t v10 = (void (**)(id, void, id))a6;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__0;
  uint64_t v62 = __Block_byref_object_dispose__0;
  id v63 = 0;
  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v65 = v43;
    __int16 v66 = 2112;
    id v67 = v42;
    __int16 v68 = 2112;
    id v69 = v41;
    _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_DEFAULT, "reparenting %@ under %@, with newName %@", buf, 0x20u);
  }

  id v57 = 0;
  BOOL v12 = [(LiveFSFPExtensionHelper *)self _isLoggedInOrError:&v57];
  id v13 = v57;
  if (v12)
  {
    if (!self->_clusterMaster)
    {
      int v24 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v43 error:0];
      id v23 = v24;
      if (v24)
      {
        BOOL v25 = [v24 parent];
        id v22 = v25;
        if (v25)
        {
          id v56 = v13;
          int v26 = [v25 ensureFileHandleOrError:&v56];
          id v27 = v56;

          if (v26)
          {
            v10[2](v10, 0, v27);
            __int16 v18 = 0;
            id v19 = 0;
            id v20 = 0;
            id v21 = 0;
            id v13 = v27;
            goto LABEL_9;
          }
          id v55 = v27;
          id v21 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v42 error:&v55];
          id v13 = v55;

          if (v13)
          {
            v10[2](v10, 0, v13);
            __int16 v18 = 0;
            id v19 = 0;
            id v20 = 0;
            goto LABEL_9;
          }
          id v54 = 0;
          int v30 = [v21 ensureFileHandleOrError:&v54];
          id v13 = v54;
          if (v30)
          {
            v10[2](v10, 0, v13);
            __int16 v18 = 0;
            id v19 = 0;
            id v20 = 0;
            goto LABEL_9;
          }
          if (v41)
          {
            id v31 = v41;
          }
          else
          {
            id v32 = livefs_std_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              BOOL v33 = [v23 filename];
              -[LiveFSFPExtensionHelper reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:](v33, (uint64_t)buf, v32);
            }

            id v31 = [v23 filename];
          }
          __int16 v18 = v31;
          id v19 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v43];
          uint64_t v34 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v42];
          id v20 = [v34 URLByAppendingPathComponent:v18];

          uint64_t v35 = [v22 itemIdentifier];
          id v53 = v13;
          uint64_t v40 = [(LiveFSFPExtensionHelper *)self enumeratorForContainerItemIdentifier:v35 error:&v53];
          id v39 = (void *)v35;
          id v36 = v53;

          id v37 = (void *)v59[5];
          v59[5] = v40;

          if (v36)
          {
            v10[2](v10, 0, v36);
            id v13 = v36;
            goto LABEL_9;
          }
          renameUpdateQueue = self->renameUpdateQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke;
          block[3] = &unk_264934428;
          id v23 = v23;
          id v45 = v23;
          id v22 = v22;
          id v46 = v22;
          id v47 = self;
          id v20 = v20;
          id v48 = v20;
          uint64_t v52 = &v58;
          uint64_t v51 = v10;
          id v19 = v19;
          id v49 = v19;
          id v50 = 0;
          dispatch_async(renameUpdateQueue, block);

          id v13 = 0;
          id v29 = v45;
        }
        else
        {
          id v29 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
          v10[2](v10, 0, v29);
          __int16 v18 = 0;
          id v19 = 0;
          id v20 = 0;
          id v21 = 0;
          id v22 = 0;
        }
      }
      else
      {
        id v28 = livefs_std_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22CE49000, v28, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
        }

        id v29 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v43];
        v10[2](v10, 0, v29);
        __int16 v18 = 0;
        id v19 = 0;
        id v20 = 0;
        id v21 = 0;
        id v22 = 0;
        id v23 = 0;
      }

      goto LABEL_9;
    }
    uint64_t v14 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:30];

    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(NSFileProviderExtension *)self domain];
      long long v17 = [v16 identifier];
      -[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:](v17, buf, v15, v16);
    }

    v10[2](v10, 0, (id)v14);
    __int16 v18 = 0;
    id v19 = 0;
    id v20 = 0;
    id v21 = 0;
    id v22 = 0;
    id v23 = 0;
    id v13 = (id)v14;
  }
  else
  {
    v10[2](v10, 0, v13);
    __int16 v18 = 0;
    id v19 = 0;
    id v20 = 0;
    id v21 = 0;
    id v22 = 0;
    id v23 = 0;
  }
LABEL_9:
  _Block_object_dispose(&v58, 8);
}

void __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) filename];
  uint64_t v3 = (void *)[v2 copy];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke_2;
  v15[3] = &unk_2649343D8;
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 56);
  v15[4] = *(void *)(a1 + 48);
  id v16 = v5;
  long long v13 = *(_OWORD *)(a1 + 80);
  id v6 = (id)v13;
  long long v17 = v13;
  [v4 afterRename:v3 performBlock:v15];
  uint64_t v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[LiveFSFPExtensionHelper reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:]_block_invoke";
    _os_log_impl(&dword_22CE49000, v7, OS_LOG_TYPE_DEFAULT, "%s: rename about to happen", buf, 0xCu);
  }

  id v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v14 = 0;
  [v8 moveItemAtURL:v9 toURL:v10 error:&v14];
  id v11 = v14;

  BOOL v12 = livefs_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[LiveFSFPExtensionHelper reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_22CE49000, v12, OS_LOG_TYPE_DEFAULT, "%s: got error %@", buf, 0x16u);
  }

  if (v11)
  {
    [*(id *)(a1 + 40) dropAfterRenameBlockForName:v3];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  id v4 = [v2 itemForURL:v3 error:&v9];
  id v5 = v9;
  id v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_22CE49000, v6, OS_LOG_TYPE_DEFAULT, "Reparented, it is item %@ newError %@", buf, 0x16u);
  }

  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v19 = 0;
  BOOL v5 = [(LiveFSFPExtensionHelper *)self _isLoggedInOrError:&v19];
  id v6 = v19;
  id v7 = v6;
  if (v5)
  {
    id v18 = v6;
    id v8 = [(LiveFSFPExtensionHelper *)self itemForPath:@".Trashes" cachedOnly:0 error:&v18];
    id v9 = v18;

    if (v8)
    {
      uint64_t v10 = [v8 itemIdentifier];
      id v17 = v9;
      id v11 = [(LiveFSFPExtensionHelper *)self enumeratorForContainerItemIdentifier:v10 error:&v17];
      id v7 = v17;

      if (v11)
      {
        id v12 = +[LiveFSFPTrashObserver newWithCompletionHandler:v4];
        if (v12)
        {
          id v13 = v12;
          id v14 = (id)*MEMORY[0x263F053B0];
          if (v14)
          {
            id v15 = v14;
            do
            {
              [v11 enumerateItemsForObserver:v13 startingAtPage:v15];
              uint64_t v16 = [v13 lastPage];

              id v15 = (void *)v16;
            }
            while (v16);
          }
        }
        else
        {
          id v13 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:12];
          v4[2](v4, 0, v13);
        }
      }
      else
      {
        v4[2](v4, 0, v7);
      }
    }
    else
    {
      v4[2](v4, 0, v9);
      id v7 = v9;
    }
  }
  else
  {
    v4[2](v4, 0, v6);
  }
}

- (void)trashItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_22CE49000, v8, OS_LOG_TYPE_INFO, "trashing item %@", (uint8_t *)&buf, 0xCu);
  }

  id v58 = 0;
  BOOL v9 = [(LiveFSFPExtensionHelper *)self _isLoggedInOrError:&v58];
  id v10 = v58;
  if (!v9)
  {
    v7[2](v7, 0, v10);
    goto LABEL_7;
  }
  uint64_t v11 = *MEMORY[0x263F053F0];
  if (![v6 isEqualToString:*MEMORY[0x263F053F0]])
  {
    id v14 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v6 error:0];
    if (!v14)
    {
      int v26 = livefs_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_22CE49000, v26, OS_LOG_TYPE_DEFAULT, "Where is IT", (uint8_t *)&buf, 2u);
      }

      id v27 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v6];
      v7[2](v7, 0, v27);

      goto LABEL_7;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__0;
    uint64_t v62 = __Block_byref_object_dispose__0;
    id v63 = 0;
    id v44 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v6];
    id v15 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v11];
    id v45 = [v15 URLByAppendingPathComponent:@".Trashes"];

    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%u", getuid());
    id v46 = [v45 URLByAppendingPathComponent:v16];

    id v17 = [MEMORY[0x263F08850] defaultManager];
    id v18 = [v46 path];
    id v57 = v10;
    char v19 = [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v57];
    id v20 = v57;

    if ((v19 & 1) == 0)
    {
      id v21 = [v20 domain];
      uint64_t v22 = *MEMORY[0x263F07F70];
      if ([v21 isEqualToString:*MEMORY[0x263F07F70]])
      {
        BOOL v23 = [v20 code] == 516;

        if (!v23)
        {
          connection = xpc_connection_create_mach_service("com.apple.filesystems.userfs_helper", 0, 0);
          if (!connection || MEMORY[0x230F76850](connection) != MEMORY[0x263EF86F0])
          {
            int v24 = [MEMORY[0x263F087E8] errorWithDomain:v22 code:512 userInfo:0];
            v7[2](v7, 0, v24);
            BOOL v25 = 0;
            xpc_object_t xdict = 0;
            id v13 = 0;
            goto LABEL_28;
          }
          xpc_connection_set_event_handler(connection, &__block_literal_global);
          xpc_connection_resume(connection);
          xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
          uid_t v35 = getuid();
          xpc_dictionary_set_int64(xdict, "uid", v35);
          gid_t v36 = getgid();
          xpc_dictionary_set_int64(xdict, "gid", v36);
          id v37 = (const char *)[v45 fileSystemRepresentation];
          id v38 = (const char *)[v46 fileSystemRepresentation];
          if (v37) {
            xpc_dictionary_set_string(xdict, "trash", v37);
          }
          if (v38) {
            xpc_dictionary_set_string(xdict, "path", v38);
          }
          id v39 = livefs_std_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v56 = 0;
            _os_log_impl(&dword_22CE49000, v39, OS_LOG_TYPE_DEFAULT, "asking for Trash to be created", v56, 2u);
          }

          xpc_object_t v40 = xpc_connection_send_message_with_reply_sync(connection, xdict);
          BOOL v25 = v40;
          if (!v40 || MEMORY[0x230F76850](v40) != MEMORY[0x263EF8708] || xpc_dictionary_get_int64(v25, "error"))
          {
            id v10 = [MEMORY[0x263F087E8] errorWithDomain:v22 code:512 userInfo:0];

            id v41 = livefs_std_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              -[LiveFSFPExtensionHelper trashItemWithIdentifier:completionHandler:]();
            }

            v7[2](v7, 0, v10);
            id v13 = 0;
            goto LABEL_29;
          }
          xpc_connection_cancel(connection);
LABEL_21:
          id v13 = [v14 parent];
          id v28 = [v13 itemIdentifier];
          id v55 = v20;
          uint64_t v29 = [(LiveFSFPExtensionHelper *)self enumeratorForContainerItemIdentifier:v28 error:&v55];
          id v10 = v55;

          int v30 = *(void **)(*((void *)&buf + 1) + 40);
          *(void *)(*((void *)&buf + 1) + 40) = v29;

          id v31 = *(void **)(*((void *)&buf + 1) + 40);
          if (v31)
          {
            uint64_t v32 = [v31 ensureConnectedForUpdates];

            id v10 = (id)v32;
          }
          if (v10)
          {
            v7[2](v7, 0, v10);
LABEL_29:

            _Block_object_dispose(&buf, 8);
            goto LABEL_8;
          }
          BOOL v33 = livefs_std_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v56 = 0;
            _os_log_impl(&dword_22CE49000, v33, OS_LOG_TYPE_DEFAULT, "about to dispatch_async actual trashing work", v56, 2u);
          }

          renameUpdateQueue = self->renameUpdateQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_236;
          block[3] = &unk_2649344E8;
          id v48 = v14;
          id v49 = self;
          id v53 = v7;
          p_long long buf = &buf;
          id v13 = v13;
          id v50 = v13;
          id v51 = v44;
          id v52 = v46;
          dispatch_async(renameUpdateQueue, block);

          id v20 = 0;
          int v24 = v48;
LABEL_28:

          id v10 = v20;
          goto LABEL_29;
        }
      }
      else
      {
      }
    }
    xpc_object_t xdict = 0;
    connection = 0;
    BOOL v25 = 0;
    goto LABEL_21;
  }
  id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:513 userInfo:0];
  v7[2](v7, 0, v12);

LABEL_7:
  id v13 = 0;
  id v14 = 0;
LABEL_8:
}

void __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_236(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) filename];
  uint64_t v3 = (void *)[v2 copy];

  id v4 = objc_alloc(MEMORY[0x263F52280]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_2;
  v24[3] = &unk_264934470;
  id v5 = *(id *)(a1 + 72);
  v24[4] = *(void *)(a1 + 40);
  id v25 = v5;
  uint64_t v26 = *(void *)(a1 + 80);
  id v6 = (void *)[v4 initWithCount:2 workBlock:v24];
  id v7 = *(void **)(a1 + 48);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_239;
  v22[3] = &unk_264934498;
  id v8 = v6;
  id v23 = v8;
  [v7 afterRename:v3 performBlock:v22];
  BOOL v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22CE49000, v9, OS_LOG_TYPE_DEFAULT, "registered for renameUpdate", buf, 2u);
  }

  id v10 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_240;
  v15[3] = &unk_2649344C0;
  id v16 = v10;
  id v17 = *(id *)(a1 + 48);
  id v18 = v3;
  id v19 = v8;
  id v20 = *(id *)(a1 + 72);
  id v12 = v8;
  id v13 = v3;
  objc_msgSend(v16, "fp_trashUnderFolder:completionHandler:", v11, v15);
  id v14 = livefs_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22CE49000, v14, OS_LOG_TYPE_DEFAULT, "Asked FP to trash the item", buf, 2u);
  }
}

void __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 parameter];

  if (v4)
  {
    id v5 = [v3 parameter];
    id v6 = (void *)a1[4];
    id v14 = 0;
    id v7 = [v6 itemForURL:v5 error:&v14];
    id v8 = v14;
    BOOL v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_22CE49000, v9, OS_LOG_TYPE_DEFAULT, "trash returning item %@ newError %@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v12 = a1[5];
    id v13 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
}

uint64_t __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_239(uint64_t a1)
{
  return [*(id *)(a1 + 32) approve];
}

void __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_240(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = livefs_std_log();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = *(void **)(a1 + 32);
      int v10 = 138412802;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_22CE49000, v8, OS_LOG_TYPE_ERROR, "trashing item at url %@ newURL %@ failed with error: %@", (uint8_t *)&v10, 0x20u);
    }

    [*(id *)(a1 + 40) dropAfterRenameBlockForName:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) abort];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_22CE49000, v8, OS_LOG_TYPE_DEFAULT, "item trashed, newURL:%@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 56) setParameter:v5];
    [*(id *)(a1 + 56) approve];
  }
}

- (void)untrashItemWithIdentifier:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, id))a5;
  uint64_t v35 = 0;
  gid_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__0;
  id v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v42 = v8;
    _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_INFO, "untrashing item %@", buf, 0xCu);
  }

  id v34 = 0;
  __int16 v12 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v8 error:&v34];
  id v13 = v34;
  if (!v12)
  {
    id v22 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v8];
    v10[2](v10, 0, v22);
    id v17 = 0;
    id v14 = 0;
LABEL_16:

    id v16 = v9;
    goto LABEL_17;
  }
  id v14 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v8];
  if (!v14)
  {
    id v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4 userInfo:0];
    v10[2](v10, 0, v22);
    id v17 = 0;
    id v14 = 0;
    goto LABEL_16;
  }
  id v15 = (void *)*MEMORY[0x263F053F0];
  if (v9) {
    id v15 = v9;
  }
  id v16 = v15;

  id v17 = [v12 parent];
  if (!v17)
  {
    id v22 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    v10[2](v10, 0, v22);
    id v17 = 0;
    id v9 = v16;
    goto LABEL_16;
  }
  id v33 = v13;
  uint64_t v18 = [(LiveFSFPExtensionHelper *)self enumeratorForContainerItemIdentifier:v16 error:&v33];
  id v19 = v33;

  id v20 = (void *)v36[5];
  void v36[5] = v18;

  id v21 = (void *)v36[5];
  if (!v21)
  {
    id v13 = v19;
    if (v19) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  id v13 = [v21 ensureConnectedForUpdates];

  if (!v13)
  {
LABEL_15:
    id v23 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v16];
    renameUpdateQueue = self->renameUpdateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke;
    block[3] = &unk_264934588;
    id v26 = v12;
    id v17 = v17;
    id v27 = v17;
    id v28 = self;
    uint64_t v32 = &v35;
    id v31 = v10;
    id v14 = v14;
    id v29 = v14;
    id v30 = v23;
    id v22 = v23;
    dispatch_async(renameUpdateQueue, block);

    id v13 = 0;
    id v9 = v16;
    goto LABEL_16;
  }
LABEL_10:
  v10[2](v10, 0, v13);
LABEL_17:
  _Block_object_dispose(&v35, 8);
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  id v18 = 0;
  v2 = [*(id *)(a1 + 32) filename];
  id v3 = (void *)[v2 copy];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  _DWORD v13[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_264934538;
  id v4 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  id v15 = v17;
  uint64_t v16 = v5;
  id v14 = v6;
  [v4 afterRename:v3 performBlock:v13];
  id v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_241;
  v9[3] = &unk_264934560;
  __int16 v12 = v17;
  id v10 = v7;
  id v11 = *(id *)(a1 + 72);
  objc_msgSend(v10, "fp_reparentUnderFolder:allowBouncing:completionHandler:", v8, 1, v9);

  _Block_object_dispose(v17, 8);
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 136);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_264934510;
  uint64_t v3 = *(void *)(a1 + 56);
  void block[4] = v1;
  uint64_t v8 = v3;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  dispatch_async(v2, block);
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_3(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v9 = 0;
  id v4 = [v2 itemForURL:v3 error:&v9];
  id v5 = v9;
  id v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_22CE49000, v6, OS_LOG_TYPE_DEFAULT, "untrash returning item %@ newError %@", buf, 0x16u);
  }

  uint64_t v7 = *(void *)(a1[7] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  (*(void (**)(void))(a1[5] + 16))();
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_241(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (!v6)
  {
    uint64_t v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_241_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)deleteItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v6;
    _os_log_impl(&dword_22CE49000, v8, OS_LOG_TYPE_DEFAULT, "deleting item %@", buf, 0xCu);
  }

  id v9 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v6 error:0];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 parent];
    __int16 v12 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v6];
    id v13 = [MEMORY[0x263F08850] defaultManager];
    id v21 = 0;
    [v13 removeItemAtURL:v12 error:&v21];
    id v14 = v21;

    if (!v14)
    {
      itemIDMap = self->itemIDMap;
      uint64_t v16 = [v10 itemIdentifier];
      [(NSMapTable *)itemIDMap removeObjectForKey:v16];

      itemCache = self->itemCache;
      id v18 = [v10 itemIdentifier];
      [(LiveFSLRUCache *)itemCache removeObjectForKey:v18];

      [v11 setAttributesStale];
    }
    id v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v14;
      _os_log_impl(&dword_22CE49000, v19, OS_LOG_TYPE_DEFAULT, "deleting returning %@", buf, 0xCu);
    }

    v7[2](v7, v14);
  }
  else
  {
    id v20 = livefs_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22CE49000, v20, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    id v11 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v6];
    v7[2](v7, v11);
  }
}

- (void)setLastUsedDate:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v23 = "-[LiveFSFPExtensionHelper setLastUsedDate:forItemIdentifier:completionHandler:]";
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_INFO, "%s: setting lastUsedDate %@ for %@", buf, 0x20u);
  }

  __int16 v12 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v9 error:0];
  id v13 = v12;
  if (!v12)
  {
    id v16 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v9];
    v10[2](v10, 0, v16);
LABEL_15:

    goto LABEL_16;
  }
  if ((id)*MEMORY[0x263F053F0] != v9)
  {
    id v14 = [v12 fullPath];
    int v15 = open((const char *)[v14 UTF8String], 0);

    if (v15 < 0)
    {
      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *__error();
      id v20 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v9];
      objc_msgSend(v18, "fp_errorWithPOSIXCode:itemURL:debugDescription:", v19, v20, @"Opening file for setLastUsedDate");
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      id v21 = livefs_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSFPExtensionHelper setLastUsedDate:forItemIdentifier:completionHandler:]();
      }

      id v17 = +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:v16];
      v10[2](v10, 0, v17);
    }
    else
    {
      FPFileMetadataSetLastUsedDate();
      id v16 = 0;
      close(v15);
      if (!v16) {
        [v13 setLastUsedDate:v8];
      }
      id v17 = +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:v16];
      ((void (**)(id, void *, id))v10)[2](v10, v13, v17);
    }

    goto LABEL_15;
  }
  ((void (**)(id, void *, id))v10)[2](v10, v12, 0);
LABEL_16:
}

- (void)setTagData:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!self->_supportsTagging)
  {
    uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
LABEL_12:
    id v13 = (void *)v20;
    v10[2](v10, 0, v20);
    goto LABEL_18;
  }
  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v26 = "-[LiveFSFPExtensionHelper setTagData:forItemIdentifier:completionHandler:]";
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_INFO, "%s: setting tagData %@ for %@", buf, 0x20u);
  }

  __int16 v12 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v9 error:0];
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v9];
    goto LABEL_12;
  }
  id v13 = v12;
  if ((id)*MEMORY[0x263F053F0] == v9)
  {
    ((void (**)(id, void *, uint64_t))v10)[2](v10, v12, 0);
  }
  else
  {
    id v14 = [v12 fullPath];
    int v15 = (const char *)[v14 UTF8String];

    int v16 = open(v15, 0);
    if (v16 < 0)
    {
      id v21 = livefs_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSFPExtensionHelper setTagData:forItemIdentifier:completionHandler:]((uint64_t)v15, v21);
      }

      id v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *__error();
      __int16 v24 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v9];
      objc_msgSend(v22, "fp_errorWithPOSIXCode:itemURL:debugDescription:", v23, v24, @"Opening file for setTagData");
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v19 = +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:v18];
      v10[2](v10, 0, (uint64_t)v19);
    }
    else
    {
      int v17 = v16;
      FPFileMetadataSetTagData();
      id v18 = 0;
      close(v17);
      if (!v18) {
        [v13 setTagData:v8];
      }
      uint64_t v19 = +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:v18];
      ((void (**)(id, void *, uint64_t))v10)[2](v10, v13, (uint64_t)v19);
    }
  }
LABEL_18:
}

- (void)setFavoriteRank:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v27 = "-[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:]";
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_INFO, "%s: setting rank %@ for %@", buf, 0x20u);
  }

  __int16 v12 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v9 error:0];
  id v13 = v12;
  if (!v12)
  {
    uint64_t v20 = livefs_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v27 = "-[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:]";
      _os_log_impl(&dword_22CE49000, v20, OS_LOG_TYPE_INFO, "%s: item not found", buf, 0xCu);
    }

    id v18 = [MEMORY[0x263F087E8] fileProviderErrorForNonExistentItemWithIdentifier:v9];
    v10[2](v10, 0, v18);
    goto LABEL_19;
  }
  if ((id)*MEMORY[0x263F053F0] != v9)
  {
    id v14 = [v12 fullPath];
    int v15 = (const char *)[v14 UTF8String];

    int v16 = open(v15, 0);
    if (v16 < 0)
    {
      id v22 = livefs_std_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:]((uint64_t)v15, v22);
      }

      uint64_t v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *__error();
      id v25 = [(LiveFSFPExtensionHelper *)self URLForItemWithIdentifier:v9];
      objc_msgSend(v23, "fp_errorWithPOSIXCode:itemURL:debugDescription:", v24, v25, @"Opening file for setFavoriteRank");
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v19 = +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:v18];
      v10[2](v10, 0, v19);
    }
    else
    {
      int v17 = v16;
      FPFileMetadataSetFavoriteRank();
      id v18 = 0;
      close(v17);
      if (!v18) {
        [v13 setFavoriteRank:v8];
      }
      uint64_t v19 = +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:v18];
      ((void (**)(id, void *, id))v10)[2](v10, v13, v19);
    }

LABEL_19:
    goto LABEL_20;
  }
  id v21 = livefs_std_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:]();
  }

  ((void (**)(id, void *, id))v10)[2](v10, v13, 0);
LABEL_20:
}

- (id)disconnectWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void *))a4;
  id v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(NSFileProviderExtension *)self domain];
    id v8 = [v7 identifier];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[LiveFSFPExtensionHelper disconnectWithOptions:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_22CE49000, v6, OS_LOG_TYPE_DEFAULT, "%s: called on domain %@", buf, 0x16u);
  }
  id v9 = [(NSFileProviderExtension *)self domain];
  if (!v9) {
    goto LABEL_9;
  }
  id v10 = [(NSFileProviderExtension *)self domain];
  id v11 = [v10 identifier];
  BOOL v12 = v11 == 0;

  if (v12)
  {
LABEL_9:
    uint64_t v20 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    v5[2](v5, v20);

    uint64_t v19 = objc_opt_new();
  }
  else
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v28 = __Block_byref_object_copy__0;
    id v29 = __Block_byref_object_dispose__0;
    id v30 = 0;
    id v13 = self;
    objc_sync_enter(v13);
    id v14 = (id *)(*(void *)&buf[8] + 40);
    id obj = *(id *)(*(void *)&buf[8] + 40);
    BOOL v15 = [(LiveFSFPExtensionHelper *)v13 _hasManagerOrError:&obj];
    objc_storeStrong(v14, obj);
    if (v15)
    {
      objc_sync_exit(v13);

      int v16 = v13->_manager;
      int v17 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke;
      block[3] = &unk_2649345D8;
      void block[4] = v13;
      id v25 = buf;
      id v13 = v16;
      uint64_t v23 = v13;
      uint64_t v24 = v5;
      dispatch_async(v17, block);
      id v18 = livefs_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[LiveFSFPExtensionHelper disconnectWithOptions:completionHandler:]();
      }

      uint64_t v19 = objc_opt_new();
    }
    else
    {
      v5[2](v5, *(void **)(*(void *)&buf[8] + 40));
      uint64_t v19 = objc_opt_new();
      objc_sync_exit(v13);
    }

    _Block_object_dispose(buf, 8);
  }

  return v19;
}

uint64_t __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) domain];
    id v4 = [v3 identifier];
    *(_DWORD *)long long buf = 138412290;
    id v29 = v4;
    _os_log_impl(&dword_22CE49000, v2, OS_LOG_TYPE_DEFAULT, "About to call forgetVolume on %@", buf, 0xCu);
  }
  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) domain];
  id v7 = [v6 identifier];
  uint64_t v8 = [v5 forgetVolume:v7 withFlags:3];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    id v29 = v12;
    _os_log_impl(&dword_22CE49000, v11, OS_LOG_TYPE_DEFAULT, "forgetVolume returned %@", buf, 0xCu);
  }

  BOOL v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v15)
  {
    int v16 = [v15 domain];
    if (![v16 isEqualToString:*MEMORY[0x263F07F70]])
    {
LABEL_9:

      return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13, v14);
    }
    uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code];

    if (v17 == 4)
    {
      id v18 = (void *)MEMORY[0x263F055B8];
      uint64_t v19 = [*(id *)(a1 + 32) domain];
      int v16 = [v18 managerForDomain:v19];

      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      id v21 = [*(id *)(a1 + 32) domain];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_253;
      v25[3] = &unk_2649345B0;
      dispatch_semaphore_t v26 = v20;
      id v27 = *(id *)(a1 + 48);
      id v22 = v20;
      [v16 removeDomain:v21 completionHandler:v25];

      dispatch_time_t v23 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v22, v23);

      goto LABEL_9;
    }
  }
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13, v14);
}

void __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_253(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = livefs_std_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_253_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = 0;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_DEFAULT, "Self removeDomain replied %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(NSFileProviderExtension *)self domain];
  if (!v7)
  {
LABEL_8:
    id v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]();
    }

    id v16 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    if (!v16) {
      goto LABEL_14;
    }
    uint64_t v17 = livefs_std_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(NSFileProviderExtension *)self domain];
  uint64_t v10 = [v9 identifier];
  if (!v10)
  {

    goto LABEL_8;
  }
  id v11 = (void *)v10;
  BOOL v12 = [(NSFileProviderExtension *)self domain];
  uint64_t v13 = [v12 identifier];
  int v14 = [v13 isEqualToString:&stru_26E048A08];

  if (v14) {
    goto LABEL_8;
  }
  BOOL v15 = [(LiveFSFPExtensionHelper *)self ensureMountPathSetup];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = livefs_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
LABEL_12:
    }
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]();
LABEL_13:

LABEL_14:
    if (a4) {
      *a4 = v16;
    }

    id v19 = 0;
    goto LABEL_17;
  }
  id v21 = livefs_std_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [(LiveFSFPExtensionHelper *)self clusterMasterID];
    *(_DWORD *)long long buf = 136316162;
    id v34 = "-[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]";
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v22;
    __int16 v39 = 1024;
    BOOL v40 = [(LiveFSFPExtensionHelper *)self isClusterMaster];
    __int16 v41 = 1024;
    BOOL v42 = [(LiveFSFPExtensionHelper *)self isClusterDomain];
    _os_log_impl(&dword_22CE49000, v21, OS_LOG_TYPE_DEFAULT, "%s starting for containerItem %@, clusterMasterID (%@), clusterMaster (%d) clusterDomain (%d)", buf, 0x2Cu);
  }
  if ([(LiveFSFPExtensionHelper *)self isClusterMaster])
  {
    id v19 = +[LiveFSFPClusterEnumeratorHelper newWithEnumeratedItem:v6 extension:self error:a4];
    goto LABEL_17;
  }
  int v23 = [v6 isEqualToString:*MEMORY[0x263F05400]];
  uint64_t v24 = livefs_std_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      dispatch_semaphore_t v26 = [(NSFileProviderExtension *)self domain];
      id v27 = [v26 identifier];
      *(_DWORD *)long long buf = 136315394;
      id v34 = "-[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]";
      __int16 v35 = 2112;
      id v36 = v27;
      _os_log_impl(&dword_22CE49000, v24, OS_LOG_TYPE_DEFAULT, "%s starting for container NSFileProviderWorkingSetContainerItemIdentifier self.domain.identifier %@", buf, 0x16u);
    }
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:0];
    if (!v16) {
      goto LABEL_14;
    }
    uint64_t v17 = livefs_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]();
    }
    goto LABEL_13;
  }
  if (v25)
  {
    __int16 v28 = [(NSFileProviderExtension *)self domain];
    id v29 = [v28 identifier];
    *(_DWORD *)long long buf = 136315394;
    id v34 = "-[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]";
    __int16 v35 = 2112;
    id v36 = v29;
    _os_log_impl(&dword_22CE49000, v24, OS_LOG_TYPE_DEFAULT, "%s starting for container LiveFSFPEnumeratorHelper self.domain.identifier %@", buf, 0x16u);
  }
  id v32 = 0;
  id v19 = +[LiveFSFPEnumeratorHelper newWithEnumeratedItem:v6 extension:self error:&v32];
  id v30 = v32;
  if (v30)
  {
    uint64_t v31 = livefs_std_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]();
    }
  }
  if (a4) {
    *a4 = v30;
  }

LABEL_17:
  return v19;
}

- (id)supportedServiceSourcesForItemIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NSFileProviderExtension *)self domain];
    uint64_t v9 = [v8 identifier];
    *(_DWORD *)long long buf = 138412802;
    __int16 v28 = self;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_22CE49000, v7, OS_LOG_TYPE_DEFAULT, "supportedServices called in extension %@, domain id %@ item %@", buf, 0x20u);
  }
  uint64_t v10 = [(NSFileProviderExtension *)self domain];
  if (!v10) {
    goto LABEL_7;
  }
  id v11 = (void *)v10;
  BOOL v12 = [(NSFileProviderExtension *)self domain];
  uint64_t v13 = [v12 identifier];

  if (v13)
  {
    int v14 = [[LiveFSFPUnlockServiceSource alloc] initWithFileProviderExtension:self itemIdentifier:v6];
    id v24 = 0;
    BOOL v15 = [(LiveFSFPExtensionHelper *)self itemForIdentifier:v6 error:&v24];
    id v16 = v24;
    if (v15)
    {
      uint64_t v17 = [[LiveFSClientServiceSource alloc] initWithFileProviderExtension:self itemIdentifier:v6];
      id v18 = [[LiveFSValidationServiceSource alloc] initWithFileProviderExtension:self itemIdentifier:v6];
      thumbnailsServiceSource = self->thumbnailsServiceSource;
      v25[0] = v17;
      v25[1] = thumbnailsServiceSource;
      v25[2] = v18;
      v25[3] = v14;
      dispatch_semaphore_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    }
    else if ([v6 isEqualToString:*MEMORY[0x263F053F0]])
    {
      dispatch_semaphore_t v26 = v14;
      dispatch_semaphore_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    }
    else
    {
      id v21 = v16;
      if (v21)
      {
        id v22 = livefs_std_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[LiveFSFPExtensionHelper supportedServiceSourcesForItemIdentifier:error:]();
        }
      }
      if (a4) {
        *a4 = v21;
      }

      dispatch_semaphore_t v20 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
LABEL_7:
    id v16 = livefs_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[LiveFSFPExtensionHelper supportedServiceSourcesForItemIdentifier:error:]();
    }
    dispatch_semaphore_t v20 = (void *)MEMORY[0x263EFFA68];
  }

  return v20;
}

- (id)enumeratorForSearchQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(LiveFSFPExtensionHelper *)self serverSearchUsesCS])
  {
    id v7 = objc_alloc(MEMORY[0x263F054F0]);
    uint64_t v8 = [(NSFileProviderExtension *)self domain];
    uint64_t v9 = [v8 identifier];
    uint64_t v10 = (void *)[v7 initWithSearchQuery:v6 mountPoint:v9];
  }
  else
  {
    id v11 = +[LiveFSFPSearchEnumeratorHelper newForQuery:v6 withExtension:self];
    uint64_t v10 = v11;
    if (a4 && !v11)
    {
      *a4 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
    }
  }

  return v10;
}

- (id)clusterDomainItemsOrError:(id *)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)unlockWithPassword:(id)a3 remember:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:45];
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

+ (id)getNSErrorFromLiveFSErrno:(int)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (a3 > 44)
  {
    if (a3 > 79)
    {
      switch(a3)
      {
        case 80:
          goto LABEL_19;
        case 89:
          id v3 = (void *)MEMORY[0x263F087E8];
          uint64_t v4 = *MEMORY[0x263F07F70];
          uint64_t v5 = 3072;
          goto LABEL_26;
        case 10100:
LABEL_19:
          id v3 = (void *)MEMORY[0x263F087E8];
          uint64_t v4 = *MEMORY[0x263F05370];
          uint64_t v5 = -1000;
          goto LABEL_26;
      }
    }
    else
    {
      if (a3 == 45)
      {
        id v3 = (void *)MEMORY[0x263F087E8];
        uint64_t v4 = *MEMORY[0x263F07F70];
        uint64_t v5 = 3328;
        goto LABEL_26;
      }
      if (a3 == 57 || a3 == 65)
      {
        id v3 = (void *)MEMORY[0x263F087E8];
        uint64_t v4 = *MEMORY[0x263F05370];
        uint64_t v5 = -1004;
        goto LABEL_26;
      }
    }
    goto LABEL_30;
  }
  if (a3 <= 21)
  {
    switch(a3)
    {
      case 0:
        id v6 = 0;
        goto LABEL_27;
      case 2:
        id v3 = (void *)MEMORY[0x263F087E8];
        uint64_t v4 = *MEMORY[0x263F07F70];
        uint64_t v5 = 4;
        goto LABEL_26;
      case 13:
        id v3 = (void *)MEMORY[0x263F087E8];
        uint64_t v4 = *MEMORY[0x263F07F70];
        uint64_t v5 = 257;
LABEL_26:
        id v6 = [v3 errorWithDomain:v4 code:v5 userInfo:0];
        goto LABEL_27;
    }
    goto LABEL_30;
  }
  if (a3 != 22)
  {
    if (a3 == 28)
    {
      id v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = *MEMORY[0x263F07F70];
      uint64_t v5 = 640;
      goto LABEL_26;
    }
    if (a3 == 30)
    {
      id v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = *MEMORY[0x263F07F70];
      uint64_t v5 = 642;
      goto LABEL_26;
    }
LABEL_30:
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F07F70];
    uint64_t v15 = *MEMORY[0x263F08608];
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a3 userInfo:0];
    id v16 = v9;
    uint64_t v10 = NSDictionary;
    id v11 = &v16;
    BOOL v12 = &v15;
    goto LABEL_31;
  }
  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F07F70];
  uint64_t v17 = *MEMORY[0x263F08608];
  uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
  v18[0] = v9;
  uint64_t v10 = NSDictionary;
  id v11 = (void **)v18;
  BOOL v12 = &v17;
LABEL_31:
  int v14 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
  id v6 = [v7 errorWithDomain:v8 code:256 userInfo:v14];

LABEL_27:
  return v6;
}

+ (id)getNSErrorFromUnknownError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3
    && ([v3 domain],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*MEMORY[0x263F08438]],
        v5,
        v6))
  {
    [v4 code];
    getNSErrorFromLiveFSErrno();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }
  uint64_t v8 = v7;

  return v8;
}

- (NSURL)docPath
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMountPath:(id)a3
{
}

- (LiveFSClient)manager
{
  return self->_manager;
}

- (NSXPCConnection)conn
{
  return self->_conn;
}

- (LiveFSVolumeClient)serviceClient
{
  return self->_serviceClient;
}

- (BOOL)idsPersist
{
  return self->_idsPersist;
}

- (BOOL)isReadOnlyVolume
{
  return self->_isReadOnlyVolume;
}

- (BOOL)supportsTagging
{
  return self->_supportsTagging;
}

- (BOOL)fetchRoot
{
  return self->_fetchRoot;
}

- (void)setFetchRoot:(BOOL)a3
{
  self->_fetchRoot = a3;
}

- (OS_dispatch_queue)enumeratorHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)isClusterDomain
{
  return self->_clusterDomain;
}

- (void)setClusterDomain:(BOOL)a3
{
  self->_clusterDomain = a3;
}

- (BOOL)isClusterMaster
{
  return self->_clusterMaster;
}

- (void)setClusterMaster:(BOOL)a3
{
  self->_clusterMaster = a3;
}

- (NSString)clusterMasterID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)isDead
{
  return self->_isDead;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterMasterID, 0);
  objc_storeStrong((id *)&self->_enumeratorHelperQueue, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_mountPath, 0);
  objc_storeStrong((id *)&self->_docPath, 0);
  objc_storeStrong((id *)&self->renameUpdateQueue, 0);
  objc_storeStrong((id *)&self->thumbnailsServiceSource, 0);
  objc_storeStrong((id *)&self->itemCache, 0);
  objc_storeStrong((id *)&self->enumerators, 0);
  objc_storeStrong((id *)&self->itemHandleMap, 0);
  objc_storeStrong((id *)&self->itemIDMap, 0);
  objc_storeStrong((id *)&self->providerName, 0);
  objc_storeStrong((id *)&self->connectionURL, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22CE49000, v0, v1, "LiveFS FileProvider Unable to init extension. Exiting.", v2, v3, v4, v5, v6);
}

- (void)itemPathForURL:.cold.1()
{
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_22CE49000, v0, OS_LOG_TYPE_DEBUG, "About to return root path", v1, 2u);
}

- (void)itemPathForURL:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22CE49000, v0, v1, "%s: returning path %@", v2, v3, v4, v5, 2u);
}

- (void)itemPathForURL:(uint64_t)a1 .cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_22CE49000, v1, v2, "url isn't in our path. '%@' not in '%@'", (void)v3, DWORD2(v3));
}

- (void)itemForPath:cachedOnly:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

- (void)_hasManagerOrError:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22CE49000, v0, v1, "LiveFS FileProvider Extension: Unable to connect to smbclientd. Exiting.", v2, v3, v4, v5, v6);
}

- (void)_hasManagerOrError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[LiveFSFPExtensionHelper _hasManagerOrError:]";
  OUTLINED_FUNCTION_6(&dword_22CE49000, a1, a3, "%s: need new manager, about to get it", (uint8_t *)&v3);
}

- (void)getVolumeManagerWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22CE49000, a2, a3, "getVolManager returning error %@", a5, a6, a7, a8, 2u);
}

- (void)makeVolumeListenerEndpointAndReturnErrorLocked:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

- (void)makeVolumeListenerEndpointAndReturnErrorLocked:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makeVolumeListenerEndpointAndReturnErrorLocked:.cold.4()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: got vols %@ error %@", v2);
}

- (void)_isLoggedInOrErrorLocked:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

- (void)_isLoggedInOrErrorLocked:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "-[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:]";
  OUTLINED_FUNCTION_6(&dword_22CE49000, a1, a3, "%s: got connection", (uint8_t *)&v3);
}

- (void)_isLoggedInOrErrorLocked:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 domain];
  uint64_t v5 = [v4 identifier];
  uint8_t v6 = [a1 domain];
  int v7 = 136315650;
  uint64_t v8 = "-[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:]";
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  BOOL v12 = v6;
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "%s: About to get listener for volume %@ domain %@", (uint8_t *)&v7, 0x20u);
}

- (void)_isLoggedInOrErrorLocked:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = [a1 domain];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_22CE49000, a2, v5, "Cluster master %@ doesn't need a listener", v6);
}

- (void)_isLoggedInOrErrorLocked:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = [a1 domain];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_22CE49000, a2, v5, "We already have connection for %@, bailing early", v6);
}

- (void)pathForInodeID:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

- (void)itemForIdentifierLocked:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

- (void)itemForIdentifierLocked:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22CE49000, v0, v1, "%s starting for ID %@", v2, v3, v4, v5, 2u);
}

- (void)itemForIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

- (void)URLForItemWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_22CE49000, v0, OS_LOG_TYPE_FAULT, "Call to URLForItemWithIdentifier: in unconfigured domain", v1, 2u);
}

- (void)URLForItemWithIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)itemAtPathLocked:(uint64_t)a1 parent:(NSObject *)a2 cachedOnly:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315650;
  uint64_t v4 = "-[LiveFSFPExtensionHelper itemAtPathLocked:parent:cachedOnly:]";
  __int16 v5 = 2080;
  uint8_t v6 = "(ignored by caller)";
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_22CE49000, a2, OS_LOG_TYPE_ERROR, "%s: %s error: %@", (uint8_t *)&v3, 0x20u);
}

- (void)persistentIdentifierForItemAtURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22CE49000, v0, v1, "%s: returning fh %@", v2, v3, v4, v5, 2u);
}

- (void)providePlaceholderAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22CE49000, v0, v1, "%s starting for %@", v2, v3, v4, v5, 2u);
}

- (void)startProvidingItemAtURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22CE49000, v0, v1, "%s starting for %@", v2, v3, v4, v5, 2u);
}

- (void)stopProvidingItemAtURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22CE49000, v0, v1, "%s starting for url %@", v2, v3, v4, v5, 2u);
}

void __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_22CE49000, v0, v1, "couldn't find item after importing it: %@", v2);
}

void __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_22CE49000, v1, OS_LOG_TYPE_DEBUG, "got new URL %@; %@", (uint8_t *)&v2, 0x16u);
}

- (void)createDirectoryWithName:inParentItemIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22CE49000, v0, v1, "ensureFileHandleOrError returned %@", v2, v3, v4, v5, v6);
}

- (void)createDirectoryWithName:(void *)a1 inParentItemIdentifier:(NSObject *)a2 completionHandler:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 domain];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22CE49000, a2, OS_LOG_TYPE_ERROR, "Cluster master %@ is not writable", v5, 0xCu);
}

- (void)createDirectoryWithName:inParentItemIdentifier:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22CE49000, v0, v1, "_isLoggedInOrError returned %@", v2, v3, v4, v5, v6);
}

- (void)renameItemWithIdentifier:(os_log_t)log toName:(void *)a4 completionHandler:.cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22CE49000, log, OS_LOG_TYPE_ERROR, "Cluster master %@ is not writable", buf, 0xCu);
}

- (void)reparentItemWithIdentifier:(NSObject *)a3 toParentItemWithIdentifier:newName:completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_22CE49000, a3, (uint64_t)a3, "passed new name is null, changing to %@", (uint8_t *)a2);
}

- (void)trashItemWithIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22CE49000, v0, v1, "creating the trash directory failed with error: %@", v2, v3, v4, v5, v6);
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_241_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_22CE49000, v1, v2, "untrashing item at url %@ failed with error: %@", (void)v3, DWORD2(v3));
}

- (void)setLastUsedDate:forItemIdentifier:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_22CE49000, v0, v1, "lastUsedDate: error '%@' opening file", v2);
}

- (void)setTagData:(uint64_t)a1 forItemIdentifier:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_22CE49000, a2, OS_LOG_TYPE_DEBUG, "tagData: error '%s' opening file %s", v4, 0x16u);
}

- (void)setFavoriteRank:forItemIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_22CE49000, v0, OS_LOG_TYPE_DEBUG, "Faking success for setting fav rank for root item", v1, 2u);
}

- (void)setFavoriteRank:(uint64_t)a1 forItemIdentifier:(NSObject *)a2 completionHandler:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_22CE49000, a2, OS_LOG_TYPE_ERROR, "setFavoriteRank: error '%s' opening file %s", v4, 0x16u);
}

- (void)disconnectWithOptions:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22CE49000, v0, v1, "forget has been dispatched", v2, v3, v4, v5, v6);
}

void __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_253_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22CE49000, v0, v1, "Self removeDomain replied %@", v2, v3, v4, v5, v6);
}

- (void)enumeratorForContainerItemIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

- (void)enumeratorForContainerItemIdentifier:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_22CE49000, v0, OS_LOG_TYPE_FAULT, "Call to enumeratorForContainerItemIdentifier:error: in unconfigured domain", v1, 2u);
}

- (void)supportedServiceSourcesForItemIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22CE49000, v0, v1, "Returning no services on the default domain", v2, v3, v4, v5, v6);
}

- (void)supportedServiceSourcesForItemIdentifier:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22CE49000, v0, v1, "%s: %s error: %@");
}

@end