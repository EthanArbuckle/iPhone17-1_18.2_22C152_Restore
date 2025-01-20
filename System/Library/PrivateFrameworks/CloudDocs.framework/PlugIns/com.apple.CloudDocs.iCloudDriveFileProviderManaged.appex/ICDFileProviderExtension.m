@interface ICDFileProviderExtension
+ (void)initialize;
- (BOOL)_isLoggedInOrError:(id *)a3;
- (ICDFileProviderExtension)initWithDomain:(id)a3;
- (NSFileProviderManager)fileProviderManager;
- (id)_defaultApplicationContainerForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (id)_fetchThumbnailsForItemIdentifiersWithVersionMap:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6;
- (id)_getAsyncProxyWithErrorHandler:(id)a3;
- (id)_getDatabaseIDFromDomain;
- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8;
- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5;
- (id)enumeratorForVersionsOfItemWithIdentifier:(id)a3 request:(id)a4 error:(id *)a5;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 completionHandler:(id)a8;
- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6;
- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerDataURLWithMetadata:(id)a5 completionHandler:(id)a6;
- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithMetadata:(id)a5 completionHandler:(id)a6;
- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6;
- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithType:(id)a5 completionHandler:(id)a6;
- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9;
- (id)populateNonCodableAttributesOfTemplate:(id)a3;
- (id)supportedServiceSourcesForItemIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_accountDidChange;
- (void)_getQueryItemForFileObjectID:(id)a3 completionHandler:(id)a4;
- (void)_isSharableItem:(id)a3 withCompletionHandler:(id)a4;
- (void)_startWaitingForDomainToBeFullySetup;
- (void)collaborationCoordinator:(id)a3 handleStartCollaborationAction:(id)a4;
- (void)collaborationMetadataForItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)importDidFinishWithCompletionHandler:(id)a3;
- (void)invalidateExtension;
- (void)waitForStabilizationWithCompletionHandler:(id)a3;
@end

@implementation ICDFileProviderExtension

+ (void)initialize
{
  if ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
  {
    v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002B300();
    }

    exit(1);
  }
}

- (id)_getDatabaseIDFromDomain
{
  v2 = [(NSFileProviderDomain *)self->_domain userInfo];
  v3 = [v2 objectForKeyedSubscript:BRDomainDatabaseIDKey];

  return v3;
}

- (void)_startWaitingForDomainToBeFullySetup
{
  domainSetupWaiterQueue = self->_domainSetupWaiterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012C58;
  block[3] = &unk_1000446B0;
  block[4] = self;
  dispatch_async(domainSetupWaiterQueue, block);
}

- (id)_getAsyncProxyWithErrorHandler:(id)a3
{
  domainSetupWaiterQueue = self->_domainSetupWaiterQueue;
  id v5 = a3;
  dispatch_sync(domainSetupWaiterQueue, &stru_100044BA8);
  v6 = [(ICDFileProviderExtension *)self _getDatabaseIDFromDomain];
  v7 = [[ICDFileProviderExtensionBackChannel alloc] initWithExtension:self];
  v8 = [(NSFileProviderDomain *)self->_domain identifier];
  v9 = +[BRDaemonConnection defaultConnectionWithDomainIdentifier:v8 databaseID:v6 backChannel:v7];
  v10 = [v9 remoteObjectProxyWithErrorHandler:v5];

  return v10;
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  v8 = (char *)a3;
  id v9 = a4;
  if (!self->_isCiconiaDomain)
  {
    memset(v23, 0, sizeof(v23));
    sub_10001E454(0, (uint64_t)"-[ICDFileProviderExtension enumeratorForContainerItemIdentifier:request:error:]", 198, v23);
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v25 = (const char *)v23[0];
      __int16 v26 = 2112;
      v27 = v8;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx requested enumerator for %@%@", buf, 0x20u);
    }

    if ([v8 isEqualToString:NSFileProviderWorkingSetContainerItemIdentifier])
    {
      v19 = objc_alloc_init(BRBaseWorkingSetEnumerator);
    }
    else
    {
      if (![v8 isEqualToString:NSFileProviderTrashContainerItemIdentifier])
      {
        v20 = +[BRFileObjectID fileObjectIDWithString:v8];
        v16 = [[ICDFileEnumerator alloc] initWithFileObjectID:v20 itemIdentifier:v8 recursive:0 request:v9];

        goto LABEL_18;
      }
      v19 = (BRBaseWorkingSetEnumerator *)objc_opt_new();
    }
    v16 = (ICDFileEnumerator *)v19;
LABEL_18:
    sub_10001E628(v23);
    goto LABEL_19;
  }
  brc_bread_crumbs();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    domain = self->_domain;
    *(_DWORD *)buf = 138412546;
    v25 = (const char *)domain;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
  }

  v13 = +[NSError brc_errorLoggedOut];
  if (v13)
  {
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v25 = "-[ICDFileProviderExtension enumeratorForContainerItemIdentifier:request:error:]";
      __int16 v26 = 2080;
      if (!a5) {
        v22 = "(ignored by caller)";
      }
      v27 = v22;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5) {
    *a5 = v13;
  }

  v16 = 0;
LABEL_19:

  return v16;
}

- (id)populateNonCodableAttributesOfTemplate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 symlinkTargetPath];

  if (v5)
  {
    v6 = [v3 symlinkTargetPath];
    [v4 setObject:v6 forKey:@"symlink-target"];
  }

  return v4;
}

- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v53 = a5;
  id v52 = a7;
  id v15 = a8;
  if (!self->_isCiconiaDomain)
  {
    unint64_t v50 = a6;
    memset(v63, 0, sizeof(v63));
    sub_10001E454(1, (uint64_t)"-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]", 245, v63);
    v17 = v14;
    v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = v63[0];
      v25 = [v53 path];
      __int16 v26 = BRCPrettyPrintBitmap();
      *(_DWORD *)buf = 134219522;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]";
      *(_WORD *)&buf[22] = 2112;
      v17 = v14;
      *(void *)v65 = v14;
      *(_WORD *)&v65[8] = 2112;
      *(void *)v66 = v25;
      *(_WORD *)&v66[8] = 2112;
      *(void *)v67 = v26;
      *(_WORD *)&v67[8] = 2048;
      unint64_t v68 = v50;
      __int16 v69 = 2112;
      v70 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s createItemBasedOnTemplate %@ at '%@' fields:%@ options:%llu%@", buf, 0x48u);
    }
    if (v53)
    {
      id v62 = 0;
      v27 = +[FPSandboxingURLWrapper wrapperWithURL:v53 readonly:0 error:&v62];
      id v28 = v62;
      if (v28)
      {
        v29 = v28;
        __int16 v30 = brc_bread_crumbs();
        v31 = brc_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v65 = 0;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = 0;
          *(_WORD *)v66 = 2112;
          *(void *)&v66[2] = v29;
          *(_WORD *)v67 = 2112;
          *(void *)&v67[2] = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", buf, 0x36u);
        }

        (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v29);
        v21 = 0;
        goto LABEL_26;
      }
    }
    else
    {
      v27 = 0;
    }
    v32 = objc_msgSend(v17, "filename", v50, v52);
    unsigned int v33 = objc_msgSend(v32, "br_isExcludedWithMaximumDepth:", 1);

    if (v33)
    {
      v29 = +[NSError brc_errorExcludedFromSyncDueToFilename];
      v34 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = objc_msgSend(v29, "br_fileProviderError");
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v65 = 0;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)&v65[6] = 0;
        *(_WORD *)v66 = 2112;
        *(void *)&v66[2] = v36;
        *(_WORD *)v67 = 2112;
        *(void *)&v67[2] = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", buf, 0x36u);
      }
      v37 = objc_msgSend(v29, "br_fileProviderError");
      (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v37);

      v21 = 0;
    }
    else
    {
      v38 = [v17 filename];
      unsigned int v39 = objc_msgSend(v38, "br_isSideFaultName");

      if (v39)
      {
        v40 = brc_bread_crumbs();
        v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v40;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[INFO] rejecting side fault%@", buf, 0xCu);
        }

        v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v65 = 0;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = 0;
          strcpy(v66, "@\b");
          v66[3] = 0;
          *(_WORD *)&v66[4] = 0;
          *(_DWORD *)&v66[6] = 0;
          *(_WORD *)v67 = 2112;
          *(void *)&v67[2] = v42;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", buf, 0x36u);
        }

        (*((void (**)(id, void, void, void, void))v15 + 2))(v15, 0, 0, 0, 0);
        v21 = +[NSProgress progressWithTotalUnitCount:0];
        goto LABEL_27;
      }
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100013D54;
      v60[3] = &unk_1000445C0;
      id v44 = v15;
      id v61 = v44;
      v45 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v60];
      long long v58 = 0uLL;
      uint64_t v59 = 0;
      sub_10001E454(0, (uint64_t)"-[ICDFileProviderExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]", 274, &v58);
      v46 = brc_bread_crumbs();
      v47 = brc_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        sub_10002B448();
      }

      *(_OWORD *)buf = v58;
      *(void *)&buf[16] = v59;
      v48 = [(ICDFileProviderExtension *)self populateNonCodableAttributesOfTemplate:v17];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100013E88;
      v54[3] = &unk_100044CD8;
      v54[4] = self;
      long long v56 = *(_OWORD *)buf;
      uint64_t v57 = *(void *)&buf[16];
      id v55 = v44;
      [v45 createItemBasedOnTemplate:v17 fields:a4 contents:v27 options:v51 additionalItemAttributes:v48 completionHandler:v54];

      v21 = +[NSProgress progressWithTotalUnitCount:0];

      v29 = v61;
    }
LABEL_26:

LABEL_27:
    sub_10001E628(v63);
    goto LABEL_28;
  }
  v16 = brc_bread_crumbs();
  v17 = v14;
  v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    domain = self->_domain;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = domain;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
  }

  v20 = +[NSError brc_errorLoggedOut];
  (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v20);

  v21 = 0;
LABEL_28:

  return v21;
}

- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v30 = a6;
  id v14 = (void (**)(id, void *))a7;
  if (self->_isCiconiaDomain)
  {
    id v15 = brc_bread_crumbs();
    v16 = v12;
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = domain;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
    }

    v19 = +[NSError brc_errorLoggedOut];
    v14[2](v14, v19);

    v20 = 0;
  }
  else
  {
    memset(v39, 0, sizeof(v39));
    sub_10001E454(1, (uint64_t)"-[ICDFileProviderExtension deleteItemWithIdentifier:baseVersion:options:request:completionHandler:]", 309, v39);
    v16 = v12;
    v21 = brc_bread_crumbs();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = v39[0];
      uint64_t v24 = objc_msgSend(v13, "br_prettyDescription");
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[ICDFileProviderExtension deleteItemWithIdentifier:baseVersion:options:request:completionHandler:]";
      *(_WORD *)&buf[22] = 2112;
      v16 = v12;
      id v41 = v12;
      __int16 v42 = 2112;
      v43 = v24;
      __int16 v44 = 2048;
      unint64_t v45 = a5;
      __int16 v46 = 2112;
      v47 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s deleteItemWithIdentifier %@ baseVersion %@ options:%llu%@", buf, 0x3Eu);
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100014594;
    v37[3] = &unk_1000445C0;
    v25 = v14;
    v38 = v25;
    __int16 v26 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v37];
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_10001E454(0, (uint64_t)"-[ICDFileProviderExtension deleteItemWithIdentifier:baseVersion:options:request:completionHandler:]", 315, &v35);
    v27 = brc_bread_crumbs();
    id v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10002B448();
    }

    *(_OWORD *)buf = v35;
    *(void *)&buf[16] = v36;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000146A0;
    v31[3] = &unk_100044D28;
    v31[4] = self;
    long long v33 = v35;
    uint64_t v34 = v36;
    v32 = v25;
    [v26 deleteItemWithIdentifier:v16 baseVersion:v13 options:a5 completionHandler:v31];
    v20 = +[NSProgress progressWithTotalUnitCount:0];

    sub_10001E628(v39);
  }

  return v20;
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v46 = a5;
  id v12 = a6;
  if (!self->_isCiconiaDomain)
  {
    memset(v56, 0, sizeof(v56));
    sub_10001E454(1, (uint64_t)"-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]", 340, v56);
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = v10;
      uint64_t v21 = v56[0];
      objc_msgSend(v11, "br_prettyDescription");
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v23 = [v46 isSpeculativeDownload];
      uint64_t v24 = "NO";
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2080;
      if (v23) {
        uint64_t v24 = "YES";
      }
      *(void *)&buf[14] = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]";
      *(_WORD *)&buf[22] = 2112;
      id v10 = v20;
      id v58 = v20;
      __int16 v59 = 2112;
      id v60 = v22;
      __int16 v61 = 2080;
      id v62 = v24;
      __int16 v63 = 2112;
      v64 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s fetchContentsForItemWithIdentifier %@ requestedVersion %@ speculative %s%@", buf, 0x3Eu);
    }
    if (v11)
    {
      v25 = [BRFieldContentSignature alloc];
      __int16 v26 = [v11 contentVersion];
      v27 = [(BRFieldContentSignature *)v25 initWithData:v26];

      id v28 = [(BRFieldContentSignature *)v27 etag];
      if (!v28)
      {
        v40 = brc_bread_crumbs();
        id v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
          sub_10002B4B8();
        }

        id v38 = +[NSError brc_errorNoEtagInContentSignature];
        brc_bread_crumbs();
        __int16 v42 = (char *)objc_claimAutoreleasedReturnValue();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          __int16 v44 = objc_msgSend(v38, "br_fileProviderError");
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 2112;
          id v58 = 0;
          __int16 v59 = 2112;
          id v60 = v44;
          __int16 v61 = 2112;
          id v62 = v42;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
        }
        unsigned int v39 = objc_msgSend(v38, "br_fileProviderError");
        (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v39);
        v17 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      id v28 = 0;
    }
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100014F94;
    v54[3] = &unk_1000445C0;
    id v29 = v12;
    id v55 = v29;
    id v30 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v54];
    long long v52 = 0uLL;
    uint64_t v53 = 0;
    sub_10001E454(0, (uint64_t)"-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]", 362, &v52);
    v31 = brc_bread_crumbs();
    v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_10002B448();
    }

    *(_OWORD *)buf = v52;
    *(void *)&buf[16] = v53;
    id v33 = v10;
    uint64_t v34 = +[BRFileObjectID fileObjectIDWithString:v10];
    if ([v46 isSpeculativeDownload]) {
      uint64_t v35 = 8;
    }
    else {
      uint64_t v35 = 0;
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000150B8;
    v47[3] = &unk_100044D78;
    v47[4] = self;
    v27 = v28;
    v48 = v27;
    long long v50 = *(_OWORD *)buf;
    uint64_t v51 = *(void *)&buf[16];
    id v49 = v29;
    uint64_t v36 = [v30 startDownloadFileObject:v34 options:v35 etagIfLoser:v27 reply:v47];
    if (v27)
    {
      uint64_t v37 = +[NSProgress progressWithTotalUnitCount:1];

      id v10 = v33;
      uint64_t v36 = (void *)v37;
    }
    else
    {
      id v10 = v33;
    }
    id v38 = v36;

    unsigned int v39 = v55;
    v17 = v38;
LABEL_27:

    sub_10001E628(v56);
    goto LABEL_28;
  }
  id v13 = brc_bread_crumbs();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    domain = self->_domain;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = domain;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
  }

  v16 = +[NSError brc_errorLoggedOut];
  (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v16);

  v17 = 0;
