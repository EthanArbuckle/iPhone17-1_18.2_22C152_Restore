@interface BRFileProviderExtension
+ (void)initialize;
- (BOOL)_isLoggedInOrError:(id *)a3;
- (BRFileProviderExtension)init;
- (CGSize)_properSizeForContainerThumbnail:(CGSize)a3;
- (id)URLForItemWithPersistentIdentifier:(id)a3;
- (id)_URLForItemWithPersistentIdentifier:(id)a3 resolvingBRAliases:(BOOL)a4;
- (id)_URLForItemWithPersistentIdentifier:(id)a3 resolvingBRAliases:(BOOL)a4 attachPhysical:(BOOL)a5;
- (id)_defaultApplicationContainerForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (id)_propertiesForItemAtURL:(id)a3 error:(id *)a4;
- (id)_propertiesForItemAtURL:(id)a3 forceScan:(BOOL)a4 error:(id *)a5;
- (id)_propertiesForNewItemAtURL:(id)a3 error:(id *)a4;
- (id)enumeratorForContainerItemIdentifier:(id)a3 error:(id *)a4;
- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithType:(id)a5 completionHandler:(id)a6;
- (id)fileProviderErrorFromFSError:(id)a3;
- (id)itemForIdentifier:(id)a3 error:(id *)a4;
- (id)persistentIdentifierForItemAtURL:(id)a3;
- (id)supportedServiceSourcesForItemIdentifier:(id)a3 error:(id *)a4;
- (void)_accountDidChange;
- (void)_fetchThumbnailForContainerID:(id)a3 representedByItemWithIdentifer:(id)a4 size:(CGSize)a5 knownContainers:(id)a6 perThumbnailCompletionHandler:(id)a7;
- (void)_trashItemAtURLWithoutCoordination:(id)a3 completionHandler:(id)a4;
- (void)collaborationCoordinator:(id)a3 handleStartCollaborationAction:(id)a4;
- (void)collaborationMetadataForItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)createDirectoryWithName:(id)a3 inParentItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)deleteItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)importDocumentAtURL:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)itemChangedAtURL:(id)a3;
- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationURL:(id)a4 completionHandler:(id)a5;
- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4;
- (void)renameItemWithIdentifier:(id)a3 toName:(id)a4 completionHandler:(id)a5;
- (void)reparentItemWithIdentifier:(id)a3 toParentItemWithIdentifier:(id)a4 newName:(id)a5 completionHandler:(id)a6;
- (void)setFavoriteRank:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setLastUsedDate:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setTagData:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5;
- (void)startProvidingItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)startProvidingItemAtURL:(id)a3 readingOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)stopProvidingItemAtURL:(id)a3;
- (void)trashItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)untrashItemWithIdentifier:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation BRFileProviderExtension

- (void)collaborationMetadataForItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002352C((uint64_t)v8, v9);
  }

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_10000F96C;
  v27 = sub_10000F97C;
  id v28 = 0;
  id v22 = 0;
  v10 = [(BRFileProviderExtension *)self itemForIdentifier:v6 error:&v22];
  id v11 = v22;
  if (v11 || ([v10 isShared] & 1) != 0)
  {
    v12 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v6];
    if (v12)
    {
      id v20 = v6;
      id v21 = v7;
      BRFetchCKShareForItemAtURL();

      id v13 = v20;
    }
    else
    {
      v14 = brc_bread_crumbs();
      v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
        sub_10002344C();
      }

      id v13 = +[NSError brc_errorItemNotFound:v6];
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
    }
  }
  else
  {
    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000234B4((uint64_t)v16, v17);
    }

    uint64_t v18 = +[CKAllowedSharingOptions standardOptions];
    v19 = (void *)v24[5];
    v24[5] = v18;

    [(id)v24[5] setSupportAllowingAddedParticipantsToInviteOthers:1];
    v12 = [(id)v24[5] shareOptions];
    id v13 = [objc_alloc((Class)_SWCollaborationMetadata) initWithLocalIdentifier:v6 collaborationIdentifier:&stru_100039160 title:0 defaultShareOptions:v12 initiatorHandle:0 initiatorNameComponents:0];
    (*((void (**)(id, id, void))v7 + 2))(v7, v13, 0);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)collaborationCoordinator:(id)a3 handleStartCollaborationAction:(id)a4
{
  id v5 = a4;
  id v6 = +[NSFileProviderManager br_sharedProviderManagerWithDomainID:0];
  if (!v6)
  {
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000235A4((uint64_t)v7, v8);
    }
  }
  v9 = [v5 collaborationMetadata];
  v10 = [v9 localIdentifier];

  id v11 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v10];
  v12 = v11;
  if (v11)
  {
    id v15 = v11;
    id v16 = v5;
    BRFetchCollaborationIdentifierForItemAtURL();
  }
  else
  {
    id v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      sub_10002344C();
    }

    [v5 fail];
  }
}

+ (void)initialize
{
  if (+[BRContainerCache isManagedProvider])
  {
    brc_block_remember_persona = sub_100014D54;
    brc_activity_block_remember_persona = sub_100014E5C;
  }
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100023CDC();
    }

    exit(1);
  }
}

- (BRFileProviderExtension)init
{
  v28.receiver = self;
  v28.super_class = (Class)BRFileProviderExtension;
  v2 = [(BRFileProviderExtension *)&v28 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v3;

    uint64_t v5 = objc_opt_new();
    downloadOperationByPath = v2->_downloadOperationByPath;
    v2->_downloadOperationByPath = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    itemsForcedDownload = v2->_itemsForcedDownload;
    v2->_itemsForcedDownload = (NSMutableArray *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("fileprovider-mobile-docs", v10);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    if (+[BRContainerCache isManagedProvider])
    {
      char v27 = 0;
      uint64_t v13 = +[NSString br_currentPersonaIDWithIsDataSeparated:&v27];
      personaID = v2->_personaID;
      v2->_personaID = (NSString *)v13;

      if (!v27)
      {
        id v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100023E14();
        }
      }
      NSHomeDirectory();
      id v15 = objc_claimAutoreleasedReturnValue();
      uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 0);

      if ((v16 & 0x80000000) != 0)
      {
        uint64_t v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          sub_100023DAC();
        }
      }
      v17 = (NSFileHandle *)[objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v16 closeOnDealloc:1];
      witness = v2->_witness;
      v2->_witness = v17;

      if (!v2->_witness)
      {
        uint64_t v25 = brc_bread_crumbs();
        v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          sub_100023D44();
        }
      }
    }
    +[BRAccount startAccountTokenChangeObserverIfNeeded];
    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_accountDidChange" name:BRAccountTokenDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BRAccountTokenDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)BRFileProviderExtension;
  [(BRFileProviderExtension *)&v4 dealloc];
}

- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)startProvidingItemAtURL:(id)a3 readingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend(v8, "br_isInSyncedLocation"))
  {
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension startProvidingItemAtURL:readingOptions:completionHandler:]", 162, &v35);
    v10 = brc_bread_crumbs();
    dispatch_queue_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = v35;
      v26 = [v8 path];
      char v27 = BRFileCoordinatorReadingOptionsPrettyPrint();
      *(_DWORD *)buf = 134218754;
      uint64_t v41 = v25;
      __int16 v42 = 2112;
      v43 = v26;
      __int16 v44 = 2112;
      v45 = v27;
      __int16 v46 = 2112;
      v47 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx start providing %@ (readingOptions: %@)%@", buf, 0x2Au);
    }
    long long v37 = v35;
    uint64_t v38 = v36;
    if (objc_msgSend(v8, "br_isPromiseURL"))
    {
      brc_bread_crumbs();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        sub_100023EE4(v8, (uint64_t)v12, v13);
      }

      goto LABEL_8;
    }
    if ((a4 & 0x20000) != 0 || ![v8 checkResourceIsReachableAndReturnError:0]) {
      goto LABEL_15;
    }
    v39[0] = NSURLIsDirectoryKey;
    v39[1] = NSURLIsPackageKey;
    v14 = +[NSArray arrayWithObjects:v39 count:2];
    id v12 = [v8 resourceValuesForKeys:v14 error:0];

    id v15 = [v12 objectForKeyedSubscript:NSURLIsDirectoryKey];
    if ([v15 BOOLValue])
    {
      uint64_t v16 = [v12 objectForKeyedSubscript:NSURLIsPackageKey];
      unsigned int v17 = [v16 BOOLValue];

      if (!v17)
      {
LABEL_8:

LABEL_15:
        uint64_t v18 = [v8 path];
        id v19 = [objc_alloc((Class)BRFileProvidingOperation) initWithURL:v8 readingOptions:a4];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100015778;
        v30[3] = &unk_100038D78;
        long long v33 = v37;
        uint64_t v34 = v38;
        v30[4] = self;
        id v12 = v18;
        id v31 = v12;
        id v32 = v9;
        [v19 setFileProvidingCompletion:v30];
        id v20 = self;
        objc_sync_enter(v20);
        id v21 = [(NSMutableDictionary *)v20->_downloadOperationByPath objectForKeyedSubscript:v12];
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          objc_super v28 = brc_bread_crumbs();
          v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            sub_100023E7C();
          }
        }
        [(NSMutableDictionary *)v20->_downloadOperationByPath setObject:v19 forKeyedSubscript:v12];
        objc_sync_exit(v20);

        [(NSOperationQueue *)v20->_operationQueue addOperation:v19];
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100023F98();
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
    goto LABEL_17;
  }
  (*((void (**)(id, void))v9 + 2))(v9, 0);
LABEL_18:
}

- (void)startProvidingItemAtURL:(id)a3 completionHandler:(id)a4
{
}

- (void)stopProvidingItemAtURL:(id)a3
{
  id v29 = a3;
  char v27 = [v29 path];
  objc_super v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000240D0();
  }

  v26 = self->_itemsForcedDownload;
  objc_sync_enter(v26);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = self->_itemsForcedDownload;
  id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v10 = +[BRFileObjectID fileObjectIDWithString:v9];
        dispatch_queue_t v11 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v9];
        if ([v10 isFolderOrAliasID]
          && objc_msgSend(v11, "br_isParentOfURL:", v29))
        {
          unsigned int v17 = brc_bread_crumbs();
          uint64_t v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [v29 path];
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = v19;
            __int16 v37 = 2112;
            uint64_t v38 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't cancel download of %@ which is inside a folder downloading for CZM%@", buf, 0x16u);
          }
          goto LABEL_20;
        }
        if ([v10 isDocumentID])
        {
          id v12 = [v11 path];
          uint64_t v13 = [v29 path];
          unsigned int v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            unsigned int v17 = brc_bread_crumbs();
            uint64_t v18 = brc_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v29 path];
              *(_DWORD *)buf = 138412546;
              uint64_t v36 = v20;
              __int16 v37 = 2112;
              uint64_t v38 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't cancel download of %@ which is downloading for CZM%@", buf, 0x16u);
            }
LABEL_20:

            uint64_t v16 = v26;
            objc_sync_exit(v26);
            goto LABEL_21;
          }
        }
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  objc_sync_exit(v26);
  id v15 = self;
  objc_sync_enter(v15);
  uint64_t v16 = [(NSMutableDictionary *)v15->_downloadOperationByPath objectForKeyedSubscript:v27];
  objc_sync_exit(v15);

  if (v16)
  {
    [v16 cancel];
  }
  else
  {
    id v21 = +[NSFileManager defaultManager];
    id v30 = 0;
    unsigned __int8 v22 = [v21 evictUbiquitousItemAtURL:v29 error:&v30];
    id v23 = v30;

    if ((v22 & 1) == 0)
    {
      v24 = brc_bread_crumbs();
      uint64_t v25 = brc_default_log();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        sub_100024068();
      }
    }
  }
LABEL_21:
}

- (void)itemChangedAtURL:(id)a3
{
  id v3 = a3;
  objc_super v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100024138();
  }
}

- (id)fileProviderErrorFromFSError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    id v11 = 0;
    goto LABEL_14;
  }
  id v6 = [v4 domain];
  if (![v6 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_9;
  }
  id v7 = [v5 code];

  if (v7 != (id)516)
  {
LABEL_9:
    id v11 = v5;
    goto LABEL_14;
  }
  id v8 = objc_msgSend(v5, "fp_collidingURL");
  if (v8)
  {
    uint64_t v9 = [(BRFileProviderExtension *)self _propertiesForItemAtURL:v8 error:0];
    if (v9)
    {
      id v10 = +[NSError fileProviderErrorForCollisionWithItem:v9];
    }
    else
    {
      id v10 = v5;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = v5;
  }

LABEL_14:

  return v11;
}

- (void)importDocumentAtURL:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v9];
  memset(v17, 0, sizeof(v17));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension importDocumentAtURL:toParentItemIdentifier:completionHandler:]", 280, v17);
  id v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v19 = v17[0];
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx importing document at %@ to %@%@", buf, 0x2Au);
  }

  if (v11)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000161F8;
    v15[3] = &unk_100038DA0;
    v15[4] = self;
    id v16 = v10;
    objc_msgSend(v8, "fp_importUnderFolder:completionHandler:", v11, v15);
  }
  else
  {
    unsigned int v14 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v9];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
  sub_100014B98(v17);
}

