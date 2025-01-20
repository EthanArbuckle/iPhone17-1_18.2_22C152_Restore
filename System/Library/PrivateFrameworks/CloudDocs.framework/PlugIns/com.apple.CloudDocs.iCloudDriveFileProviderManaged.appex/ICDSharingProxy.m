@interface ICDSharingProxy
- (ICDSharingProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 fileURL:(id)a5 operationQueue:(id)a6;
- (id)fetchParticipantListAndPublicPermission:(id)a3;
- (id)fetchShareURLWithCompletion:(id)a3;
- (id)fetchShareWithCompletion:(id)a3;
- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3;
- (id)saveShare:(id)a3 completion:(id)a4;
- (id)unshareWithCompletion:(id)a3;
- (void)fetchSharingInfo:(id)a3;
- (void)startPreparingForShareWhenForcing:(BOOL)a3;
@end

@implementation ICDSharingProxy

- (ICDSharingProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 fileURL:(id)a5 operationQueue:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICDSharingProxy;
  v12 = [(BaseSharingProxy *)&v15 initWithItemIdentifier:a4 fileURL:a5 operationQueue:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_fileProviderExtension, a3);
  }

  return v13;
}

- (void)fetchSharingInfo:(id)a3
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002C19C();
  }
}

- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002C204();
  }

  return 0;
}