LABEL_28:

  return v17;
}

- (void)_getQueryItemForFileObjectID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  if (self->_isCiconiaDomain)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      id v20 = domain;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
    }

    id v12 = +[NSError brc_errorLoggedOut];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v12);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100015644;
    v17[3] = &unk_1000445C0;
    id v13 = v7;
    id v18 = v13;
    id v14 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v17];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001565C;
    v15[3] = &unk_100044DA0;
    id v16 = v13;
    [v14 getQueryItemForBRFileObjectID:v6 reply:v15];

    id v12 = v18;
  }
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  v66 = (char *)a5;
  id v16 = a6;
  id v17 = a7;
  v67 = (void (**)(id, id, void *, void))a8;
  if (!self->_isCiconiaDomain)
  {
    unsigned int v23 = [BRFieldContentSignature alloc];
    uint64_t v24 = [v15 contentVersion];
    __int16 v21 = [(BRFieldContentSignature *)v23 initWithData:v24];

    v25 = [BRFieldContentSignature alloc];
    __int16 v26 = [v16 contentVersion];
    v65 = [(BRFieldContentSignature *)v25 initWithData:v26];

    memset(v90, 0, sizeof(v90));
    sub_10001E454(1, (uint64_t)"-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existingVersion:request:completionHandler:]", 419, v90);
    v27 = brc_bread_crumbs();
    id v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      __int16 v63 = v21;
      id v29 = self;
      id v30 = v17;
      v31 = v15;
      id v32 = v14;
      uint64_t v33 = v90[0];
      uint64_t v34 = v31;
      uint64_t v35 = objc_msgSend(v31, "br_prettyDescription");
      *(_DWORD *)buf = 134219522;
      v92 = (const char *)v33;
      __int16 v93 = 2080;
      v94 = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existingVer"
            "sion:request:completionHandler:]";
      __int16 v95 = 2112;
      id v14 = v32;
      id v96 = v32;
      __int16 v97 = 2112;
      v98 = v35;
      __int16 v99 = 2112;
      v100 = v66;
      __int16 v101 = 2112;
      id v102 = v16;
      __int16 v103 = 2112;
      v104 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s fetchContentsForItemWithIdentifier %@ requestedVersion %@ usingExistingContentsAtURL %@ existingVersion %@%@", buf, 0x48u);

      id v15 = v34;
      id v17 = v30;
      self = v29;
      __int16 v21 = v63;
    }

    v64 = +[BRFileObjectID fileObjectIDWithString:v14];
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x3032000000;
    v87 = sub_100016100;
    v88 = sub_100016110;
    id v89 = 0;
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x3032000000;
    v81 = sub_100016100;
    v82 = sub_100016110;
    id v83 = 0;
    if (!v15)
    {
      uint64_t v36 = dispatch_group_create();
      dispatch_group_enter(v36);
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100016118;
      v74[3] = &unk_100044DC8;
      v76 = &v84;
      v77 = &v78;
      uint64_t v37 = v36;
      v75 = v37;
      [(ICDFileProviderExtension *)self _getQueryItemForFileObjectID:v64 completionHandler:v74];
      dispatch_group_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
      id v38 = [BRFieldContentSignature alloc];
      unsigned int v39 = [(id)v85[5] contentVersion];
      v40 = [(BRFieldContentSignature *)v38 initWithData:v39];

      __int16 v21 = v40;
    }
    id v41 = brc_bread_crumbs();
    __int16 v42 = brc_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v92 = (const char *)v21;
      __int16 v93 = 2112;
      v94 = (const char *)v65;
      __int16 v95 = 2112;
      id v96 = v41;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[INFO] req:%@, exist:%@%@", buf, 0x20u);
    }

    if (v21
      && ([(BRFieldContentSignature *)v65 isPendingSignature]
       && [(BRFieldContentSignature *)v21 hasPopulatedVersionAndSignature]
       || ![(BRFieldContentSignature *)v21 contentDiffersWithSignature:v65]
       || [(BRFieldContentSignature *)v21 hasOnlyLocalEditsOnTopOfSignature:v65]
       || !v15 && [(BRFieldContentSignature *)v21 containsLocalEdits]))
    {
      v43 = brc_bread_crumbs();
      __int16 v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        sub_10002B5FC();
      }

      if (v85[5])
      {
        brc_bread_crumbs();
        unint64_t v45 = (char *)objc_claimAutoreleasedReturnValue();
        id v46 = brc_default_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v47 = [(id)v85[5] asFileProviderItem];
          *(_DWORD *)buf = 136316162;
          v92 = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existin"
                "gVersion:request:completionHandler:]";
          __int16 v93 = 2112;
          v94 = v66;
          __int16 v95 = 2112;
          id v96 = v47;
          __int16 v97 = 2112;
          v98 = 0;
          __int16 v99 = 2112;
          v100 = v45;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
        }
        v48 = [(id)v85[5] asFileProviderItem];
        v67[2](v67, v66, v48, 0);
      }
      else
      {
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_1000161B4;
        v71[3] = &unk_100044DF0;
        v72 = v66;
        v73 = v67;
        [(ICDFileProviderExtension *)self _getQueryItemForFileObjectID:v64 completionHandler:v71];

        v48 = v72;
      }
    }
    else
    {
      if (![(BRFieldContentSignature *)v21 containsLocalEdits])
      {
        __int16 v59 = brc_bread_crumbs();
        id v60 = brc_default_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          sub_10002B594();
        }

        uint64_t v61 = [(ICDFileProviderExtension *)self fetchContentsForItemWithIdentifier:v14 version:v15 request:v17 completionHandler:v67];
        goto LABEL_40;
      }
      id v49 = brc_bread_crumbs();
      long long v50 = brc_default_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        sub_10002B52C();
      }

      if (v85[5])
      {
        if (!v79[5])
        {
          uint64_t v51 = +[NSError brc_errorRequestedVersionHasLocalEdits];
          long long v52 = (void *)v79[5];
          v79[5] = v51;
        }
        brc_bread_crumbs();
        uint64_t v53 = (char *)objc_claimAutoreleasedReturnValue();
        v54 = brc_default_log();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          id v55 = [(id)v85[5] asFileProviderItem];
          long long v56 = objc_msgSend((id)v79[5], "br_fileProviderError");
          *(_DWORD *)buf = 136316162;
          v92 = "-[ICDFileProviderExtension fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existin"
                "gVersion:request:completionHandler:]";
          __int16 v93 = 2112;
          v94 = 0;
          __int16 v95 = 2112;
          id v96 = v55;
          __int16 v97 = 2112;
          v98 = v56;
          __int16 v99 = 2112;
          v100 = v53;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
        }
        uint64_t v57 = [(id)v85[5] asFileProviderItem];
        id v58 = objc_msgSend((id)v79[5], "br_fileProviderError");
        ((void (**)(id, id, void *, void *))v67)[2](v67, 0, v57, v58);
      }
      else
      {
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_100016350;
        v68[3] = &unk_100044E40;
        v68[4] = self;
        __int16 v69 = v66;
        v70 = v67;
        [(ICDFileProviderExtension *)self _getQueryItemForFileObjectID:v64 completionHandler:v68];
      }
    }
    uint64_t v61 = +[NSProgress progressWithTotalUnitCount:0];
