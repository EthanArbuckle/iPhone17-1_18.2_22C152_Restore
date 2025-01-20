@interface BRSharingProxy
- (BRSharingProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 fileURL:(id)a5 operationQueue:(id)a6;
- (id)fetchParticipantListAndPublicPermission:(id)a3;
- (id)fetchShareURLWithCompletion:(id)a3;
- (id)fetchShareWithCompletion:(id)a3;
- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3;
- (id)saveShare:(id)a3 completion:(id)a4;
- (id)unshareWithCompletion:(id)a3;
- (void)fetchSharingInfo:(id)a3;
- (void)startPreparingForShareWhenForcing:(BOOL)a3;
@end

@implementation BRSharingProxy

- (BRSharingProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 fileURL:(id)a5 operationQueue:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRSharingProxy;
  v12 = [(BaseSharingProxy *)&v15 initWithItemIdentifier:a4 fileURL:a5 operationQueue:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_fileProviderExtension, a3);
  }

  return v13;
}

- (void)fetchSharingInfo:(id)a3
{
  v4 = (void (**)(id, id, void, id))a3;
  memset(v28, 0, sizeof(v28));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy fetchSharingInfo:]", 56, v28);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v28[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    v30 = (BRSharingProxy *)v7;
    __int16 v31 = 2112;
    *(void *)v32 = self;
    *(_WORD *)&v32[8] = 2080;
    *(void *)&v32[10] = "-[BRSharingProxy fetchSharingInfo:]";
    *(_WORD *)&v32[18] = 2112;
    *(void *)&v32[20] = v8;
    *(_WORD *)&v32[28] = 2112;
    *(void *)&v32[30] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  fileProviderExtension = self->_fileProviderExtension;
  v10 = [(BaseSharingProxy *)self itemIdentifier];
  id v11 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v10];

  if (v11)
  {
    id v27 = 0;
    id v26 = 0;
    unsigned __int8 v12 = [v11 getResourceValue:&v27 forKey:NSURLUbiquitousItemIsSharedKey error:&v26];
    id v13 = v27;
    id v14 = v26;
    if (v12)
    {
      objc_super v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v25 = [v13 BOOLValue];
        *(_DWORD *)buf = 138413314;
        v30 = self;
        __int16 v31 = 1024;
        *(_DWORD *)v32 = v25;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = 0;
        *(_WORD *)&v32[14] = 2112;
        *(void *)&v32[16] = 0;
        *(_WORD *)&v32[24] = 2112;
        *(void *)&v32[26] = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@)%@", buf, 0x30u);
      }

      id v17 = [v13 BOOLValue];
      id v18 = 0;
    }
    else
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        v30 = self;
        __int16 v31 = 1024;
        *(_DWORD *)v32 = 0;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = 0;
        *(_WORD *)&v32[14] = 2112;
        *(void *)&v32[16] = v14;
        *(_WORD *)&v32[24] = 2112;
        *(void *)&v32[26] = v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@)%@", buf, 0x30u);
      }

      id v17 = 0;
      id v18 = v14;
    }
    v4[2](v4, v17, 0, v18);
  }
  else
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v23 = [(BaseSharingProxy *)self itemIdentifier];
      v24 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v23];
      *(_DWORD *)buf = 138413314;
      v30 = self;
      __int16 v31 = 1024;
      *(_DWORD *)v32 = 0;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = 0;
      *(_WORD *)&v32[14] = 2112;
      *(void *)&v32[16] = v24;
      *(_WORD *)&v32[24] = 2112;
      *(void *)&v32[26] = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@)%@", buf, 0x30u);
    }
    id v13 = [(BaseSharingProxy *)self itemIdentifier];
    id v14 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v13];
    v4[2](v4, 0, 0, v14);
  }

  sub_100014B98(v28);
}

- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3
{
  id v4 = a3;
  memset(v29, 0, sizeof(v29));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy preflightCheckIfCurrentlyShareableWithCompletion:]", 74, v29);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v29[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    __int16 v31 = (BRSharingProxy *)v7;
    __int16 v32 = 2112;
    *(void *)v33 = self;
    *(_WORD *)&v33[8] = 2080;
    *(void *)&v33[10] = "-[BRSharingProxy preflightCheckIfCurrentlyShareableWithCompletion:]";
    *(_WORD *)&v33[18] = 2112;
    *(void *)&v33[20] = v8;
    *(_WORD *)&v33[28] = 2112;
    *(void *)&v33[30] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  fileProviderExtension = self->_fileProviderExtension;
  v10 = [(BaseSharingProxy *)self itemIdentifier];
  id v11 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v10];

  if (v11)
  {
    id v28 = 0;
    id v27 = 0;
    unsigned __int8 v12 = [v11 getResourceValue:&v28 forKey:NSURLUbiquitousItemIsSharedKey error:&v27];
    id v13 = v28;
    id v14 = v27;
    if (v12)
    {
      objc_super v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v26 = [v13 BOOLValue];
        *(_DWORD *)buf = 138413826;
        __int16 v31 = self;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = v26;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = 0;
        *(_WORD *)&v33[14] = 2112;
        *(void *)&v33[16] = 0;
        *(_WORD *)&v33[24] = 2112;
        *(void *)&v33[26] = 0;
        *(_WORD *)&v33[34] = 2112;
        *(void *)&v33[36] = 0;
        __int16 v34 = 2112;
        v35 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@, %@, %@)%@", buf, 0x44u);
      }

      id v17 = [v13 BOOLValue];
      id v18 = 0;
    }
    else
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413826;
        __int16 v31 = self;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = 0;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = 0;
        *(_WORD *)&v33[14] = 2112;
        *(void *)&v33[16] = 0;
        *(_WORD *)&v33[24] = 2112;
        *(void *)&v33[26] = 0;
        *(_WORD *)&v33[34] = 2112;
        *(void *)&v33[36] = v14;
        __int16 v34 = 2112;
        v35 = v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@, %@, %@)%@", buf, 0x44u);
      }

      id v17 = 0;
      id v18 = v14;
    }
    (*((void (**)(id, id, void, void, void, id))v4 + 2))(v4, v17, 0, 0, 0, v18);
  }
  else
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v24 = [(BaseSharingProxy *)self itemIdentifier];
      unsigned int v25 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v24];
      *(_DWORD *)buf = 138413826;
      __int16 v31 = self;
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 0;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = 0;
      *(_WORD *)&v33[14] = 2112;
      *(void *)&v33[16] = 0;
      *(_WORD *)&v33[24] = 2112;
      *(void *)&v33[26] = 0;
      *(_WORD *)&v33[34] = 2112;
      *(void *)&v33[36] = v25;
      __int16 v34 = 2112;
      v35 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@, %@, %@)%@", buf, 0x44u);
    }
    id v13 = [(BaseSharingProxy *)self itemIdentifier];
    id v14 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v13];
    (*((void (**)(id, void, void, void, void, id))v4 + 2))(v4, 0, 0, 0, 0, v14);
  }

  sub_100014B98(v29);
  return 0;
}

- (id)fetchParticipantListAndPublicPermission:(id)a3
{
  id v4 = a3;
  memset(v14, 0, sizeof(v14));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy fetchParticipantListAndPublicPermission:]", 93, v14);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v14[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = self;
    __int16 v19 = 2080;
    v20 = "-[BRSharingProxy fetchParticipantListAndPublicPermission:]";
    __int16 v21 = 2112;
    v22 = v8;
    __int16 v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008BC4;
  v12[3] = &unk_100038820;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  v10 = [(BRSharingProxy *)self fetchShareWithCompletion:v12];

  sub_100014B98(v14);

  return v10;
}

- (void)startPreparingForShareWhenForcing:(BOOL)a3
{
  memset(v8, 0, sizeof(v8));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy startPreparingForShareWhenForcing:]", 101, v8);
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v8[0];
    uint64_t v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    unsigned __int8 v12 = self;
    __int16 v13 = 2080;
    id v14 = "-[BRSharingProxy startPreparingForShareWhenForcing:]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  sub_100014B98(v8);
}

- (id)fetchShareWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  memset(v28, 0, sizeof(v28));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy fetchShareWithCompletion:]", 109, v28);
  v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v28[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    v30 = (BRSharingProxy *)v7;
    __int16 v31 = 2112;
    __int16 v32 = self;
    __int16 v33 = 2080;
    __int16 v34 = "-[BRSharingProxy fetchShareWithCompletion:]";
    __int16 v35 = 2112;
    v36 = v8;
    __int16 v37 = 2112;
    v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  id v9 = [(BaseSharingProxy *)self cachedShare];

  if (v9)
  {
    uint64_t v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v20 = [(BaseSharingProxy *)self cachedShare];
      *(_DWORD *)buf = 138413058;
      v30 = self;
      __int16 v31 = 2112;
      __int16 v32 = v20;
      __int16 v33 = 2112;
      __int16 v34 = 0;
      __int16 v35 = 2112;
      v36 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v12 = [(BaseSharingProxy *)self cachedShare];
    v4[2](v4, v12, 0);
    __int16 v13 = 0;
  }
  else
  {
    fileProviderExtension = self->_fileProviderExtension;
    __int16 v15 = [(BaseSharingProxy *)self itemIdentifier];
    uint64_t v16 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v15];

    __int16 v13 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v13);
    id v17 = [objc_alloc((Class)BRShareCopyOperation) initWithURL:v16];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009360;
    v24[3] = &unk_100038888;
    v24[4] = self;
    objc_copyWeak(&v27, (id *)buf);
    id v12 = v16;
    id v25 = v12;
    unsigned int v26 = v4;
    [v17 setRootShareCopyCompletionBlock:v24];
    objc_initWeak(&location, v17);
    [v13 setCancellable:1];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000096B4;
    v21[3] = &unk_1000388B0;
    objc_copyWeak(&v22, &location);
    [v13 setCancellationHandler:v21];
    id v18 = [(BaseSharingProxy *)self operationQueue];
    [v18 addOperation:v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

  sub_100014B98(v28);

  return v13;
}

