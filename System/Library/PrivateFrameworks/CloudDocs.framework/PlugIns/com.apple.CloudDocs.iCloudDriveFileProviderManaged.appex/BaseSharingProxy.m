@interface BaseSharingProxy
- (BaseSharingProxy)initWithItemIdentifier:(id)a3 fileURL:(id)a4 operationQueue:(id)a5;
- (CKShare)cachedShare;
- (NSOperationQueue)operationQueue;
- (NSString)itemIdentifier;
- (NSURL)fileURL;
- (id)fetchParticipantListAndPublicPermission:(id)a3;
- (id)fetchShareURLWithCompletion:(id)a3;
- (id)fetchShareWithCompletion:(id)a3;
- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3;
- (id)saveShare:(id)a3 completion:(id)a4;
- (id)unshareWithCompletion:(id)a3;
- (void)fetchSharingInfo:(id)a3;
- (void)setCachedShare:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)startPreparingForShareWhenForcing:(BOOL)a3;
@end

@implementation BaseSharingProxy

- (BaseSharingProxy)initWithItemIdentifier:(id)a3 fileURL:(id)a4 operationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BaseSharingProxy;
  v10 = [(BaseSharingProxy *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_itemIdentifier, a3);
    objc_storeStrong((id *)&v11->_operationQueue, a5);
  }

  return v11;
}

- (void)fetchSharingInfo:(id)a3
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002BC74();
  }
}

- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002BC74();
  }

  return 0;
}

- (id)fetchParticipantListAndPublicPermission:(id)a3
{
  id v4 = a3;
  memset(v13, 0, sizeof(v13));
  sub_10001E454(1, (uint64_t)"-[BaseSharingProxy fetchParticipantListAndPublicPermission:]", 68, v13);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    uint64_t v15 = v13[0];
    __int16 v16 = 2112;
    v17 = self;
    __int16 v18 = 2080;
    v19 = "-[BaseSharingProxy fetchParticipantListAndPublicPermission:]";
    __int16 v20 = 2112;
    v21 = itemIdentifier;
    __int16 v22 = 2112;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001CBF0;
  v11[3] = &unk_1000447A0;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  id v9 = [(BaseSharingProxy *)self fetchShareWithCompletion:v11];

  sub_10001E628(v13);

  return v9;
}

- (void)startPreparingForShareWhenForcing:(BOOL)a3
{
  memset(v7, 0, sizeof(v7));
  sub_10001E454(1, (uint64_t)"-[BaseSharingProxy startPreparingForShareWhenForcing:]", 76, v7);
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    uint64_t v9 = v7[0];
    __int16 v10 = 2112;
    v11 = self;
    __int16 v12 = 2080;
    objc_super v13 = "-[BaseSharingProxy startPreparingForShareWhenForcing:]";
    __int16 v14 = 2112;
    uint64_t v15 = itemIdentifier;
    __int16 v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  sub_10001E628(v7);
}

- (id)fetchShareWithCompletion:(id)a3
{
  v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002BC74();
  }

  return 0;
}

- (id)fetchShareURLWithCompletion:(id)a3
{
  v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10002BC74();
  }

  return 0;
}

- (id)saveShare:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  memset(v29, 0, sizeof(v29));
  sub_10001E454(1, (uint64_t)"-[BaseSharingProxy saveShare:completion:]", 98, v29);
  uint64_t v9 = brc_bread_crumbs();
  __int16 v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    v31 = (BaseSharingProxy *)v29[0];
    __int16 v32 = 2112;
    v33 = self;
    __int16 v34 = 2080;
    v35 = "-[BaseSharingProxy saveShare:completion:]";
    __int16 v36 = 2112;
    v37 = itemIdentifier;
    __int16 v38 = 2112;
    v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  __int16 v12 = [v7 objectForKeyedSubscript:CKShareTypeKey];
  unsigned int v13 = [v12 isEqual:_BRFolderShareType];

  if (v13)
  {
    brc_bread_crumbs();
    __int16 v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v19 = +[NSError br_errorWithPOSIXCode:45];
      *(_DWORD *)buf = 138413058;
      v31 = self;
      __int16 v32 = 2112;
      v33 = 0;
      __int16 v34 = 2112;
      v35 = v19;
      __int16 v36 = 2112;
      v37 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v16 = +[NSError br_errorWithPOSIXCode:45];
    v8[2](v8, 0, v16);
    v17 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedShare, a3);
    id v16 = [objc_alloc((Class)BRShareSaveOperation) initWithShare:v7 fileURL:self->_fileURL];
    v17 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v17);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001D408;
    v26[3] = &unk_100045100;
    objc_copyWeak(&v28, (id *)buf);
    v26[4] = self;
    v27 = v8;
    [v16 setShareSaveCompletionBlock:v26];
    [v17 setCancellable:1];
    objc_initWeak(&location, v16);
    __int16 v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    __int16 v22 = sub_10001D560;
    v23 = &unk_1000446D8;
    objc_copyWeak(&v24, &location);
    [v17 setCancellationHandler:&v20];
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16, v20, v21, v22, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  sub_10001E628(v29);

  return v17;
}

- (id)unshareWithCompletion:(id)a3
{
  id v4 = a3;
  memset(v19, 0, sizeof(v19));
  sub_10001E454(1, (uint64_t)"-[BaseSharingProxy unshareWithCompletion:]", 127, v19);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    uint64_t v21 = v19[0];
    __int16 v22 = 2112;
    v23 = self;
    __int16 v24 = 2080;
    v25 = "-[BaseSharingProxy unshareWithCompletion:]";
    __int16 v26 = 2112;
    v27 = itemIdentifier;
    __int16 v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  id v8 = +[NSProgress progressWithTotalUnitCount:2];
  [v8 setCancellable:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001D844;
  v16[3] = &unk_100045150;
  v16[4] = self;
  id v9 = v4;
  id v18 = v9;
  id v10 = v8;
  id v17 = v10;
  v11 = [(BaseSharingProxy *)self fetchShareWithCompletion:v16];
  if (![v10 completedUnitCount])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001DD84;
    v14[3] = &unk_1000446B0;
    id v15 = v11;
    [v10 setCancellationHandler:v14];
  }
  id v12 = v10;

  sub_10001E628(v19);

  return v12;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (CKShare)cachedShare
{
  return self->_cachedShare;
}

- (void)setCachedShare:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedShare, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end