LABEL_40:
    id v22 = (void *)v61;
    _Block_object_dispose(&v78, 8);

    _Block_object_dispose(&v84, 8);
    sub_10001E628(v90);

    goto LABEL_41;
  }
  brc_bread_crumbs();
  id v18 = (char *)objc_claimAutoreleasedReturnValue();
  v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    domain = self->_domain;
    *(_DWORD *)buf = 138412546;
    v92 = (const char *)domain;
    __int16 v93 = 2112;
    v94 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
  }

  __int16 v21 = +[NSError brc_errorLoggedOut];
  ((void (**)(id, id, void *, BRFieldContentSignature *))v67)[2](v67, 0, 0, v21);
  id v22 = 0;
LABEL_41:

  return v22;
}

- (ICDFileProviderExtension)initWithDomain:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ICDFileProviderExtension;
  id v6 = [(ICDFileProviderExtension *)&v29 init];
  if (v6)
  {
    char v28 = 0;
    id v7 = [v5 identifier];
    uint64_t v8 = +[NSString br_currentPersonaIDWithIsDataSeparated:&v28];
    personaID = v6->_personaID;
    v6->_personaID = (NSString *)v8;

    objc_storeStrong((id *)&v6->_domain, a3);
    uint64_t v10 = +[NSFileProviderManager managerForDomain:v5];
    fileProviderManager = v6->_fileProviderManager;
    v6->_fileProviderManager = (NSFileProviderManager *)v10;

    id v12 = +[NSString stringWithFormat:@"com.apple.CloudDocs.%@.responseQueue", v7];
    id v13 = (const char *)[v12 UTF8String];
    id v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v13, v15);

    responseQueue = v6->_responseQueue;
    v6->_responseQueue = (OS_dispatch_queue *)v16;

    id v18 = +[NSString stringWithFormat:@"com.apple.CloudDocs.%@.xpcConnectionQueue", v7];
    v19 = (const char *)[v18 UTF8String];
    id v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    __int16 v21 = dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create(v19, v21);

    domainSetupWaiterQueue = v6->_domainSetupWaiterQueue;
    v6->_domainSetupWaiterQueue = (OS_dispatch_queue *)v22;

    v6->_isCiconiaDomain = [(NSFileProviderDomain *)v6->_domain br_isCiconiaDomain];
    if ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
    {
      __int16 v26 = brc_bread_crumbs();
      v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v7;
        __int16 v32 = 2112;
        uint64_t v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Not allowing fpfs domain (%@) to start when not running fpfs%@", buf, 0x16u);
      }

      exit(1);
    }
    +[BRAccount startAccountTokenChangeObserverIfNeeded];
    uint64_t v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v6 selector:"_accountDidChange" name:BRAccountTokenDidChangeNotification object:0];
    [(ICDFileProviderExtension *)v6 _startWaitingForDomainToBeFullySetup];
  }
  return v6;
}