- (void)createDirectoryWithName:(id)a3 inParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v17, 0, sizeof(v17));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension createDirectoryWithName:inParentItemIdentifier:completionHandler:]", 313, v17);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v19 = v17[0];
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating directory %@ under %@%@", buf, 0x2Au);
  }

  uint64_t v13 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v9];
  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100016610;
    v15[3] = &unk_100038DA0;
    v15[4] = self;
    id v16 = v10;
    objc_msgSend(v13, "fp_createSubFolder:completionHandler:", v8, v15);
  }
  else
  {
    unsigned int v14 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v9];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
  sub_100014B98(v17);
}

- (void)renameItemWithIdentifier:(id)a3 toName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v19, 0, sizeof(v19));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension renameItemWithIdentifier:toName:completionHandler:]", 340, v19);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v21 = v19[0];
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    char v27 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx renaming %@ to %@%@", buf, 0x2Au);
  }

  uint64_t v13 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v8 resolvingBRAliases:1 attachPhysical:1];
  unsigned int v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100024208();
  }

  if (v13)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100016A30;
    uint64_t v17[3] = &unk_100038DA0;
    v17[4] = self;
    id v18 = v10;
    objc_msgSend(v13, "fp_renameWithNewName:completionHandler:", v9, v17);
  }
  else
  {
    id v16 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v8];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
  sub_100014B98(v19);
}

- (void)reparentItemWithIdentifier:(id)a3 toParentItemWithIdentifier:(id)a4 newName:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v51 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v50 = a5;
  id v11 = a6;
  memset(v66, 0, sizeof(v66));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:]", 373, v66);
  id v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v66[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v78 = v51;
    LOWORD(v79) = 2112;
    *(void *)((char *)&v79 + 2) = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reparenting %@ under %@%@", buf, 0x2Au);
  }

  unsigned int v14 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v10 resolvingBRAliases:0 attachPhysical:1];
  if (v14)
  {
    id v15 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v51];
    if (v15)
    {
      brc_bread_crumbs();
      id v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      unsigned int v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        v78 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] reparenting url %@ under %@%@", buf, 0x20u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v78 = sub_100017374;
      *(void *)&long long v79 = sub_100017384;
      *((void *)&v79 + 1) = 0;
      id v18 = [v14 lastPathComponent];
      v49 = [v15 URLByAppendingPathComponent:v18];

      uint64_t v19 = *(void *)&buf[8];
      id obj = *(id *)(*(void *)&buf[8] + 40);
      unsigned __int16 v20 = (unsigned __int16)objc_msgSend(v14, "br_capabilityToMoveToURL:error:", v49, &obj);
      objc_storeStrong((id *)(v19 + 40), obj);
      if ((v20 & 0x35FB) != 0)
      {
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10001738C;
        v58[3] = &unk_100038DF0;
        id v21 = v14;
        id v59 = v21;
        id v60 = v15;
        id v61 = v50;
        v62 = self;
        id v22 = v11;
        id v63 = v22;
        v64 = buf;
        id v23 = objc_retainBlock(v58);
        __int16 v24 = v23;
        if ((v20 & 0x243A) != 0)
        {
          id v25 = brc_bread_crumbs();
          __int16 v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            char v27 = [v21 path];
            sub_100024270(v27, (uint64_t)v25, v67, v26);
          }

          id v28 = [objc_alloc((Class)BRFileProvidingOperation) initWithURL:v21 readingOptions:0x20000];
          v48 = v21;
          id v29 = v22;
          v47 = v14;
          id v30 = v15;
          id v31 = objc_alloc_init((Class)NSOperationQueue);
          id v32 = v11;
          id v33 = v28;
          long long v34 = v24;
          long long v35 = self->_itemsForcedDownload;
          objc_sync_enter(v35);
          [(NSMutableArray *)self->_itemsForcedDownload addObject:v10];
          objc_sync_exit(v35);

          uint64_t v36 = v31;
          id v15 = v30;
          unsigned int v14 = v47;
          __int16 v24 = v34;
          __int16 v37 = v33;
          id v11 = v32;
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1000175DC;
          v52[3] = &unk_100038E18;
          id v53 = v48;
          id v56 = v29;
          id v57 = v24;
          v54 = self;
          id v55 = v10;
          [v37 setFileProvidingCompletion:v52];
          [v36 addOperation:v37];
        }
        else
        {
          ((void (*)(void *))v23[2])(v23);
        }

        v45 = v59;
      }
      else
      {
        if (!*(void *)(*(void *)&buf[8] + 40))
        {
          v39 = +[NSError br_errorWithPOSIXCode:13 description:@"The move between those locations is invalid"];
          NSErrorUserInfoKey v75 = NSUnderlyingErrorKey;
          v76 = v39;
          v40 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          uint64_t v41 = +[NSError errorWithDomain:NSCocoaErrorDomain code:512 userInfo:v40];
          __int16 v42 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v41;
        }
        v43 = brc_bread_crumbs();
        __int16 v44 = brc_default_log();
        if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
        {
          uint64_t v46 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v67 = 138413058;
          v68 = v14;
          __int16 v69 = 2112;
          v70 = v15;
          __int16 v71 = 2112;
          uint64_t v72 = v46;
          __int16 v73 = 2112;
          v74 = v43;
          _os_log_error_impl((void *)&_mh_execute_header, v44, (os_log_type_t)0x90u, "[ERROR] can't move %@ to %@; %@%@",
            v67,
            0x2Au);
        }

        v45 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "br_fileProviderError");
        (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v45);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v38 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v51];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v38);
    }
  }
  else
  {
    id v15 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v10];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v15);
  }

  sub_100014B98(v66);
}

- (void)_trashItemAtURLWithoutCoordination:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, id))a4;
  id v7 = +[NSFileManager defaultManager];
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000242D8(v5);
  }

  id v12 = 0;
  id v13 = 0;
  objc_msgSend(v7, "br_trashItemAtURL:resultingURL:error:", v5, &v13, &v12);
  id v10 = v13;
  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)trashItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  memset(v32, 0, sizeof(v32));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension trashItemWithIdentifier:completionHandler:]", 459, v32);
  brc_bread_crumbs();
  id v8 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v32[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v38 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx trashing item %@%@", buf, 0x20u);
  }

  id v10 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v6 resolvingBRAliases:0 attachPhysical:1];
  if (!v10)
  {
    id v11 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v6];
    v7[2](v7, 0, v11);
    goto LABEL_9;
  }
  id v11 = +[NSFileManager defaultManager];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v38 = sub_100017374;
  v39 = sub_100017384;
  id v40 = 0;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100017374;
  id v30 = sub_100017384;
  id v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100017CD8;
  v25[3] = &unk_100038E40;
  v25[4] = buf;
  v25[5] = &v26;
  objc_msgSend(v10, "fp_coordinatedDeleteWithHandler:", v25);
  uint64_t v12 = *(void *)&buf[8];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v13 = 0;
  }
  else
  {
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int16 v20 = [(id)v27[5] path];
      id v21 = objc_msgSend(v20, "fp_obfuscatedPath");
      *(_DWORD *)id v33 = 138412546;
      long long v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] trashing %@%@", v33, 0x16u);
    }
    uint64_t v17 = v27[5];
    uint64_t v18 = *(void *)&buf[8];
    id obj = *(id *)(*(void *)&buf[8] + 40);
    id v24 = 0;
    objc_msgSend(v11, "br_trashItemAtURL:resultingURL:error:", v17, &v24, &obj);
    id v13 = v24;
    objc_storeStrong((id *)(v18 + 40), obj);
    uint64_t v12 = *(void *)&buf[8];
    if (v13)
    {
      uint64_t v19 = (id *)(*(void *)&buf[8] + 40);
      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        id v22 = 0;
        unsigned int v14 = [(BRFileProviderExtension *)self _propertiesForNewItemAtURL:v13 error:&v22];
        objc_storeStrong(v19, v22);
        uint64_t v12 = *(void *)&buf[8];
        goto LABEL_7;
      }
    }
  }
  unsigned int v14 = 0;