- (id)fetchShareURLWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  memset(v27, 0, sizeof(v27));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy fetchShareURLWithCompletion:]", 151, v27);
  v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v27[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    v29 = (BRSharingProxy *)v7;
    __int16 v30 = 2112;
    __int16 v31 = self;
    __int16 v32 = 2080;
    __int16 v33 = "-[BRSharingProxy fetchShareURLWithCompletion:]";
    __int16 v34 = 2112;
    __int16 v35 = v8;
    __int16 v36 = 2112;
    __int16 v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  fileProviderExtension = self->_fileProviderExtension;
  uint64_t v10 = [(BaseSharingProxy *)self itemIdentifier];
  __int16 v11 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v10];

  id v26 = 0;
  id v12 = objc_msgSend(v11, "br_typeIdentifierWithError:", &v26);
  __int16 v13 = (char *)v26;
  if (v13)
  {
    id v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v29 = self;
      __int16 v30 = 2112;
      __int16 v31 = 0;
      __int16 v32 = 2112;
      __int16 v33 = v13;
      __int16 v34 = 2112;
      __int16 v35 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    v4[2](v4, 0, v13);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v16);
    id v17 = [objc_alloc((Class)BRShareCopyShareURLOperation) initWithFileURL:v11 documentType:v12];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100009B78;
    v23[3] = &unk_1000388D8;
    objc_copyWeak(&v25, (id *)buf);
    v23[4] = self;
    v24 = v4;
    [v17 setCopyShareURLCompletionBlock:v23];
    [v16 setCancellable:1];
    objc_initWeak(&location, v17);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100009CBC;
    v20[3] = &unk_1000388B0;
    objc_copyWeak(&v21, &location);
    [v16 setCancellationHandler:v20];
    id v18 = [(BaseSharingProxy *)self operationQueue];
    [v18 addOperation:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

  sub_100014B98(v27);

  return v16;
}

- (id)saveShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  memset(v32, 0, sizeof(v32));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy saveShare:completion:]", 180, v32);
  v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v32[0];
    __int16 v11 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    __int16 v34 = (BRSharingProxy *)v10;
    __int16 v35 = 2112;
    __int16 v36 = self;
    __int16 v37 = 2080;
    v38 = "-[BRSharingProxy saveShare:completion:]";
    __int16 v39 = 2112;
    v40 = v11;
    __int16 v41 = 2112;
    v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  id v12 = [v6 objectForKeyedSubscript:CKShareTypeKey];
  unsigned int v13 = [v12 isEqual:_BRFolderShareType];

  if (v13)
  {
    id v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v22 = +[NSError br_errorWithPOSIXCode:45];
      *(_DWORD *)buf = 138413058;
      __int16 v34 = self;
      __int16 v35 = 2112;
      __int16 v36 = 0;
      __int16 v37 = 2112;
      v38 = v22;
      __int16 v39 = 2112;
      v40 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v16 = +[NSError br_errorWithPOSIXCode:45];
    v7[2](v7, 0, v16);
    id v17 = 0;
  }
  else
  {
    [(BaseSharingProxy *)self setCachedShare:v6];
    id v18 = objc_alloc((Class)BRShareSaveOperation);
    __int16 v19 = [(BaseSharingProxy *)self fileURL];
    id v16 = [v18 initWithShare:v6 fileURL:v19];

    id v17 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v17);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000A1A8;
    uint64_t v29[3] = &unk_100038900;
    objc_copyWeak(&v31, (id *)buf);
    v29[4] = self;
    __int16 v30 = v7;
    [v16 setShareSaveCompletionBlock:v29];
    [v17 setCancellable:1];
    objc_initWeak(&location, v16);
    __int16 v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_10000A2F8;
    id v26 = &unk_1000388B0;
    objc_copyWeak(&v27, &location);
    [v17 setCancellationHandler:&v23];
    v20 = [(BaseSharingProxy *)self operationQueue];
    [v20 addOperation:v16];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }

  sub_100014B98(v32);

  return v17;
}

- (id)unshareWithCompletion:(id)a3
{
  id v4 = a3;
  memset(v20, 0, sizeof(v20));
  sub_1000149C4(1, (uint64_t)"-[BRSharingProxy unshareWithCompletion:]", 209, v20);
  v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v20[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = self;
    __int16 v25 = 2080;
    id v26 = "-[BRSharingProxy unshareWithCompletion:]";
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    __int16 v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  id v9 = +[NSProgress progressWithTotalUnitCount:2];
  [v9 setCancellable:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000A5F8;
  v17[3] = &unk_100038950;
  v17[4] = self;
  id v10 = v4;
  id v19 = v10;
  id v11 = v9;
  id v18 = v11;
  id v12 = [(BRSharingProxy *)self fetchShareWithCompletion:v17];
  if (![v11 completedUnitCount])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000AB70;
    v15[3] = &unk_1000387D0;
    id v16 = v12;
    [v11 setCancellationHandler:v15];
  }
  id v13 = v11;

  sub_100014B98(v20);

  return v13;
}

- (void).cxx_destruct
{
}

@end