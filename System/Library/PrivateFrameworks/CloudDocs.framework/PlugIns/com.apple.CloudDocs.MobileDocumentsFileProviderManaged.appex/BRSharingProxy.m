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
  v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    v31 = v27;
    __int16 v32 = 2112;
    *(void *)v33 = self;
    *(_WORD *)&v33[8] = 2080;
    *(void *)&v33[10] = "-[BRSharingProxy fetchSharingInfo:]";
    *(_WORD *)&v33[18] = 2112;
    *(void *)&v33[20] = v7;
    *(_WORD *)&v33[28] = 2112;
    *(void *)&v33[30] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  fileProviderExtension = self->_fileProviderExtension;
  v9 = [(BaseSharingProxy *)self itemIdentifier];
  v10 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v9];

  if (v10)
  {
    id v26 = 0;
    id v25 = 0;
    unsigned __int8 v11 = [v10 getResourceValue:&v26 forKey:NSURLUbiquitousItemIsSharedKey error:&v25];
    id v12 = v26;
    id v13 = v25;
    if (v11)
    {
      v14 = brc_bread_crumbs();
      objc_super v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v24 = [v12 BOOLValue];
        *(_DWORD *)buf = 138413314;
        v31 = self;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = v24;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = 0;
        *(_WORD *)&v33[14] = 2112;
        *(void *)&v33[16] = 0;
        *(_WORD *)&v33[24] = 2112;
        *(void *)&v33[26] = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@)%@", buf, 0x30u);
      }

      id v16 = [v12 BOOLValue];
      id v17 = 0;
    }
    else
    {
      v20 = brc_bread_crumbs();
      v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        v31 = self;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = 0;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = 0;
        *(_WORD *)&v33[14] = 2112;
        *(void *)&v33[16] = v13;
        *(_WORD *)&v33[24] = 2112;
        *(void *)&v33[26] = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@)%@", buf, 0x30u);
      }

      id v16 = 0;
      id v17 = v13;
    }
    v4[2](v4, v16, 0, v17);
  }
  else
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v22 = [(BaseSharingProxy *)self itemIdentifier];
      v23 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v22];
      *(_DWORD *)buf = 138413314;
      v31 = self;
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 0;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = 0;
      *(_WORD *)&v33[14] = 2112;
      *(void *)&v33[16] = v23;
      *(_WORD *)&v33[24] = 2112;
      *(void *)&v33[26] = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@)%@", buf, 0x30u);
    }
    id v12 = [(BaseSharingProxy *)self itemIdentifier];
    id v13 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v12];
    v4[2](v4, 0, 0, v13);
  }

  __brc_leave_section();
}

- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    __int16 v32 = v28;
    __int16 v33 = 2112;
    *(void *)v34 = self;
    *(_WORD *)&v34[8] = 2080;
    *(void *)&v34[10] = "-[BRSharingProxy preflightCheckIfCurrentlyShareableWithCompletion:]";
    *(_WORD *)&v34[18] = 2112;
    *(void *)&v34[20] = v7;
    *(_WORD *)&v34[28] = 2112;
    *(void *)&v34[30] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  fileProviderExtension = self->_fileProviderExtension;
  v9 = [(BaseSharingProxy *)self itemIdentifier];
  v10 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v9];

  if (v10)
  {
    id v27 = 0;
    id v26 = 0;
    unsigned __int8 v11 = [v10 getResourceValue:&v27 forKey:NSURLUbiquitousItemIsSharedKey error:&v26];
    id v12 = v27;
    id v13 = v26;
    if (v11)
    {
      v14 = brc_bread_crumbs();
      objc_super v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v25 = [v12 BOOLValue];
        *(_DWORD *)buf = 138413826;
        __int16 v32 = self;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = v25;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = 0;
        *(_WORD *)&v34[14] = 2112;
        *(void *)&v34[16] = 0;
        *(_WORD *)&v34[24] = 2112;
        *(void *)&v34[26] = 0;
        *(_WORD *)&v34[34] = 2112;
        *(void *)&v34[36] = 0;
        __int16 v35 = 2112;
        v36 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@, %@, %@)%@", buf, 0x44u);
      }

      id v16 = [v12 BOOLValue];
      id v17 = 0;
    }
    else
    {
      v20 = brc_bread_crumbs();
      v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413826;
        __int16 v32 = self;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = 0;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = 0;
        *(_WORD *)&v34[14] = 2112;
        *(void *)&v34[16] = 0;
        *(_WORD *)&v34[24] = 2112;
        *(void *)&v34[26] = 0;
        *(_WORD *)&v34[34] = 2112;
        *(void *)&v34[36] = v13;
        __int16 v35 = 2112;
        v36 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@, %@, %@)%@", buf, 0x44u);
      }

      id v16 = 0;
      id v17 = v13;
    }
    (*((void (**)(id, id, void, void, void, id))v4 + 2))(v4, v16, 0, 0, 0, v17);
  }
  else
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v23 = [(BaseSharingProxy *)self itemIdentifier];
      unsigned int v24 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v23];
      *(_DWORD *)buf = 138413826;
      __int16 v32 = self;
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 0;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = 0;
      *(_WORD *)&v34[14] = 2112;
      *(void *)&v34[16] = 0;
      *(_WORD *)&v34[24] = 2112;
      *(void *)&v34[26] = 0;
      *(_WORD *)&v34[34] = 2112;
      *(void *)&v34[36] = v24;
      __int16 v35 = 2112;
      v36 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%d, %@, %@, %@, %@)%@", buf, 0x44u);
    }
    id v12 = [(BaseSharingProxy *)self itemIdentifier];
    id v13 = +[NSError fileProviderErrorForNonExistentItemWithIdentifier:v12];
    (*((void (**)(id, void, void, void, void, id))v4 + 2))(v4, 0, 0, 0, 0, v13);
  }

  __brc_leave_section();
  return 0;
}