- (void)_accountDidChange
{
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (id v3 = self->_personaID) == 0)
  {
    if (qword_1000547F0 != -1) {
      dispatch_once(&qword_1000547F0, &stru_100044E60);
    }
    id v4 = (NSString *)(id)qword_1000547F8;
    int v5 = 1;
  }
  else
  {
    id v4 = v3;
    int v5 = 0;
  }
  id v6 = +[UMUserManager sharedManager];
  id v7 = [v6 currentPersona];

  id v24 = 0;
  uint64_t v8 = [v7 userPersonaUniqueString];
  id v9 = v8;
  if (v8 == v4 || [(NSString *)v8 isEqualToString:v4])
  {
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v23 = 0;
    id v13 = [v7 copyCurrentPersonaContextWithError:&v23];
    id v14 = v23;
    id v15 = v24;
    id v24 = v13;

    if (v14)
    {
      dispatch_queue_t v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_10002AC58();
      }
    }
    uint64_t v10 = [v7 generateAndRestorePersonaContextWithPersonaUniqueString:v4];

    if (v10)
    {
      id v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        __int16 v26 = personaID;
        __int16 v27 = 2112;
        char v28 = v10;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v5 && ([v7 isDataSeparatedPersona] & 1) == 0)
    {
      id v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10002AD28();
      }
      uint64_t v10 = 0;
      goto LABEL_29;
    }
    __int16 v21 = brc_bread_crumbs();
    dispatch_queue_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10002ACC0();
    }

    uint64_t v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002B664();
  }

  [(NSFileProviderManager *)self->_fileProviderManager br_signalWorkingSetEnumeratorWithCompletionHandler:&stru_100044E80];
  _BRRestorePersona();
}

- (void)dealloc
{
  responseQueue = self->_responseQueue;
  self->_responseQueue = 0;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:BRAccountTokenDidChangeNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)ICDFileProviderExtension;
  [(ICDFileProviderExtension *)&v5 dealloc];
}

- (BOOL)_isLoggedInOrError:(id *)a3
{
  id v15 = 0;
  id v4 = +[BRAccount currentCachedLoggedInAccountWithError:&v15];
  id v5 = v15;
  if (v5)
  {
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  if (!v4
    || ([v4 perAppAccountIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
    uint64_t v8 = +[NSError brc_errorLoggedOut];
    v25 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    id v10 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:v9];
    if (v10)
    {
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        id v14 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v17 = "-[ICDFileProviderExtension _isLoggedInOrError:]";
        __int16 v18 = 2080;
        if (!a3) {
          id v14 = "(ignored by caller)";
        }
        v19 = v14;
        __int16 v20 = 2112;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v10;
    }

    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_12:

  return v7;
}

- (void)waitForStabilizationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (self->_isCiconiaDomain)
  {
    brc_bread_crumbs();
    id v5 = (char *)objc_claimAutoreleasedReturnValue();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      __int16 v26 = (const char *)domain;
      __int16 v27 = 2112;
      char v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
    }

    uint64_t v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = +[NSError brc_errorLoggedOut];
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[ICDFileProviderExtension waitForStabilizationWithCompletionHandler:]";
      __int16 v27 = 2112;
      char v28 = v10;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", buf, 0x20u);
    }
    id v11 = +[NSError brc_errorLoggedOut];
    v4[2](v4, v11);
  }
  else if (+[UMUserManager br_isInSyncBubble])
  {
    memset(v24, 0, sizeof(v24));
    sub_10001E454(1, (uint64_t)"-[ICDFileProviderExtension waitForStabilizationWithCompletionHandler:]", 582, v24);
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v26 = (const char *)v24[0];
      __int16 v27 = 2080;
      char v28 = "-[ICDFileProviderExtension waitForStabilizationWithCompletionHandler:]";
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000174F0;
    v22[3] = &unk_1000445C0;
    id v14 = v4;
    id v23 = v14;
    id v15 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v22];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000175FC;
    v20[3] = &unk_1000445C0;
    id v21 = v14;
    [v15 waitForStabilizationWithReply:v20];

    sub_10001E628(v24);
  }
  else
  {
    dispatch_queue_t v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10002B734();
    }

    __int16 v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v26 = "-[ICDFileProviderExtension waitForStabilizationWithCompletionHandler:]";
      __int16 v27 = 2112;
      char v28 = 0;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", buf, 0x20u);
    }

    v4[2](v4, 0);
  }
}

- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (self->_isCiconiaDomain)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = domain;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
    }

    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v16 = +[NSError brc_errorLoggedOut];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension itemForIdentifier:request:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      id v48 = v16;
      __int16 v49 = 2112;
      long long v50 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v17 = +[NSError brc_errorLoggedOut];
    v10[2](v10, 0, v17);

    __int16 v18 = 0;
  }
  else
  {
    memset(v46, 0, sizeof(v46));
    sub_10001E454(1, (uint64_t)"-[ICDFileProviderExtension itemForIdentifier:request:completionHandler:]", 603, v46);
    v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v46[0];
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[ICDFileProviderExtension itemForIdentifier:request:completionHandler:]";
      *(_WORD *)&buf[22] = 2112;
      id v48 = v8;
      __int16 v49 = 2112;
      long long v50 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s itemForIdentifier %@%@", buf, 0x2Au);
    }

    __int16 v18 = +[NSProgress progressWithTotalUnitCount:1];
    id v45 = 0;
    unsigned __int8 v21 = [(ICDFileProviderExtension *)self _isLoggedInOrError:&v45];
    id v22 = v45;
    if (v21)
    {
      if ([v8 isEqualToString:NSFileProviderTrashContainerItemIdentifier])
      {
        id v23 = objc_opt_new();
        NSErrorUserInfoKey v24 = brc_bread_crumbs();
        v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_10002B79C();
        }

        __int16 v26 = brc_bread_crumbs();
        __int16 v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension itemForIdentifier:request:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2112;
          id v48 = 0;
          __int16 v49 = 2112;
          long long v50 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", buf, 0x2Au);
        }

        ((void (**)(id, void *, void *))v10)[2](v10, v23, 0);
        id v28 = v18;
      }
      else
      {
        __int16 v32 = +[BRFileObjectID fileObjectIDWithString:v8];
        long long v43 = 0uLL;
        uint64_t v44 = 0;
        sub_10001E454(0, (uint64_t)"-[ICDFileProviderExtension itemForIdentifier:request:completionHandler:]", 622, &v43);
        uint64_t v33 = brc_bread_crumbs();
        uint64_t v34 = brc_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          sub_10002B448();
        }

        *(_OWORD *)buf = v43;
        *(void *)&buf[16] = v44;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100017D88;
        v38[3] = &unk_100044ED0;
        v38[4] = self;
        id v35 = v32;
        id v39 = v35;
        long long v41 = *(_OWORD *)buf;
        uint64_t v42 = *(void *)&buf[16];
        v40 = v10;
        [(ICDFileProviderExtension *)self _getQueryItemForFileObjectID:v35 completionHandler:v38];
        id v36 = v18;
      }
    }
    else
    {
      __int16 v29 = brc_bread_crumbs();
      id v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension itemForIdentifier:request:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 2112;
        id v48 = v22;
        __int16 v49 = 2112;
        long long v50 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", buf, 0x2Au);
      }

      v10[2](v10, 0, v22);
      id v31 = v18;
    }

    sub_10001E628(v46);
  }

  return v18;
}

- (id)enumeratorForVersionsOfItemWithIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v6 = a3;
  if (self->_isCiconiaDomain)
  {
    BOOL v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      int v13 = 138412546;
      id v14 = domain;
      __int16 v15 = 2112;
      dispatch_queue_t v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", (uint8_t *)&v13, 0x16u);
    }

    id v10 = 0;
  }
  else
  {
    id v11 = +[BRFileObjectID fileObjectIDWithString:v6];
    id v10 = [(BRBaseFileEnumerator *)[BRFileVersionsEnumerator alloc] initWithFileObjectID:v11 itemIdentifier:v6 recursive:0];
  }

  return v10;
}

- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v52 = a4;
  id v53 = a6;
  id v51 = a8;
  id v16 = a9;
  if (!self->_isCiconiaDomain)
  {
    memset(v63, 0, sizeof(v63));
    sub_10001E454(1, (uint64_t)"-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]", 673, v63);
    __int16 v18 = v15;
    id v23 = brc_bread_crumbs();
    NSErrorUserInfoKey v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = v63[0];
      __int16 v26 = BRCPrettyPrintBitmap();
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:com"
                            "pletionHandler:]";
      *(_WORD *)&buf[22] = 2112;
      __int16 v18 = v15;
      *(void *)v65 = v15;
      *(_WORD *)&v65[8] = 2112;
      *(void *)v66 = v26;
      *(_WORD *)&v66[8] = 2048;
      *(void *)v67 = a7;
      *(_WORD *)&v67[8] = 2112;
      unint64_t v68 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s modifyItem %@ fields:%@ options:%llu%@", buf, 0x3Eu);
    }
    __int16 v27 = [v18 itemIdentifier];
    unsigned int v28 = [v27 isEqualToString:NSFileProviderTrashContainerItemIdentifier];

    if (v28)
    {
      __int16 v29 = brc_bread_crumbs();
      id v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = objc_opt_new();
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:co"
                             "mpletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v65 = 0;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)&v65[6] = 0;
        strcpy(v66, "@\b");
        v66[3] = 0;
        *(_WORD *)&v66[4] = 0;
        *(_DWORD *)&v66[6] = 0;
        *(_WORD *)v67 = 2112;
        *(void *)&v67[2] = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", buf, 0x36u);
      }
      __int16 v32 = objc_opt_new();
      (*((void (**)(id, void *, void, void, void))v16 + 2))(v16, v32, 0, 0, 0);

      id v22 = objc_opt_new();
      goto LABEL_25;
    }
    if (v53)
    {
      id v62 = 0;
      long long v50 = +[FPSandboxingURLWrapper wrapperWithURL:v53 readonly:0 error:&v62];
      id v33 = v62;
      if (v33)
      {
        uint64_t v34 = v33;
        id v35 = brc_bread_crumbs();
        id v36 = brc_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:"
                               "completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v65 = 0;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = 0;
          *(_WORD *)v66 = 2112;
          *(void *)&v66[2] = v34;
          *(_WORD *)v67 = 2112;
          *(void *)&v67[2] = v35;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", buf, 0x36u);
        }

        (*((void (**)(id, void, void, void, void *))v16 + 2))(v16, 0, 0, 0, v34);
        id v22 = objc_opt_new();
LABEL_24:

LABEL_25:
        sub_10001E628(v63);
        goto LABEL_26;
      }
    }
    else
    {
      long long v50 = 0;
    }
    uint64_t v37 = [v18 filename];
    unsigned int v38 = objc_msgSend(v37, "br_isExcludedWithMaximumDepth:", 1);

    if (v38)
    {
      id v39 = brc_bread_crumbs();
      v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        long long v41 = +[NSError brc_errorExcludedFromSyncDueToFilename];
        uint64_t v42 = objc_msgSend(v41, "br_fileProviderError");
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:co"
                             "mpletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v65 = 0;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)&v65[6] = 0;
        *(_WORD *)v66 = 2112;
        *(void *)&v66[2] = v42;
        *(_WORD *)v67 = 2112;
        *(void *)&v67[2] = v39;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %d, %d, %@)%@", buf, 0x36u);
      }
      uint64_t v34 = +[NSError brc_errorExcludedFromSyncDueToFilename];
      long long v43 = objc_msgSend(v34, "br_fileProviderError");
      (*((void (**)(id, void, void, void, void *))v16 + 2))(v16, 0, 0, 0, v43);

      id v22 = 0;
    }
    else
    {
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100018AD0;
      v60[3] = &unk_1000445C0;
      id v44 = v16;
      id v61 = v44;
      id v45 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v60];
      long long v58 = 0uLL;
      uint64_t v59 = 0;
      sub_10001E454(0, (uint64_t)"-[ICDFileProviderExtension modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]", 699, &v58);
      id v46 = brc_bread_crumbs();
      v47 = brc_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        sub_10002B448();
      }

      *(_OWORD *)buf = v58;
      *(void *)&buf[16] = v59;
      id v48 = [(ICDFileProviderExtension *)self populateNonCodableAttributesOfTemplate:v18];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100018C04;
      v54[3] = &unk_100044CD8;
      void v54[4] = self;
      long long v56 = *(_OWORD *)buf;
      uint64_t v57 = *(void *)&buf[16];
      id v55 = v44;
      [v45 modifyItem:v18 baseVersion:v52 changedFields:a5 contents:v50 options:a7 additionalAttrs:v48 completionHandler:v54];

      id v22 = +[NSProgress progressWithTotalUnitCount:0];

      uint64_t v34 = v61;
    }
    goto LABEL_24;
  }
  id v17 = brc_bread_crumbs();
  __int16 v18 = v15;
  v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    domain = self->_domain;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = domain;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
  }

  unsigned __int8 v21 = +[NSError brc_errorLoggedOut];
  (*((void (**)(id, void, void, void, void *))v16 + 2))(v16, 0, 0, 0, v21);

  id v22 = 0;
LABEL_26:

  return v22;
}