- (id)fetchParticipantListAndPublicPermission:(id)a3
{
  id v4 = a3;
  memset(v14, 0, sizeof(v14));
  sub_10001E454(1, (uint64_t)"-[ICDSharingProxy fetchParticipantListAndPublicPermission:]", 72, v14);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v14[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    v18 = self;
    __int16 v19 = 2080;
    v20 = "-[ICDSharingProxy fetchParticipantListAndPublicPermission:]";
    __int16 v21 = 2112;
    v22 = v8;
    __int16 v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001F398;
  v12[3] = &unk_1000447A0;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  v10 = [(ICDSharingProxy *)self fetchShareWithCompletion:v12];

  sub_10001E628(v14);

  return v10;
}

- (void)startPreparingForShareWhenForcing:(BOOL)a3
{
  memset(v8, 0, sizeof(v8));
  sub_10001E454(1, (uint64_t)"-[ICDSharingProxy startPreparingForShareWhenForcing:]", 80, v8);
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v8[0];
    uint64_t v7 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    v12 = self;
    __int16 v13 = 2080;
    v14 = "-[ICDSharingProxy startPreparingForShareWhenForcing:]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  sub_10001E628(v8);
}

- (id)fetchShareWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  memset(v29, 0, sizeof(v29));
  sub_10001E454(1, (uint64_t)"-[ICDSharingProxy fetchShareWithCompletion:]", 89, v29);
  v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v29[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    v31 = (ICDSharingProxy *)v7;
    __int16 v32 = 2112;
    v33 = self;
    __int16 v34 = 2080;
    v35 = "-[ICDSharingProxy fetchShareWithCompletion:]";
    __int16 v36 = 2112;
    v37 = v8;
    __int16 v38 = 2112;
    v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  id v9 = [(BaseSharingProxy *)self cachedShare];

  if (v9)
  {
    uint64_t v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = [(BaseSharingProxy *)self cachedShare];
      *(_DWORD *)buf = 138413058;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v19;
      __int16 v34 = 2112;
      v35 = 0;
      __int16 v36 = 2112;
      v37 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    v12 = [(BaseSharingProxy *)self cachedShare];
    v4[2](v4, v12, 0);

    __int16 v13 = 0;
  }
  else
  {
    __int16 v13 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v13);
    id v14 = objc_alloc((Class)BRShareCopyOperation);
    __int16 v15 = [(BaseSharingProxy *)self itemIdentifier];
    id v16 = [v14 initWithItemID:v15];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001FB04;
    v26[3] = &unk_1000451C0;
    v26[4] = self;
    objc_copyWeak(&v28, (id *)buf);
    v27 = v4;
    [v16 setRootShareCopyCompletionBlock:v26];
    objc_initWeak(&location, v16);
    [v13 setCancellable:1];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10001FD58;
    __int16 v23 = &unk_1000446D8;
    objc_copyWeak(&v24, &location);
    [v13 setCancellationHandler:&v20];
    __int16 v17 = [(BaseSharingProxy *)self operationQueue];
    [v17 addOperation:v16];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  sub_10001E628(v29);

  return v13;
}

- (id)fetchShareURLWithCompletion:(id)a3
{
  id v4 = a3;
  memset(v25, 0, sizeof(v25));
  sub_10001E454(1, (uint64_t)"-[ICDSharingProxy fetchShareURLWithCompletion:]", 127, v25);
  v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v25[0];
    v8 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v27 = v7;
    __int16 v28 = 2112;
    v29 = self;
    __int16 v30 = 2080;
    v31 = "-[ICDSharingProxy fetchShareURLWithCompletion:]";
    __int16 v32 = 2112;
    v33 = v8;
    __int16 v34 = 2112;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  id v9 = +[NSProgress progressWithTotalUnitCount:1];
  objc_initWeak((id *)buf, v9);
  id v10 = objc_alloc((Class)BRShareCopyShareURLOperation);
  __int16 v11 = [(BaseSharingProxy *)self itemIdentifier];
  id v12 = [v10 initWithItemID:v11];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100020108;
  v22[3] = &unk_1000451E8;
  objc_copyWeak(&v24, (id *)buf);
  v22[4] = self;
  id v13 = v4;
  id v23 = v13;
  [v12 setCopyShareURLCompletionBlock:v22];
  [v9 setCancellable:1];
  objc_initWeak(&location, v12);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10002024C;
  __int16 v19 = &unk_1000446D8;
  objc_copyWeak(&v20, &location);
  [v9 setCancellationHandler:&v16];
  id v14 = [(BaseSharingProxy *)self operationQueue];
  [v14 addOperation:v12];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
  sub_10001E628(v25);

  return v9;
}

- (id)saveShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  memset(v32, 0, sizeof(v32));
  sub_10001E454(1, (uint64_t)"-[ICDSharingProxy saveShare:completion:]", 155, v32);
  v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v32[0];
    __int16 v11 = [(BaseSharingProxy *)self itemIdentifier];
    *(_DWORD *)buf = 134219010;
    __int16 v34 = (ICDSharingProxy *)v10;
    __int16 v35 = 2112;
    __int16 v36 = self;
    __int16 v37 = 2080;
    __int16 v38 = "-[ICDSharingProxy saveShare:completion:]";
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
      v22 = +[NSError br_errorWithPOSIXCode:45];
      *(_DWORD *)buf = 138413058;
      __int16 v34 = self;
      __int16 v35 = 2112;
      __int16 v36 = 0;
      __int16 v37 = 2112;
      __int16 v38 = v22;
      __int16 v39 = 2112;
      v40 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v16 = +[NSError br_errorWithPOSIXCode:45];
    v7[2](v7, 0, v16);
    uint64_t v17 = 0;
  }
  else
  {
    [(BaseSharingProxy *)self setCachedShare:v6];
    id v18 = objc_alloc((Class)BRShareSaveOperation);
    __int16 v19 = [(BaseSharingProxy *)self fileURL];
    id v16 = [v18 initWithShare:v6 fileURL:v19];

    uint64_t v17 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v17);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100020738;
    uint64_t v29[3] = &unk_100045100;
    objc_copyWeak(&v31, (id *)buf);
    v29[4] = self;
    __int16 v30 = v7;
    [v16 setShareSaveCompletionBlock:v29];
    [v17 setCancellable:1];
    objc_initWeak(&location, v16);
    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_100020888;
    v26 = &unk_1000446D8;
    objc_copyWeak(&v27, &location);
    [v17 setCancellationHandler:&v23];
    id v20 = [(BaseSharingProxy *)self operationQueue];
    [v20 addOperation:v16];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }

  sub_10001E628(v32);

  return v17;
}

- (id)unshareWithCompletion:(id)a3
{
  id v4 = a3;
  memset(v20, 0, sizeof(v20));
  sub_10001E454(1, (uint64_t)"-[ICDSharingProxy unshareWithCompletion:]", 184, v20);
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
    v26 = "-[ICDSharingProxy unshareWithCompletion:]";
    __int16 v27 = 2112;
    __int16 v28 = v8;
    __int16 v29 = 2112;
    __int16 v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }
  id v9 = +[NSProgress progressWithTotalUnitCount:2];
  [v9 setCancellable:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100020B88;
  v17[3] = &unk_100045150;
  v17[4] = self;
  id v10 = v4;
  id v19 = v10;
  id v11 = v9;
  id v18 = v11;
  id v12 = [(ICDSharingProxy *)self fetchShareWithCompletion:v17];
  if (![v11 completedUnitCount])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021100;
    v15[3] = &unk_1000446B0;
    id v16 = v12;
    [v11 setCancellationHandler:v15];
  }
  id v13 = v11;

  sub_10001E628(v20);

  return v13;
}

- (void).cxx_destruct
{
}

@end