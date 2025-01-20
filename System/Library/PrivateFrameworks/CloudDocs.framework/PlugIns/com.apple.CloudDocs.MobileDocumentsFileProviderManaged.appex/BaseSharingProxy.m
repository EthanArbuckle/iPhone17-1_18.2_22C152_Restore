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
    sub_100023138();
  }
}

- (id)preflightCheckIfCurrentlyShareableWithCompletion:(id)a3
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100023138();
  }

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
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = self;
    __int16 v20 = 2080;
    v21 = "-[BaseSharingProxy fetchParticipantListAndPublicPermission:]";
    __int16 v22 = 2112;
    v23 = itemIdentifier;
    __int16 v24 = 2112;
    v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000082F0;
  v11[3] = &unk_100038830;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  id v9 = [(BaseSharingProxy *)self fetchShareWithCompletion:v11];

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
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    uint64_t v8 = 0;
    __int16 v9 = 2112;
    v10 = self;
    __int16 v11 = 2080;
    id v12 = "-[BaseSharingProxy startPreparingForShareWhenForcing:]";
    __int16 v13 = 2112;
    uint64_t v14 = itemIdentifier;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  __brc_leave_section();
}

- (id)fetchShareWithCompletion:(id)a3
{
  v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100023138();
  }

  return 0;
}

- (id)fetchShareURLWithCompletion:(id)a3
{
  v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100023138();
  }

  return 0;
}

- (id)saveShare:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, id))a4;
  v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  __brc_create_section();
  __int16 v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    v33 = v29;
    __int16 v34 = 2112;
    v35 = self;
    __int16 v36 = 2080;
    v37 = "-[BaseSharingProxy saveShare:completion:]";
    __int16 v38 = 2112;
    v39 = itemIdentifier;
    __int16 v40 = 2112;
    v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  id v12 = [v7 objectForKeyedSubscript:CKShareTypeKey];
  unsigned int v13 = [v12 isEqual:_BRFolderShareType];

  if (v13)
  {
    brc_bread_crumbs();
    uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v19 = +[NSError br_errorWithPOSIXCode:45];
      *(_DWORD *)buf = 138413058;
      v33 = self;
      __int16 v34 = 2112;
      v35 = 0;
      __int16 v36 = 2112;
      v37 = v19;
      __int16 v38 = 2112;
      v39 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }
    id v16 = +[NSError br_errorWithPOSIXCode:45];
    v8[2](v8, 0, v16);
    uint64_t v17 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedShare, a3);
    id v16 = [objc_alloc((Class)BRShareSaveOperation) initWithShare:v7 fileURL:self->_fileURL];
    uint64_t v17 = +[NSProgress progressWithTotalUnitCount:1];
    objc_initWeak((id *)buf, v17);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100008B08;
    v26[3] = &unk_100038858;
    objc_copyWeak(&v28, (id *)buf);
    v26[4] = self;
    v27 = v8;
    [v16 setShareSaveCompletionBlock:v26];
    [v17 setCancellable:1];
    objc_initWeak(&location, v16);
    __int16 v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    __int16 v22 = sub_100008C60;
    v23 = &unk_100038880;
    objc_copyWeak(&v24, &location);
    [v17 setCancellationHandler:&v20];
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16, v20, v21, v22, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  __brc_leave_section();

  return v17;
}

- (id)unshareWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    itemIdentifier = self->_itemIdentifier;
    *(_DWORD *)buf = 134219010;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    v25 = self;
    __int16 v26 = 2080;
    v27 = "-[BaseSharingProxy unshareWithCompletion:]";
    __int16 v28 = 2112;
    v29 = itemIdentifier;
    __int16 v30 = 2112;
    uint64_t v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ %s %@%@", buf, 0x34u);
  }

  uint64_t v8 = +[NSProgress progressWithTotalUnitCount:2];
  [v8 setCancellable:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008F44;
  v16[3] = &unk_1000388D0;
  v16[4] = self;
  id v9 = v4;
  id v18 = v9;
  id v10 = v8;
  id v17 = v10;
  __int16 v11 = [(BaseSharingProxy *)self fetchShareWithCompletion:v16];
  if (![v10 completedUnitCount])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009484;
    v14[3] = &unk_1000387E0;
    id v15 = v11;
    [v10 setCancellationHandler:v14];
  }
  id v12 = v10;

  __brc_leave_section();

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