LABEL_7:
  ((void (**)(id, void *, void *))v7)[2](v7, v14, *(void **)(v12 + 40));

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

LABEL_9:
  sub_100014B98(v32);
}

- (void)untrashItemWithIdentifier:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  memset(v33, 0, sizeof(v33));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension untrashItemWithIdentifier:toParentItemIdentifier:completionHandler:]", 501, v33);
  id v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v35 = v33[0];
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    v39 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx untrashing item %@%@", buf, 0x20u);
  }

  id v13 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v8 resolvingBRAliases:0 attachPhysical:1];
  if (v13)
  {
    unsigned int v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100024518();
    }

    if (!v9
      || ([(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v9], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v17 = +[NSFileManager defaultManager];
      id v32 = 0;
      uint64_t v18 = objc_msgSend(v17, "br_putBackURLForTrashedItemAtURL:error:", v13, &v32);
      id v19 = v32;

      unsigned __int16 v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1000244B0();
      }

      id v22 = [v18 URLByDeletingLastPathComponent];
      id v23 = v22;
      if (v22 && ([v22 checkResourceIsReachableAndReturnError:0] & 1) != 0)
      {
        uint64_t v16 = (uint64_t)v23;
      }
      else
      {
        id v24 = brc_bread_crumbs();
        id v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_100024448();
        }

        uint64_t v26 = objc_msgSend(v13, "br_cloudDocsContainer");
        uint64_t v16 = [v26 documentsURL];

        if (!v16)
        {
          id v29 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v9];
          v10[2](v10, 0, v29);

          goto LABEL_22;
        }
      }
    }
    char v27 = brc_bread_crumbs();
    uint64_t v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_1000243E0();
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001823C;
    v30[3] = &unk_100038DA0;
    v30[4] = self;
    id v31 = v10;
    objc_msgSend(v13, "fp_reparentUnderFolder:allowBouncing:completionHandler:", v16, 1, v30);

    id v19 = (id)v16;
  }
  else
  {
    id v19 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v8];
    v10[2](v10, 0, v19);
  }
LABEL_22:

  sub_100014B98(v33);
}

- (void)deleteItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v16, 0, sizeof(v16));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension deleteItemWithIdentifier:completionHandler:]", 568, v16);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v16[0];
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx deleting item %@%@", buf, 0x20u);
  }

  id v10 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v6 resolvingBRAliases:0 attachPhysical:1];
  id v11 = v10;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001864C;
    v13[3] = &unk_100038610;
    id v14 = v10;
    id v15 = v7;
    objc_msgSend(v14, "fp_deleteWithCompletionHandler:", v13);

    id v12 = v14;
  }
  else
  {
    id v12 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v6];
    (*((void (**)(id, id))v7 + 2))(v7, v12);
  }

  sub_100014B98(v16);
}

- (void)setLastUsedDate:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  memset(v18, 0, sizeof(v18));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension setLastUsedDate:forItemIdentifier:completionHandler:]", 602, v18);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v18[0];
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx set last used date %@ for %@%@", buf, 0x2Au);
  }

  id v13 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v9 resolvingBRAliases:0];
  id v14 = +[NSFileManager defaultManager];
  objc_msgSend(v14, "br_setLastOpenDate:onItemAtURL:", v8, v13);
  id v17 = 0;
  id v15 = [(BRFileProviderExtension *)self _propertiesForNewItemAtURL:v13 error:&v17];
  id v16 = v17;
  v10[2](v10, v15, v16);

  sub_100014B98(v18);
}

- (void)setTagData:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  memset(v27, 0, sizeof(v27));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension setTagData:forItemIdentifier:completionHandler:]", 621, v27);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = v27[0];
    id v24 = [v8 length];
    *(_DWORD *)buf = 134218754;
    uint64_t v29 = v23;
    __int16 v30 = 2048;
    id v31 = v24;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    uint64_t v35 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx set tag data (%lu bytes) for %@%@", buf, 0x2Au);
  }

  id v13 = FPGetTagsFromTagsData();
  id v14 = [v13 valueForKey:@"label"];

  id v15 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v9 resolvingBRAliases:1 attachPhysical:1];
  id v26 = 0;
  unsigned __int8 v16 = objc_msgSend(v15, "br_setTagNames:error:", v14, &v26);
  id v17 = v26;
  uint64_t v18 = v17;
  if (v16)
  {
    id v25 = v17;
    __int16 v19 = [(BRFileProviderExtension *)self _propertiesForNewItemAtURL:v15 error:&v25];
    id v20 = v25;

    v10[2](v10, v19, v20);
    uint64_t v18 = v20;
LABEL_9:

    goto LABEL_10;
  }
  __int16 v21 = brc_bread_crumbs();
  id v22 = brc_default_log();
  if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v29 = (uint64_t)v15;
    __int16 v30 = 2112;
    id v31 = v18;
    __int16 v32 = 2112;
    id v33 = v21;
    _os_log_error_impl((void *)&_mh_execute_header, v22, (os_log_type_t)0x90u, "[ERROR] can't set tags for %@; %@%@",
      buf,
      0x20u);
  }

  if (v10)
  {
    __int16 v19 = objc_msgSend(v18, "br_fileProviderError");
    v10[2](v10, 0, v19);
    goto LABEL_9;
  }
LABEL_10:

  sub_100014B98(v27);
}