- (id)fetchParticipantListAndPublicPermission:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = self;
    __int16 v20 = 2080;
    v21 = "-[BRSharingProxy fetchParticipantListAndPublicPermission:]";
    __int16 v22 = 2112;
    v23 = v7;
    __int16 v24 = 2112;
    unsigned int v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FBE0;
  v11[3] = &unk_100038830;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  v9 = [(BRSharingProxy *)self fetchShareWithCompletion:v11];

  __brc_leave_section();

  return v9;
}

- (void)startPreparingForShareWhenForcing:(BOOL)a3
{
  __brc_create_section();
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v8 = 0;
    __int16 v9 = 2112;
    v10 = self;
    __int16 v11 = 2080;
    id v12 = "-[BRSharingProxy startPreparingForShareWhenForcing:]";
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  __brc_leave_section();
}

- (id)fetchShareWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    v31 = v27;
    __int16 v32 = 2112;
    __int16 v33 = self;
    __int16 v34 = 2080;
    __int16 v35 = "-[BRSharingProxy fetchShareWithCompletion:]";
    __int16 v36 = 2112;
    v37 = v7;
    __int16 v38 = 2112;
    v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  uint64_t v8 = [(BaseSharingProxy *)self cachedShare];

  if (v8)
  {
    __int16 v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(BaseSharingProxy *)self cachedShare];
      *(_DWORD *)buf = 138413058;
      v31 = self;
      __int16 v32 = 2112;
      __int16 v33 = v19;
      __int16 v34 = 2112;
      __int16 v35 = 0;
      __int16 v36 = 2112;
      v37 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v11 = [(BaseSharingProxy *)self cachedShare];
    v4[2](v4, v11, 0);
    id v12 = 0;
  }
  else
  {
    fileProviderExtension = self->_fileProviderExtension;
    uint64_t v14 = [(BaseSharingProxy *)self itemIdentifier];
    __int16 v15 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v14];

    id v12 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v12);
    id v16 = [objc_alloc((Class)BRShareCopyOperation) initWithURL:v15];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001037C;
    v23[3] = &unk_100038B68;
    v23[4] = self;
    objc_copyWeak(&v26, (id *)buf);
    id v11 = v15;
    id v24 = v11;
    unsigned int v25 = v4;
    [v16 setRootShareCopyCompletionBlock:v23];
    objc_initWeak(&location, v16);
    [v12 setCancellable:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000106D0;
    v20[3] = &unk_100038880;
    objc_copyWeak(&v21, &location);
    [v12 setCancellationHandler:v20];
    uint64_t v17 = [(BaseSharingProxy *)self operationQueue];
    [v17 addOperation:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

  __brc_leave_section();

  return v12;
}

- (id)fetchShareURLWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = v26;
    __int16 v31 = 2112;
    __int16 v32 = self;
    __int16 v33 = 2080;
    __int16 v34 = "-[BRSharingProxy fetchShareURLWithCompletion:]";
    __int16 v35 = 2112;
    __int16 v36 = v7;
    __int16 v37 = 2112;
    __int16 v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  fileProviderExtension = self->_fileProviderExtension;
  __int16 v9 = [(BaseSharingProxy *)self itemIdentifier];
  v10 = [(BRFileProviderExtension *)fileProviderExtension URLForItemWithPersistentIdentifier:v9];

  id v25 = 0;
  id v11 = objc_msgSend(v10, "br_typeIdentifierWithError:", &v25);
  id v12 = (char *)v25;
  if (v12)
  {
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      __int16 v32 = 0;
      __int16 v33 = 2112;
      __int16 v34 = v12;
      __int16 v35 = 2112;
      __int16 v36 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    v4[2](v4, 0, v12);
    __int16 v15 = 0;
  }
  else
  {
    __int16 v15 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v15);
    id v16 = [objc_alloc((Class)BRShareCopyShareURLOperation) initWithFileURL:v10 documentType:v11];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100010B94;
    v22[3] = &unk_100038B90;
    objc_copyWeak(&v24, (id *)buf);
    v22[4] = self;
    v23 = v4;
    [v16 setCopyShareURLCompletionBlock:v22];
    [v15 setCancellable:1];
    objc_initWeak(&location, v16);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100010CD8;
    v19[3] = &unk_100038880;
    objc_copyWeak(&v20, &location);
    [v15 setCancellationHandler:v19];
    uint64_t v17 = [(BaseSharingProxy *)self operationQueue];
    [v17 addOperation:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

  __brc_leave_section();

  return v15;
}

- (id)saveShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  __int16 v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  __brc_create_section();
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    __int16 v35 = v31;
    __int16 v36 = 2112;
    __int16 v37 = self;
    __int16 v38 = 2080;
    v39 = "-[BRSharingProxy saveShare:completion:]";
    __int16 v40 = 2112;
    v41 = v10;
    __int16 v42 = 2112;
    v43 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  id v11 = [v6 objectForKeyedSubscript:CKShareTypeKey];
  unsigned int v12 = [v11 isEqual:_BRFolderShareType];

  if (v12)
  {
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v21 = +[NSError br_errorWithPOSIXCode:45];
      *(_DWORD *)buf = 138413058;
      __int16 v35 = self;
      __int16 v36 = 2112;
      __int16 v37 = 0;
      __int16 v38 = 2112;
      v39 = v21;
      __int16 v40 = 2112;
      v41 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v15 = +[NSError br_errorWithPOSIXCode:45];
    v7[2](v7, 0, v15);
    id v16 = 0;
  }
  else
  {
    [(BaseSharingProxy *)self setCachedShare:v6];
    id v17 = objc_alloc((Class)BRShareSaveOperation);
    __int16 v18 = [(BaseSharingProxy *)self fileURL];
    id v15 = [v17 initWithShare:v6 fileURL:v18];

    id v16 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v16);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000111C4;
    v28[3] = &unk_100038858;
    objc_copyWeak(&v30, (id *)buf);
    v28[4] = self;
    uint64_t v29 = v7;
    [v15 setShareSaveCompletionBlock:v28];
    [v16 setCancellable:1];
    objc_initWeak(&location, v15);
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    id v24 = sub_100011314;
    id v25 = &unk_100038880;
    objc_copyWeak(&v26, &location);
    [v16 setCancellationHandler:&v22];
    v19 = [(BaseSharingProxy *)self operationQueue];
    [v19 addOperation:v15];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }

  __brc_leave_section();

  return v16;
}

- (id)unshareWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    id v25 = self;
    __int16 v26 = 2080;
    uint64_t v27 = "-[BRSharingProxy unshareWithCompletion:]";
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    __int16 v30 = 2112;
    __int16 v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  uint64_t v8 = +[NSProgress progressWithTotalUnitCount:2];
  [v8 setCancellable:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100011614;
  v16[3] = &unk_1000388D0;
  v16[4] = self;
  id v9 = v4;
  id v18 = v9;
  id v10 = v8;
  id v17 = v10;
  id v11 = [(BRSharingProxy *)self fetchShareWithCompletion:v16];
  if (![v10 completedUnitCount])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100011B8C;
    v14[3] = &unk_1000387E0;
    id v15 = v11;
    [v10 setCancellationHandler:v14];
  }
  id v12 = v10;

  __brc_leave_section();

  return v12;
}

- (void).cxx_destruct
{
}

@end