- (void)_isSharableItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BRFileObjectID fileObjectIDWithString:v6];
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  if ([v8 type] == 3 || objc_msgSend(v8, "type") == 2)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000190C8;
    v15[3] = &unk_1000445C0;
    id v9 = v7;
    id v16 = v9;
    id v10 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v15];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000190E0;
    v11[3] = &unk_100044EF8;
    id v14 = &v17;
    id v12 = v6;
    id v13 = v9;
    [v10 checkIfItemIsShareableWithItemIdentifier:v12 reply:v11];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, *((unsigned __int8 *)v18 + 24), 0);
  }
  _Block_object_dispose(&v17, 8);
}

- (id)supportedServiceSourcesForItemIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (self->_isCiconiaDomain)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      id v22 = domain;
      __int16 v23 = 2112;
      NSErrorUserInfoKey v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
    }

    id v11 = +[NSError brc_errorLoggedOut];
    v7[2](v7, 0, v11);

    id v12 = 0;
  }
  else
  {
    id v12 = +[NSProgress progressWithTotalUnitCount:0];
    if ([v6 isEqualToString:NSFileProviderRootContainerItemIdentifier])
    {
      id v13 = objc_opt_new();
      ((void (**)(id, void *, void *))v7)[2](v7, v13, 0);
    }
    else
    {
      id v14 = [(NSFileProviderDomain *)self->_domain identifier];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100019440;
      v17[3] = &unk_100044F20;
      char v20 = v7;
      void v17[4] = self;
      id v18 = v6;
      id v19 = v14;
      id v15 = v14;
      [(ICDFileProviderExtension *)self _isSharableItem:v18 withCompletionHandler:v17];
    }
  }

  return v12;
}

- (void)importDidFinishWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (self->_isCiconiaDomain)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      id v19 = domain;
      __int16 v20 = 2112;
      unsigned __int8 v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
    }

LABEL_12:
    v4[2](v4);
    goto LABEL_13;
  }
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002BA20();
  }

  if (!FPIsCloudDocsWithFPFSEnabled())
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002B9B8();
    }

    goto LABEL_12;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000198EC;
  v16[3] = &unk_1000445C0;
  id v10 = v4;
  id v17 = v10;
  id v11 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000198FC;
  v14[3] = &unk_1000447C8;
  v14[4] = self;
  id v15 = v10;
  [v11 notifyReimportCompleted:v14];

LABEL_13:
}

- (id)_defaultApplicationContainerForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = (char *)a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (self->_isCiconiaDomain)
  {
    brc_bread_crumbs();
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      domain = self->_domain;
      *(_DWORD *)buf = 138412546;
      id v44 = (const char *)domain;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Initialized with a Ciconia domain %@. This is not supported%@", buf, 0x16u);
    }

    id v11 = +[NSError brc_errorLoggedOut];
    v7[2](v7, 0, v11);
  }
  else
  {
    memset(v42, 0, sizeof(v42));
    sub_10001E454(0, (uint64_t)"-[ICDFileProviderExtension _defaultApplicationContainerForBundleIdentifier:completionHandler:]", 856, v42);
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      id v44 = (const char *)v42[0];
      __int16 v45 = 2112;
      id v46 = v6;
      __int16 v47 = 2112;
      id v48 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx lookup for default location of %@%@", buf, 0x20u);
    }

    if (v6 && ![v6 isEqualToString:@"com.apple.DocumentsApp"])
    {
      id v39 = 0;
      id v15 = +[LSApplicationRecord bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v39];
      id v14 = v39;
      if (v15)
      {
        id v16 = [v15 entitlements];
        BREntitledContainerIdentifiersForPropertyList();
        uint64_t v34 = (char *)objc_claimAutoreleasedReturnValue();
        id v17 = brc_bread_crumbs();
        id v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          id v44 = v6;
          __int16 v45 = 2112;
          id v46 = v34;
          __int16 v47 = 2112;
          id v48 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] containerEntitlements of bundle %@ are %@%@", buf, 0x20u);
        }

        if ([v34 count])
        {
          id v19 = [v34 objectAtIndexedSubscript:0];
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_10001A478;
          v37[3] = &unk_1000445C0;
          __int16 v20 = v7;
          id v38 = v20;
          unsigned __int8 v21 = [(ICDFileProviderExtension *)self _getAsyncProxyWithErrorHandler:v37];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10001A590;
          v35[3] = &unk_100044DF0;
          v35[4] = self;
          id v36 = v20;
          [v21 getDefaultAppContainerItemForContainerID:v19 recreateDocumentsIfNeeded:1 reply:v35];

          id v22 = v38;
        }
        else
        {
          unsigned int v28 = brc_bread_crumbs();
          __int16 v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            sub_10002BAF0();
          }

          id v19 = +[NSError errorWithDomain:BRCloudDocsErrorDomain code:1 userInfo:0];
          id v30 = brc_bread_crumbs();
          id v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            __int16 v32 = objc_msgSend(v19, "br_fileProviderError");
            *(_DWORD *)buf = 136315906;
            id v44 = "-[ICDFileProviderExtension _defaultApplicationContainerForBundleIdentifier:completionHandler:]";
            __int16 v45 = 2112;
            id v46 = 0;
            __int16 v47 = 2112;
            id v48 = v32;
            __int16 v49 = 2112;
            long long v50 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", buf, 0x2Au);
          }
          id v22 = objc_msgSend(v19, "br_fileProviderError");
          v7[2](v7, 0, v22);
        }
      }
      else
      {
        __int16 v23 = brc_bread_crumbs();
        NSErrorUserInfoKey v24 = brc_default_log();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
          sub_10002BA88();
        }

        uint64_t v25 = brc_bread_crumbs();
        __int16 v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          __int16 v27 = objc_msgSend(v14, "br_fileProviderError");
          *(_DWORD *)buf = 136315906;
          id v44 = "-[ICDFileProviderExtension _defaultApplicationContainerForBundleIdentifier:completionHandler:]";
          __int16 v45 = 2112;
          id v46 = 0;
          __int16 v47 = 2112;
          id v48 = v27;
          __int16 v49 = 2112;
          long long v50 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", buf, 0x2Au);
        }
        id v16 = objc_msgSend(v14, "br_fileProviderError");
        v7[2](v7, 0, v16);
      }
    }
    else
    {
      id v14 = +[BRFileObjectID fileObjectIDWithString:NSFileProviderCloudDocsContainerIdentifier];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10001A214;
      v40[3] = &unk_100044DF0;
      v40[4] = self;
      long long v41 = v7;
      [(ICDFileProviderExtension *)self _getQueryItemForFileObjectID:v14 completionHandler:v40];
    }
    sub_10001E628(v42);
  }

  return 0;
}