- (void)setFavoriteRank:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  memset(v18, 0, sizeof(v18));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension setFavoriteRank:forItemIdentifier:completionHandler:]", 645, v18);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v18[0];
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx set favorite rank %@ for %@%@", buf, 0x2Au);
  }

  id v13 = [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:v9 resolvingBRAliases:0 attachPhysical:1];
  id v14 = +[NSFileManager defaultManager];
  objc_msgSend(v14, "br_setFavoriteRank:onItemAtURL:", v8, v13);
  id v17 = 0;
  id v15 = [(BRFileProviderExtension *)self _propertiesForNewItemAtURL:v13 error:&v17];
  id v16 = v17;
  v10[2](v10, v15, v16);

  sub_100014B98(v18);
}

- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationURL:(id)a4 completionHandler:(id)a5
{
  id v11 = 0;
  id v7 = (void (**)(id, uint64_t, void))a5;
  LOWORD(a3) = (unsigned __int16)objc_msgSend(a3, "br_capabilityToMoveToURL:error:", a4, &v11);
  id v8 = v11;
  if (((unsigned __int16)a3 & 0x243A) != 0)
  {
    uint64_t v9 = 1;
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = v8;
  }
  ((void (**)(id, uint64_t, id))v7)[2](v7, v9, v10);
}

- (id)URLForItemWithPersistentIdentifier:(id)a3
{
  return [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:a3 resolvingBRAliases:1];
}

- (id)_URLForItemWithPersistentIdentifier:(id)a3 resolvingBRAliases:(BOOL)a4
{
  return [(BRFileProviderExtension *)self _URLForItemWithPersistentIdentifier:a3 resolvingBRAliases:a4 attachPhysical:0];
}

- (id)_URLForItemWithPersistentIdentifier:(id)a3 resolvingBRAliases:(BOOL)a4 attachPhysical:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  memset(v40, 0, sizeof(v40));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension _URLForItemWithPersistentIdentifier:resolvingBRAliases:attachPhysical:]", 691, v40);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v42 = v40[0];
    __int16 v43 = 2112;
    id v44 = v7;
    __int16 v45 = 2112;
    uint64_t v46 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked url for %@%@", buf, 0x20u);
  }

  if ([v7 isEqualToString:NSFileProviderRootContainerItemIdentifier])
  {
    id v10 = +[BRContainer allContainersByContainerID];
    id v11 = [v10 objectForKey:BRUbiquitousDefaultContainerID];

    id v12 = [v11 documentsURL];
    id v13 = [v12 copy];

    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000245E8();
    }
    goto LABEL_34;
  }
  id v14 = +[BRFileObjectID fileObjectIDWithString:v7];
  if (!v14)
  {
    id v15 = 0;
    id v11 = 0;
    if (!v6) {
      goto LABEL_14;
    }
LABEL_10:
    if ([v15 br_isExternalDocumentReference])
    {
      id v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1000246B8();
      }

      id v38 = v11;
      uint64_t v18 = [v15 br_URLByResolvingExternalDocumentReferenceWithError:&v38];
      id v19 = v38;

      id v15 = v18;
      id v11 = v19;
    }
    goto LABEL_14;
  }
  id v39 = 0;
  id v15 = +[NSURL br_documentURLFromFileObjectID:v14 error:&v39];
  id v11 = v39;
  if (v6) {
    goto LABEL_10;
  }
LABEL_14:
  if (([v15 br_isInCloudDocsPrivateStorages] & 1) != 0
    || [v15 br_wouldBeExcludedFromSync])
  {
    uint64_t v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v15 path];
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = (uint64_t)v22;
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      uint64_t v46 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Detected url in private or excluded location %@ -- Fetching URL from daemon for %@%@", buf, 0x20u);
    }
    __int16 v23 = +[BRDaemonConnection defaultConnection];
    id v24 = [v23 newLegacySyncProxy];

    id v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    uint64_t v35 = sub_100019694;
    __int16 v36 = &unk_100038E68;
    id v25 = v24;
    id v37 = v25;
    [v25 getURLForItemIdentifier:v7 reply:&v33];
    id v26 = objc_msgSend(v25, "result", v33, v34, v35, v36);

    if (v26)
    {
      [v25 result];
      id v15 = v27 = v15;
    }
    else
    {
      char v27 = brc_bread_crumbs();
      uint64_t v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [v25 error];
        *(_DWORD *)buf = 138412802;
        uint64_t v42 = (uint64_t)v7;
        __int16 v43 = 2112;
        id v44 = v29;
        __int16 v45 = 2112;
        uint64_t v46 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed getting url of %@ - %@%@", buf, 0x20u);
      }
    }
  }
  if (v15)
  {
    __int16 v30 = brc_bread_crumbs();
    id v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_1000245E8();
    }
  }
  else
  {
    __int16 v30 = brc_bread_crumbs();
    id v31 = brc_default_log();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u)) {
      sub_100024650();
    }
  }

  if ([v15 br_isInSyncedLocation])
  {
    if (v5) {
      [v15 br_addPhysicalProperty];
    }
    id v15 = v15;
    id v13 = v15;
  }
  else
  {
    id v13 = 0;
  }
LABEL_34:

  sub_100014B98(v40);

  return v13;
}

- (id)persistentIdentifierForItemAtURL:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "br_isInSyncedLocation"))
  {
    memset(v18, 0, sizeof(v18));
    sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension persistentIdentifierForItemAtURL:]", 756, v18);
    BOOL v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = v18[0];
      id v16 = [v4 path];
      *(_DWORD *)buf = 134218498;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked identifier for %@%@", buf, 0x20u);
    }
    id v17 = 0;
    id v7 = [(BRFileProviderExtension *)self _propertiesForItemAtURL:v4 error:&v17];
    id v8 = v17;
    if (v8)
    {
      uint64_t v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v20 = (uint64_t)v4;
        __int16 v21 = 2112;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] couldn't get item identifier at %@: %@%@", buf, 0x20u);
      }

      id v11 = 0;
    }
    else
    {
      id v11 = [v7 itemIdentifier];
    }
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000245E8();
    }

    sub_100014B98(v18);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_isLoggedInOrError:(id *)a3
{
  id v19 = 0;
  id v4 = +[BRAccount currentCachedLoggedInAccountWithError:&v19];
  id v5 = v19;
  BOOL v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "br_fileProviderError");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        id v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        __int16 v23 = "-[BRFileProviderExtension _isLoggedInOrError:]";
        __int16 v24 = 2080;
        if (!a3) {
          id v17 = "(ignored by caller)";
        }
        id v25 = v17;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        uint64_t v29 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3)
    {
      id v7 = v7;
      *a3 = v7;
    }
