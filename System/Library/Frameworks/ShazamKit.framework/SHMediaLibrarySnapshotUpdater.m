@interface SHMediaLibrarySnapshotUpdater
- (SHMediaItemFetcher)mediaItemFetcher;
- (SHMediaLibrarySnapshotUpdater)init;
- (SHMediaLibrarySnapshotUpdater)initWithMediaItemFetcher:(id)a3 remoteConfiguration:(id)a4;
- (SHRemoteConfiguration)remoteConfiguration;
- (id)condition;
- (void)setMediaItemFetcher:(id)a3;
- (void)setRemoteConfiguration:(id)a3;
- (void)updateChanges:(id)a3 completionHandler:(id)a4;
- (void)updateSnapshot:(id)a3 completionHandler:(id)a4;
@end

@implementation SHMediaLibrarySnapshotUpdater

- (SHMediaLibrarySnapshotUpdater)init
{
  v3 = [[SHMediaItemFetcher alloc] initWithBundleIdentifier:@"com.apple.shazamd" clientType:1];
  v4 = +[SHRemoteConfiguration sharedInstance];
  v5 = [(SHMediaLibrarySnapshotUpdater *)self initWithMediaItemFetcher:v3 remoteConfiguration:v4];

  return v5;
}

- (SHMediaLibrarySnapshotUpdater)initWithMediaItemFetcher:(id)a3 remoteConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHMediaLibrarySnapshotUpdater;
  v9 = [(SHMediaLibrarySnapshotUpdater *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItemFetcher, a3);
    objc_storeStrong((id *)&v10->_remoteConfiguration, a4);
  }

  return v10;
}

- (id)condition
{
  return &stru_100075B98;
}

- (void)updateSnapshot:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 changes];
  id v9 = [v8 count];

  if (v9)
  {
    v10 = [v6 trackChanges];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000334AC;
    v12[3] = &unk_100075348;
    id v13 = v7;
    [(SHMediaLibrarySnapshotUpdater *)self updateChanges:v10 completionHandler:v12];
  }
  else
  {
    id v11 = objc_alloc_init((Class)SHMediaLibrarySnapshot);
    (*((void (**)(id, id, void))v7 + 2))(v7, v11, 0);
  }
}

- (void)updateChanges:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  id v7 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v14 = [(SHMediaLibrarySnapshotUpdater *)self condition];
        if (((unsigned int (**)(void, void *))v14)[2](v14, v13))
        {
          v15 = [v13 libraryItem];
          v16 = [v15 shazamKey];

          if (!v16) {
            continue;
          }
          v14 = [v13 libraryItem];
          v17 = [v14 shazamKey];
          v18 = [v17 validatedKey];
          [v7 addObject:v18];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    v19 = sh_log_object();
    v20 = v24;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [v7 count];
      *(_DWORD *)buf = 134217984;
      id v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Trying to update %li tracks", buf, 0xCu);
    }

    v22 = [(SHMediaLibrarySnapshotUpdater *)self mediaItemFetcher];
    v23 = [v7 allObjects];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100033860;
    v25[3] = &unk_100075BC0;
    id v26 = v8;
    id v27 = v24;
    [v22 mediaItemsForShazamIDs:v23 completionHandler:v25];
  }
  else
  {
    v20 = v24;
    (*((void (**)(id, void *, void))v24 + 2))(v24, &__NSArray0__struct, 0);
  }
}

- (SHMediaItemFetcher)mediaItemFetcher
{
  return self->_mediaItemFetcher;
}

- (void)setMediaItemFetcher:(id)a3
{
}

- (SHRemoteConfiguration)remoteConfiguration
{
  return self->_remoteConfiguration;
}

- (void)setRemoteConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConfiguration, 0);

  objc_storeStrong((id *)&self->_mediaItemFetcher, 0);
}

@end