- (void)invalidateExtension
{
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, (os_log_type_t)0x90u, "[ERROR] Got a request to invalidate the extension from bird.%@", (uint8_t *)&v5, 0xCu);
  }

  [(ICDFileProviderExtension *)self invalidate];
  exit(0);
}

- (NSFileProviderManager)fileProviderManager
{
  return self->_fileProviderManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderManager, 0);
  objc_storeStrong((id *)&self->_domainSetupWaiterQueue, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_personaID, 0);
}

- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A9E4;
  v14[3] = &unk_100044F98;
  id v15 = a5;
  id v11 = v15;
  id v12 = -[ICDFileProviderExtension fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandlerWithType:completionHandler:](self, "fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandlerWithType:completionHandler:", a3, v14, a6, width, height);

  return v12;
}

- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithType:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v11;
  id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        [v14 setObject:&__NSArray0__struct forKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001ABFC;
  uint64_t v23[3] = &unk_100044FC0;
  id v24 = v12;
  id v20 = v12;
  unsigned __int8 v21 = -[ICDFileProviderExtension fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerWithMetadata:completionHandler:](self, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerWithMetadata:completionHandler:", v14, v23, v13, width, height);

  return v21;
}

- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerWithMetadata:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001ACF8;
  v14[3] = &unk_100044940;
  id v15 = a5;
  id v11 = v15;
  id v12 = -[ICDFileProviderExtension fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerDataURLWithMetadata:completionHandler:](self, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerDataURLWithMetadata:completionHandler:", a3, v14, a6, width, height);

  return v12;
}

- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandlerDataURLWithMetadata:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v38 = a5;
  id v31 = a6;
  queue = dispatch_get_global_queue(17, 0);
  group = dispatch_group_create();
  id v33 = (id)objc_opt_new();
  id v35 = [v10 allKeys];
  unint64_t v11 = 0;
  do
  {
    id v12 = objc_opt_new();
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v35;
    char v13 = 0;
    id v14 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (!v14) {
      goto LABEL_14;
    }
    uint64_t v15 = *(void *)v54;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v54 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v18 = [v10 objectForKeyedSubscript:v17];
        BOOL v19 = v11 < (unint64_t)[v18 count];

        if (v19)
        {
          id v20 = [BRThumbnailRequest alloc];
          unsigned __int8 v21 = [v10 objectForKeyedSubscript:v17];
          id v22 = [(BRThumbnailRequest *)v21 objectAtIndexedSubscript:v11];
          __int16 v23 = [(BRThumbnailRequest *)v20 initWithIdentifier:v17 version:v22];
          [v12 addObject:v23];

          char v13 = 1;
        }
        else
        {
          if (v11) {
            continue;
          }
          unsigned __int8 v21 = [[BRThumbnailRequest alloc] initWithIdentifier:v17 version:0];
          [v12 addObject:v21];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v14);
LABEL_14:

    [v33 addObject:v12];
    ++v11;
  }
  while ((v13 & 1) != 0);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = sub_10001B2FC;
  v51[4] = sub_10001B30C;
  id v52 = 0;
  id v36 = (id)objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v34 = v33;
  id v24 = [v34 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v48;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v34);
        }
        long long v27 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
        dispatch_group_enter(group);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10001B314;
        v44[3] = &unk_100044FE8;
        v44[4] = v27;
        id v46 = v51;
        __int16 v45 = group;
        long long v28 = -[ICDFileProviderExtension _fetchThumbnailsForItemIdentifiersWithVersionMap:requestedSize:perThumbnailCompletionHandler:completionHandler:](self, "_fetchThumbnailsForItemIdentifiersWithVersionMap:requestedSize:perThumbnailCompletionHandler:completionHandler:", v27, v38, v44, width, height);
        if (v28) {
          objc_msgSend(v36, "addChild:withPendingUnitCount:", v28, objc_msgSend(v27, "count"));
        }
      }
      id v24 = [v34 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v24);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B434;
  block[3] = &unk_100045010;
  id v42 = v31;
  long long v43 = v51;
  id v29 = v31;
  dispatch_group_notify(group, queue, block);

  _Block_object_dispose(v51, 8);

  return v36;
}

- (id)_fetchThumbnailsForItemIdentifiersWithVersionMap:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  dispatch_group_t v12 = dispatch_group_create();
  char v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  id v14 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v15 = dispatch_queue_create("com.apple.br.fetch-thumbnail", v14);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001B708;
  v31[3] = &unk_100045088;
  v31[4] = self;
  id v16 = v12;
  __int16 v32 = v16;
  uint64_t v17 = objc_retainBlock(v31);
  dispatch_group_enter(v16);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_10001B2FC;
  v29[4] = sub_10001B30C;
  id v30 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001BB64;
  v26[3] = &unk_1000450B0;
  long long v28 = v29;
  uint64_t v18 = v16;
  long long v27 = v18;
  BOOL v19 = objc_retainBlock(v26);
  id v20 = sub_10000CD10(v9, v17, v10, v19);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001BBC4;
  uint64_t v23[3] = &unk_100045010;
  id v24 = v11;
  uint64_t v25 = v29;
  id v21 = v11;
  dispatch_group_notify(v18, v15, v23);

  _Block_object_dispose(v29, 8);

  return v20;
}

- (id)fetchThumbnailsForDictionary:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001BCC0;
  v14[3] = &unk_100044FC0;
  id v15 = a5;
  id v11 = v15;
  dispatch_group_t v12 = -[ICDFileProviderExtension fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerWithMetadata:completionHandler:](self, "fetchThumbnailsForDictionary:requestedSize:perThumbnailCompletionHandlerWithMetadata:completionHandler:", a3, v14, a6, width, height);

  return v12;
}

- (void)collaborationMetadataForItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_1000220F0;
  void v15[4] = sub_100022100;
  id v16 = 0;
  id v7 = objc_alloc_init((Class)NSOperationQueue);
  id v8 = [objc_alloc((Class)BRShareCopyOperation) initWithItemID:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100022108;
  v11[3] = &unk_100045278;
  id v14 = v15;
  id v9 = v5;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v8 setRootShareCopyCompletionBlock:v11];
  [v7 addOperation:v8];

  _Block_object_dispose(v15, 8);
}

- (void)collaborationCoordinator:(id)a3 handleStartCollaborationAction:(id)a4
{
  id v4 = a4;
  id v5 = [v4 collaborationMetadata];
  id v6 = [v5 localIdentifier];

  id v8 = v4;
  id v7 = v4;
  BRFetchCollaborationIdentifierForItemWithIdentifier();
}

@end