LABEL_16:

    BOOL v11 = 0;
    goto LABEL_17;
  }
  if (!v4
    || ([v4 perAppAccountIdentifier],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
    id v12 = +[NSError brc_errorLoggedOut];
    __int16 v21 = v12;
    id v7 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

    id v13 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:v7];
    if (v13)
    {
      id v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        uint64_t v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        __int16 v23 = "-[BRFileProviderExtension _isLoggedInOrError:]";
        __int16 v24 = 2080;
        if (!a3) {
          uint64_t v18 = "(ignored by caller)";
        }
        id v25 = v18;
        __int16 v26 = 2112;
        id v27 = v13;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v13;
    }

    goto LABEL_16;
  }
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (id)itemForIdentifier:(id)a3 error:(id *)a4
{
  BOOL v6 = (char *)a3;
  memset(v17, 0, sizeof(v17));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension itemForIdentifier:error:]", 794, v17);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v19 = (const char *)v17[0];
    __int16 v20 = 2112;
    __int16 v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked properties for %@%@", buf, 0x20u);
  }

  if ([(BRFileProviderExtension *)self _isLoggedInOrError:a4])
  {
    uint64_t v9 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v6];
    if (v9)
    {
      id v10 = [(BRFileProviderExtension *)self _propertiesForItemAtURL:v9 error:a4];
      brc_bread_crumbs();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1000245E8();
      }
    }
    else
    {
      id v11 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v6];
      if (v11)
      {
        id v13 = brc_bread_crumbs();
        id v14 = brc_default_log();
        if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
        {
          id v16 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          id v19 = "-[BRFileProviderExtension itemForIdentifier:error:]";
          __int16 v20 = 2080;
          if (!a4) {
            id v16 = "(ignored by caller)";
          }
          __int16 v21 = v16;
          __int16 v22 = 2112;
          id v23 = v11;
          __int16 v24 = 2112;
          id v25 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4)
      {
        id v11 = v11;
        id v10 = 0;
        *a4 = v11;
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  sub_100014B98(v17);

  return v10;
}

- (id)_propertiesForNewItemAtURL:(id)a3 error:(id *)a4
{
  return [(BRFileProviderExtension *)self _propertiesForItemAtURL:a3 forceScan:1 error:a4];
}

- (id)_propertiesForItemAtURL:(id)a3 error:(id *)a4
{
  return [(BRFileProviderExtension *)self _propertiesForItemAtURL:a3 forceScan:0 error:a4];
}

- (id)_propertiesForItemAtURL:(id)a3 forceScan:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if ((objc_msgSend(v7, "br_isInSyncedLocation") & 1) == 0)
  {
    if (a5)
    {
      +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1005 userInfo:0];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
    goto LABEL_30;
  }
  memset(v30, 0, sizeof(v30));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension _propertiesForItemAtURL:forceScan:error:]", 829, v30);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = v30[0];
    __int16 v26 = [v7 path];
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = v25;
    __int16 v33 = 2112;
    id v34 = v26;
    __int16 v35 = 2112;
    __int16 v36 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked properties for %@%@", buf, 0x20u);
  }
  id v10 = objc_msgSend(v7, "br_containerIDIfIsDocumentsContainerURL");
  id v11 = v10;
  if (v10
    && ([v10 isEqualToString:BRUbiquitousDocumentsContainerID] & 1) == 0
    && ([v11 isEqualToString:BRUbiquitousDesktopContainerID] & 1) == 0)
  {
    id v18 = +[BRContainer allContainersByContainerID];
    id v19 = [v18 objectForKey:v11];
    id v14 = +[BRQueryItem containerItemForContainer:v19 forceScan:v6];
    goto LABEL_23;
  }
  id v12 = +[BRQueryItem askDaemonQueryItemForURL:v7 andFakeFSEvent:v6 error:a5];
  id v13 = v12;
  if (!v6)
  {
    if ([v12 fromRelativePath])
    {
      uint64_t v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = 0;
        __int16 v33 = 2112;
        id v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Fake FS event because of relative path %@%@", buf, 0x16u);
      }

      id v14 = +[BRQueryItem askDaemonQueryItemForURL:v7 andFakeFSEvent:1 error:a5];
      goto LABEL_24;
    }
    id v17 = [v13 url];
    id v29 = 0;
    [v17 getPromisedItemResourceValue:&v29 forKey:NSURLCanonicalPathKey error:0];
    id v18 = v29;

    id v28 = 0;
    [v7 getPromisedItemResourceValue:&v28 forKey:NSURLCanonicalPathKey error:0];
    id v19 = v28;
    if (v19 && ([v18 isEqualToString:v19] & 1) == 0)
    {
      __int16 v20 = brc_bread_crumbs();
      __int16 v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v32 = (uint64_t)v18;
        __int16 v33 = 2112;
        id v34 = v19;
        __int16 v35 = 2112;
        __int16 v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Fake FS event because of mismatched URLs %@ vs %@%@", buf, 0x20u);
      }

      id v14 = +[BRQueryItem askDaemonQueryItemForURL:v7 andFakeFSEvent:1 error:a5];
    }
    else
    {
      id v14 = v13;
    }
LABEL_23:

    id v13 = v18;
LABEL_24:

    goto LABEL_25;
  }
  id v14 = v12;
LABEL_25:
  __int16 v22 = brc_bread_crumbs();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    if (a5) {
      id v27 = *a5;
    }
    else {
      id v27 = 0;
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = (uint64_t)v14;
    __int16 v33 = 2112;
    id v34 = v27;
    __int16 v35 = 2112;
    __int16 v36 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] returning %@ error %@%@", buf, 0x20u);
  }

  if (a5 && *a5)
  {
    objc_msgSend(*a5, "br_fileProviderError");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  sub_100014B98(v30);
LABEL_30:

  return v14;
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 error:(id *)a4
{
  BOOL v6 = (char *)a3;
  memset(v18, 0, sizeof(v18));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension enumeratorForContainerItemIdentifier:error:]", 871, v18);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v20 = (const char *)v18[0];
    __int16 v21 = 2112;
    __int16 v22 = v6;
    __int16 v23 = 2112;
    __int16 v24 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx enumerator for %@%@", buf, 0x20u);
  }

  if (![(BRFileProviderExtension *)self _isLoggedInOrError:a4])
  {
    id v10 = 0;
    goto LABEL_22;
  }
  if ([v6 isEqualToString:NSFileProviderWorkingSetContainerItemIdentifier])
  {
    uint64_t v9 = &off_100038420;
LABEL_9:
    id v10 = (BRFileEnumerator *)objc_alloc_init(*v9);
    goto LABEL_22;
  }
  if ([v6 isEqualToString:NSFileProviderAllDirectoriesContainerItemIdentifier])
  {
    uint64_t v9 = &off_100038458;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:NSFileProviderRootContainerItemIdentifier])
  {
    id v11 = 0;
  }
  else
  {
    id v11 = +[BRFileObjectID fileObjectIDWithString:v6];
  }
  id v12 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v6];
  if (v12)
  {
    id v10 = [[BRFileEnumerator alloc] initWithFileObjectID:v11 url:v12 itemIdentifier:v6 recursive:0];
  }
  else
  {
    id v13 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v6];
    if (v13)
    {
      id v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        id v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        __int16 v20 = "-[BRFileProviderExtension enumeratorForContainerItemIdentifier:error:]";
        __int16 v21 = 2080;
        if (!a4) {
          id v17 = "(ignored by caller)";
        }
        __int16 v22 = v17;
        __int16 v23 = 2112;
        __int16 v24 = v13;
        __int16 v25 = 2112;
        __int16 v26 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v13;
    }

    id v10 = 0;
  }

LABEL_22:
  sub_100014B98(v18);

  return v10;
}

- (CGSize)_properSizeForContainerThumbnail:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width > 120.0)
  {
    id v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100024794();
    }

    double width = 120.0;
  }
  if (height > 120.0)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100024720();
    }

    double height = 120.0;
  }
  if (width > height)
  {
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218498;
      double v14 = width;
      __int16 v15 = 2048;
      double v16 = height;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] width (%.2f) and height (%.2f) should be equal for container's thumbnail%@", (uint8_t *)&v13, 0x20u);
    }
LABEL_16:

    double width = height;
    goto LABEL_17;
  }
  if (height > width)
  {
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218498;
      double v14 = width;
      __int16 v15 = 2048;
      double v16 = height;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] width (%.2f) and height (%.2f) should be equal for container's thumbnail%@", (uint8_t *)&v13, 0x20u);
    }
    double height = width;
    goto LABEL_16;
  }
LABEL_17:
  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)_fetchThumbnailForContainerID:(id)a3 representedByItemWithIdentifer:(id)a4 size:(CGSize)a5 knownContainers:(id)a6 perThumbnailCompletionHandler:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v12 = a3;
  id v13 = a4;
  double v14 = (void (**)(id, id, void *, const __CFString *, void))a7;
  __int16 v15 = [a6 objectForKeyedSubscript:v12];
  double v16 = v15;
  if (v15)
  {
    char v27 = 0;
    __int16 v17 = objc_msgSend(v15, "bestFittingImageDataForSize:shouldTransformToAppIcon:", &v27, width, height);
    if (v17)
    {
      if (v14)
      {
        if (v27) {
          CFStringRef v18 = @"com.apple.fileprovider.br-undecorated-container";
        }
        else {
          CFStringRef v18 = 0;
        }
        v14[2](v14, v13, v17, v18, 0);
      }
    }
    else
    {
      __int16 v21 = +[NSString br_stringWithSize:](NSString, "br_stringWithSize:", width, height);
      __int16 v22 = brc_bread_crumbs();
      __int16 v23 = brc_default_log();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v29 = v21;
        __int16 v30 = 2112;
        id v31 = v12;
        __int16 v32 = 2112;
        __int16 v33 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v23, (os_log_type_t)0x90u, "[ERROR] can't find image with size %@ for %@%@", buf, 0x20u);
      }

      __int16 v24 = +[NSError brc_errorInvalidParameter:@"size" value:v21];
      __int16 v25 = v24;
      if (v14)
      {
        __int16 v26 = objc_msgSend(v24, "br_fileProviderError");
        ((void (**)(id, id, void *, const __CFString *, void *))v14)[2](v14, v13, 0, 0, v26);
      }
    }
    goto LABEL_17;
  }
  id v19 = brc_bread_crumbs();
  __int16 v20 = brc_default_log();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
    sub_100024808();
  }

  if (v14)
  {
    __int16 v17 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v13];
    ((void (**)(id, id, void *, const __CFString *, void *))v14)[2](v14, v13, 0, 0, v17);
LABEL_17:
  }
}

- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithType:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v37 = a6;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v13 = v11;
  double v14 = 0;
  id v15 = [v13 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v49;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        id v19 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v18];
        __int16 v20 = v19;
        if (v19)
        {
          __int16 v21 = objc_msgSend(v19, "br_containerIDIfIsDocumentsContainerURL");
          if (v21)
          {
            -[BRFileProviderExtension _properSizeForContainerThumbnail:](self, "_properSizeForContainerThumbnail:", width, height);
            double v23 = v22;
            double v25 = v24;
            if (!v14)
            {
              double v14 = +[BRContainer allContainersByContainerID];
            }
            -[BRFileProviderExtension _fetchThumbnailForContainerID:representedByItemWithIdentifer:size:knownContainers:perThumbnailCompletionHandler:](self, "_fetchThumbnailForContainerID:representedByItemWithIdentifer:size:knownContainers:perThumbnailCompletionHandler:", v21, v18, v14, v12, v23, v25);
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v15);
  }

  dispatch_group_t v26 = dispatch_group_create();
  char v27 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  id v28 = dispatch_queue_attr_make_with_autorelease_frequency(v27, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v29 = dispatch_queue_create("com.apple.br.fetch-thumbnail", v28);

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10001B120;
  v46[3] = &unk_100038EB8;
  v46[4] = self;
  __int16 v30 = v26;
  v47 = v30;
  id v31 = objc_retainBlock(v46);
  dispatch_group_enter(v30);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_100017374;
  v44[4] = sub_100017384;
  id v45 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10001B4F4;
  v41[3] = &unk_100038EE0;
  __int16 v43 = v44;
  __int16 v32 = v30;
  uint64_t v42 = v32;
  __int16 v33 = objc_retainBlock(v41);
  id v34 = sub_10000FEBC(v13, v31, v12, v33);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B554;
  block[3] = &unk_100038F08;
  id v39 = v37;
  id v40 = v44;
  id v35 = v37;
  dispatch_group_notify(v32, v29, block);

  _Block_object_dispose(v44, 8);

  return v34;
}

- (id)supportedServiceSourcesForItemIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = objc_opt_new();
  id v7 = [[BRFileProviderShareOperationServiceSource alloc] initWithFileProviderExtension:self itemIdentifier:v5 operationQueue:self->_operationQueue];
  [v6 addObject:v7];

  if ([v5 characterAtIndex:0] == 100)
  {
    id v8 = [(BRFileProviderExtension *)self URLForItemWithPersistentIdentifier:v5];
    id v29 = 0;
    id v28 = 0;
    unsigned __int8 v9 = [v8 getPromisedItemResourceValue:&v29 forKey:NSURLIsAliasFileKey error:&v28];
    id v10 = v29;
    id v11 = v28;
    if ((v9 & 1) == 0)
    {
      brc_bread_crumbs();
      id v12 = (BRSharingClient *)objc_claimAutoreleasedReturnValue();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        double v25 = [v8 path];
        *(_DWORD *)buf = 138412802;
        id v31 = v25;
        __int16 v32 = 2112;
        id v33 = v11;
        __int16 v34 = 2112;
        id v35 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, (os_log_type_t)0x90u, "[ERROR] Failed to get alias file key at %@ - %@%@", buf, 0x20u);
      }
    }
    if ([v10 BOOLValue])
    {
      brc_bread_crumbs();
      double v14 = (BRSharingClient *)objc_claimAutoreleasedReturnValue();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100024870(v8);
      }
    }
    else
    {
      __int16 v21 = [[BRFileProvideriWorkCollaborationServiceSource alloc] initWithFileProviderExtension:self itemIdentifier:v5 operationQueue:self->_operationQueue];
      [v6 addObject:v21];

      double v14 = [[BRSharingClient alloc] initWithFileProviderExtension:self itemIdentifier:v5 operationQueue:self->_operationQueue];
      [v6 addObject:v14];
    }
  }
  else
  {
    if ([v5 characterAtIndex:0] != 105) {
      goto LABEL_20;
    }
    id v8 = +[BRFileObjectID fileObjectIDWithString:v5];
    uint64_t v16 = +[BRDaemonConnection defaultConnection];
    id v17 = [v16 newLegacySyncProxy];

    id v18 = [v8 rawID];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001B9BC;
    v26[3] = &unk_100038F30;
    id v10 = v17;
    id v27 = v10;
    [v10 checkIfItemIsShareableWithInode:v18 reply:v26];
    id v19 = [v10 result];
    LODWORD(v18) = [v19 BOOLValue];

    if (v18)
    {
      __int16 v20 = [[BRSharingClient alloc] initWithFileProviderExtension:self itemIdentifier:v5 operationQueue:self->_operationQueue];
      [v6 addObject:v20];
    }
    else
    {
      brc_bread_crumbs();
      __int16 v20 = (BRSharingClient *)objc_claimAutoreleasedReturnValue();
      double v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = [v10 error];
        *(_DWORD *)buf = 138412802;
        id v31 = v5;
        __int16 v32 = 2112;
        id v33 = v23;
        __int16 v34 = 2112;
        id v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is not shareable - %@%@", buf, 0x20u);
      }
    }

    id v11 = v27;
  }

LABEL_20:

  return v6;
}

- (id)_defaultApplicationContainerForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(v41, 0, sizeof(v41));
  sub_1000149C4(0, (uint64_t)"-[BRFileProviderExtension _defaultApplicationContainerForBundleIdentifier:completionHandler:]", 1088, v41);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v44 = v41[0];
    __int16 v45 = 2112;
    id v46 = v5;
    __int16 v47 = 2112;
    long long v48 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx lookup for default location of %@%@", buf, 0x20u);
  }

  if (v5 && ![v5 isEqualToString:@"com.apple.DocumentsApp"])
  {
    id v31 = +[LSBundleProxy bundleProxyForIdentifier:v5];
    if (v31)
    {
      id v11 = +[NSSet setWithObjects:@"application-identifier", BRICloudServicesEntitlement, BRICloudContainerIdentifiersEntitlement, BRUbiquityContainerIdentifiersEntitlement, 0];
      id v12 = [v31 entitlementValuesForKeys:v11];
      id v13 = +[NSMutableDictionary dictionary];
      long long v40 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v37 = 0u;
      id v14 = v11;
      id v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v38;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            id v19 = [v12 objectForKey:v18];
            if (v19) {
              [v13 setObject:v19 forKeyedSubscript:v18];
            }
          }
          id v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v15);
      }

      __int16 v20 = BREntitledContainerIdentifiers();
      if ([v20 count])
      {
        __int16 v21 = [v20 objectAtIndexedSubscript:0];
        double v22 = v20;
        double v23 = +[BRDaemonConnection defaultConnection];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_10001BFD4;
        v35[3] = &unk_100038638;
        id v24 = v6;
        id v36 = v24;
        double v25 = [v23 remoteObjectProxyWithErrorHandler:v35];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10001C038;
        uint64_t v33[3] = &unk_100038F58;
        uint8_t v33[4] = self;
        id v34 = v24;
        [v25 getContainerURLForID:v21 recreateDocumentsIfNeeded:1 reply:v33];

        __int16 v20 = v22;
      }
      else
      {
        id v28 = brc_bread_crumbs();
        id v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_1000249D0();
        }

        __int16 v21 = +[NSError errorWithDomain:BRCloudDocsErrorDomain code:1 userInfo:0];
        double v23 = objc_msgSend(v21, "br_fileProviderError");
        (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v23);
      }
    }
    else
    {
      dispatch_group_t v26 = brc_bread_crumbs();
      id v27 = brc_default_log();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
        sub_100024968();
      }

      id v14 = +[NSError brc_errorInvalidParameter:@"bundleIdentifier" value:v5];
      id v12 = objc_msgSend(v14, "br_fileProviderError");
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
    }
  }
  else
  {
    unsigned __int8 v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100024900();
    }

    [(BRFileProviderExtension *)self createDirectoryWithName:BRUbiquitousDocumentsFolderName inParentItemIdentifier:NSFileProviderRootContainerItemIdentifier completionHandler:v6];
  }
  sub_100014B98(v41);

  return 0;
}

- (void)_accountDidChange
{
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (id v3 = self->_personaID) == 0)
  {
    if (qword_100043DD0 != -1) {
      dispatch_once(&qword_100043DD0, &stru_100038F78);
    }
    id v4 = (NSString *)(id)qword_100043DD8;
    int v5 = 1;
  }
  else
  {
    id v4 = v3;
    int v5 = 0;
  }
  id v6 = +[UMUserManager sharedManager];
  id v7 = [v6 currentPersona];

  id v25 = 0;
  id v8 = [v7 userPersonaUniqueString];
  unsigned __int8 v9 = v8;
  if (v8 == v4 || [(NSString *)v8 isEqualToString:v4])
  {
    id v10 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v24 = 0;
    id v14 = [v7 copyCurrentPersonaContextWithError:&v24];
    id v15 = v24;
    id v16 = v25;
    id v25 = v14;

    if (v15)
    {
      id v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        sub_100022DDC();
      }
    }
    id v10 = [v7 generateAndRestorePersonaContextWithPersonaUniqueString:v4];

    if (v10)
    {
      id v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        id v27 = personaID;
        __int16 v28 = 2112;
        id v29 = v10;
        __int16 v30 = 2112;
        id v31 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v20, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v5 && ([v7 isDataSeparatedPersona] & 1) == 0)
    {
      id v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100022EAC();
      }
      id v10 = 0;
      goto LABEL_29;
    }
    double v22 = brc_bread_crumbs();
    double v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100022E44();
    }

    id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100024A38();
  }

  id v13 = +[NSFileProviderManager br_sharedProviderManager];
  objc_msgSend(v13, "br_signalWorkingSetEnumeratorWithCompletionHandler:", &stru_100038F98);

  _BRRestorePersona();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_witness, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_itemsForcedDownload, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_downloadOperationByPath, 0);
}

@end