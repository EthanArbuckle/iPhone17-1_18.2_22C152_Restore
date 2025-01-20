@interface SHMediaLibraryController
- (BOOL)_synchronizeLocalSnapshot:(id)a3 error:(id *)a4;
- (NSString)syncID;
- (SHLShazamLibrary)remoteLibrary;
- (SHMediaLibraryContext)currentContext;
- (SHMediaLibraryController)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4;
- (SHMediaLibraryController)initWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6;
- (SHMediaLibraryDataStore)dataStore;
- (SHMediaLibraryInfoFetcher)libraryInfoFetcher;
- (SHMediaLibrarySnapshot)currentSnapshot;
- (SHMediaLibrarySnapshot)syncSnapshot;
- (SHMediaLibrarySnapshotUpdater)snapshotUpdater;
- (SHMediaLibrarySyncDelegate)delegate;
- (id)mapInternalLibraryErrorToMediaLibrary:(id)a3 keyOverrides:(id)a4;
- (id)shazamLibrarySyncStartConditionForMediaLibraryStartCondition:(id)a3;
- (id)unsyncedGroupChangeset;
- (id)unsyncedTrackChangeset;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)beginLibrarySync;
- (void)commonInitWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6;
- (void)failedToSyncContext:(id)a3;
- (void)finishLibrarySync;
- (void)handleLibraryError:(id)a3 failedItemIdentifiers:(id)a4;
- (void)library:(id)a3 didChangeGroups:(id)a4 syncAction:(int64_t)a5;
- (void)library:(id)a3 didChangeTracks:(id)a4 syncAction:(int64_t)a5;
- (void)library:(id)a3 didCompleteSyncWithCompletionHandler:(id)a4;
- (void)library:(id)a3 didDeleteItemsWithIdentifiers:(id)a4 syncAction:(int64_t)a5;
- (void)library:(id)a3 didProduceError:(id)a4 withFailedItemIdentifiers:(id)a5 syncAction:(int64_t)a6;
- (void)libraryDataStore:(id)a3 didUpdateWithChange:(id)a4;
- (void)libraryWillBeginSync:(id)a3;
- (void)persistChangesAndCompleteSyncWithCompletionHandler:(id)a3;
- (void)removeInvalidChangesFromSnapshot:(id)a3;
- (void)resetDataIfNeededForSyncError:(id)a3;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLibraryInfoFetcher:(id)a3;
- (void)setRemoteLibrary:(id)a3;
- (void)setSnapshotUpdater:(id)a3;
- (void)setSyncID:(id)a3;
- (void)setSyncSnapshot:(id)a3;
- (void)synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4;
- (void)synchronizeWithContext:(id)a3;
@end

@implementation SHMediaLibraryController

- (SHMediaLibraryController)initWithBundleIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SHMediaLibraryController;
  v6 = [(SHMediaLibraryController *)&v12 init];
  if (v6)
  {
    v7 = [[SHMediaLibraryDataStore alloc] initWithStoreType:1];
    v8 = objc_alloc_init(SHMediaLibraryInfoFetcher);
    v9 = [[SHLShazamLibrary alloc] initWithCallingProcessIdentifier:v5];
    v10 = objc_alloc_init(SHMediaLibrarySnapshotUpdater);
    [(SHMediaLibraryController *)v6 commonInitWithDataStore:v7 remoteLibrary:v9 libraryInfoFetcher:v8 snapshotUpdater:v10];
  }
  return v6;
}

- (SHMediaLibraryController)initWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SHMediaLibraryController;
  v14 = [(SHMediaLibraryController *)&v17 init];
  v15 = v14;
  if (v14) {
    [(SHMediaLibraryController *)v14 commonInitWithDataStore:v10 remoteLibrary:v11 libraryInfoFetcher:v12 snapshotUpdater:v13];
  }

  return v15;
}

- (void)commonInitWithDataStore:(id)a3 remoteLibrary:(id)a4 libraryInfoFetcher:(id)a5 snapshotUpdater:(id)a6
{
  id v10 = (SHMediaLibraryDataStore *)a3;
  id v11 = (SHLShazamLibrary *)a4;
  id v12 = (SHMediaLibraryInfoFetcher *)a5;
  id v13 = (SHMediaLibrarySnapshotUpdater *)a6;
  dataStore = self->_dataStore;
  self->_dataStore = v10;
  v20 = v10;

  [(SHMediaLibraryDataStore *)self->_dataStore setDelegate:self];
  remoteLibrary = self->_remoteLibrary;
  self->_remoteLibrary = v11;
  v16 = v11;

  [(SHLShazamLibrary *)self->_remoteLibrary setDelegate:self];
  libraryInfoFetcher = self->_libraryInfoFetcher;
  self->_libraryInfoFetcher = v12;
  v18 = v12;

  snapshotUpdater = self->_snapshotUpdater;
  self->_snapshotUpdater = v13;
}

- (void)synchronizeWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];
  [(SHMediaLibraryController *)self setSyncID:v6];

  [(SHMediaLibraryController *)self setCurrentContext:v4];
  id v7 = objc_alloc_init((Class)SHMediaLibrarySnapshot);
  [(SHMediaLibraryController *)self setCurrentSnapshot:v7];

  v8 = sh_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(SHMediaLibraryController *)self syncID];
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Media Library started syncing. Sync ID: %@", buf, 0xCu);
  }
  id v10 = [(SHMediaLibraryController *)self dataStore];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to start sync, missing data store", buf, 2u);
    }

    [(SHMediaLibraryController *)self failedToSyncContext:v4];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v12 = [(SHMediaLibraryController *)self snapshotUpdater];
    id v13 = [v4 snapshot];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000201F4;
    v15[3] = &unk_100075590;
    id v16 = v4;
    objc_copyWeak(&v17, (id *)buf);
    [v12 updateSnapshot:v13 completionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaLibraryController *)self libraryInfoFetcher];
  [v5 fetchLibraryInfoWithCompletionHandler:v4];
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(SHMediaLibraryController *)self libraryInfoFetcher];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100020514;
  v11[3] = &unk_100075630;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 fetchLibraryInfoWithCompletionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)_synchronizeLocalSnapshot:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = [v4 changes];
  v45 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);

  id v7 = [v4 changes];
  v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v43 = v4;
  id v9 = [v4 changes];
  id v10 = [v9 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v58;
    uint64_t v44 = *(void *)v58;
    do
    {
      id v13 = 0;
      id v46 = v11;
      do
      {
        if (*(void *)v58 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v13);
        v15 = (char *)[v14 changeType];
        if ((unint64_t)(v15 - 1) >= 2)
        {
          if (v15 != (char *)3) {
            goto LABEL_21;
          }
          v28 = [v14 libraryItem];
          v29 = [v28 identifier];
          [v8 addObject:v29];

          goto LABEL_20;
        }
        id v16 = [v14 libraryItem];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v18 = v9;
          v19 = v8;
          v20 = [v14 libraryItem];
          [v45 addObject:v20];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v54 = 0u;
          long long v53 = 0u;
          v21 = [v20 tracksToSave];
          id v22 = [v21 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v54;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v54 != v24) {
                  objc_enumerationMutation(v21);
                }
                [v5 addObject:*(void *)(*((void *)&v53 + 1) + 8 * i)];
              }
              id v23 = [v21 countByEnumeratingWithState:&v53 objects:v63 count:16];
            }
            while (v23);
          }

          v8 = v19;
          id v9 = v18;
          uint64_t v12 = v44;
          id v11 = v46;
        }
        v26 = [v14 libraryItem];
        objc_opt_class();
        char v27 = objc_opt_isKindOfClass();

        if (v27)
        {
          v28 = [v14 libraryItem];
          [v5 addObject:v28];
LABEL_20:
        }
LABEL_21:
        id v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [v9 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v11);
  }

  v30 = sh_log_object();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [(SHMediaLibraryController *)self syncID];
    *(_DWORD *)buf = 138412290;
    v62 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[Local] Media Library sync starts. Sync ID: %@", buf, 0xCu);
  }
  if ([v45 count])
  {
    v32 = [(SHMediaLibraryController *)self dataStore];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000211E4;
    v51[3] = &unk_1000755B8;
    id v52 = v45;
    [v32 persistLibraryGroups:v52 completionHandler:v51];
  }
  if ([v5 count])
  {
    v33 = [(SHMediaLibraryController *)self dataStore];
    v34 = [v5 allObjects];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000212B4;
    v49[3] = &unk_1000755B8;
    id v50 = v5;
    [v33 persistUpdatedTracks:v34 completionHandler:v49];
  }
  if ([v8 count])
  {
    v35 = [(SHMediaLibraryController *)self dataStore];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100021384;
    v47[3] = &unk_100075658;
    id v48 = v8;
    [v35 deleteItemsByIdentifiers:v48 completionHandler:v47];
  }
  v36 = sh_log_object();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = [(SHMediaLibraryController *)self syncID];
    *(_DWORD *)buf = 138412290;
    v62 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[Local] Media Library completed sync. Sync ID: %@", buf, 0xCu);
  }
  v38 = [(SHMediaLibraryController *)self dataStore];
  unsigned __int8 v39 = [v38 commitChangesWithError:a4];

  return v39;
}

- (void)synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(SHMediaLibraryController *)self libraryInfoFetcher];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021570;
  v11[3] = &unk_100075680;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 fetchLibraryInfoWithCompletionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_synchronizeRemoteSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v42 = a4;
  id v7 = objc_alloc_init(SHLLibraryChangeset);
  v8 = [(SHMediaLibraryController *)self unsyncedGroupChangeset];
  [(SHLLibraryChangeset *)v7 mergeChangeset:v8];

  v41 = self;
  id v9 = [(SHMediaLibraryController *)self unsyncedTrackChangeset];
  [(SHLLibraryChangeset *)v7 mergeChangeset:v9];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v43 = v6;
  id v10 = [v6 changes];
  id v11 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v45;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v16 = (char *)[v15 changeType];
        if ((unint64_t)(v16 - 1) >= 2)
        {
          if (v16 == (char *)3)
          {
            char v27 = [v15 libraryItem];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v29 = [SHLLibraryTrack alloc];
              v30 = [v15 libraryItem];
              v31 = [v30 identifier];
              v32 = [(SHLLibraryTrack *)v29 initWithIdentifier:v31];

              v49 = v32;
              v33 = +[NSArray arrayWithObjects:&v49 count:1];
              [(SHLLibraryChangeset *)v7 deleteTracks:v33];
            }
            v34 = [v15 libraryItem];
            objc_opt_class();
            char v35 = objc_opt_isKindOfClass();

            if (v35)
            {
              v36 = [SHLLibraryGroup alloc];
              v37 = [v15 libraryItem];
              v38 = [v37 identifier];
              v25 = [(SHLLibraryGroup *)v36 initWithIdentifier:v38];

              id v48 = v25;
              v26 = +[NSArray arrayWithObjects:&v48 count:1];
              [(SHLLibraryChangeset *)v7 deleteGroups:v26];
LABEL_19:

LABEL_20:
              continue;
            }
          }
        }
        else
        {
          id v17 = [v15 libraryItem];
          objc_opt_class();
          char v18 = objc_opt_isKindOfClass();

          if (v18)
          {
            v19 = [v15 libraryItem];
            v20 = +[SHMediaLibraryItemMapper shazamLibraryTrackFromLibraryTrack:v19];

            if (v20)
            {
              v51 = v20;
              v21 = +[NSArray arrayWithObjects:&v51 count:1];
              [(SHLLibraryChangeset *)v7 addTracks:v21];
            }
          }
          id v22 = [v15 libraryItem];
          objc_opt_class();
          char v23 = objc_opt_isKindOfClass();

          if (v23)
          {
            uint64_t v24 = [v15 libraryItem];
            v25 = +[SHMediaLibraryItemMapper shazamLibraryGroupFromLibraryGroup:v24];

            if (v25)
            {
              id v50 = v25;
              v26 = +[NSArray arrayWithObjects:&v50 count:1];
              [(SHLLibraryChangeset *)v7 addGroups:v26];
              goto LABEL_19;
            }
            goto LABEL_20;
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v12);
  }

  unsigned __int8 v39 = [(SHMediaLibraryController *)v41 shazamLibrarySyncStartConditionForMediaLibraryStartCondition:v42];
  v40 = [(SHMediaLibraryController *)v41 remoteLibrary];
  [v40 synchronizeChanges:v7 startCondition:v39];
}

- (id)unsyncedGroupChangeset
{
  v2 = [(SHMediaLibraryController *)self dataStore];
  v3 = [v2 fetchAllUploadableGroupsMissingLibrarySyncMetadata];

  id v4 = objc_alloc_init(SHLLibraryChangeset);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[SHMediaLibraryItemMapper shazamLibraryGroupFromLibraryGroup:](SHMediaLibraryItemMapper, "shazamLibraryGroupFromLibraryGroup:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        id v11 = (void *)v10;
        if (v10)
        {
          uint64_t v18 = v10;
          id v12 = +[NSArray arrayWithObjects:&v18 count:1];
          [(SHLLibraryChangeset *)v4 addGroups:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)unsyncedTrackChangeset
{
  v3 = objc_alloc_init(SHLLibraryChangeset);
  id v4 = [(SHMediaLibraryController *)self dataStore];
  id v5 = [v4 fetchAllUploadableTracksMissingLibrarySyncMetadata];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[SHMediaLibraryItemMapper shazamLibraryTrackFromLibraryTrack:](SHMediaLibraryItemMapper, "shazamLibraryTrackFromLibraryTrack:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        id v12 = (void *)v11;
        if (v11)
        {
          uint64_t v19 = v11;
          uint64_t v13 = +[NSArray arrayWithObjects:&v19 count:1];
          [(SHLLibraryChangeset *)v3 addTracks:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)shazamLibrarySyncStartConditionForMediaLibraryStartCondition:(id)a3
{
  id v3 = a3;
  id v4 = &off_100075C40;
  if (([v3 isEqualToString:SHMediaLibrarySyncStartConditionUserAction] & 1) == 0)
  {
    if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionInitialFetch])
    {
      id v4 = &off_100075C30;
    }
    else if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionInitialUpload])
    {
      id v4 = &off_100075C38;
    }
    else if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionRemotePush])
    {
      id v4 = &off_100075C48;
    }
    else if ([v3 isEqualToString:SHMediaLibrarySyncStartConditionMigration])
    {
      id v4 = &off_100075C50;
    }
  }
  id v5 = *v4;

  return v5;
}

- (void)libraryWillBeginSync:(id)a3
{
  [(SHMediaLibraryController *)self beginLibrarySync];
  id v4 = objc_alloc_init((Class)SHMediaLibrarySnapshot);
  [(SHMediaLibraryController *)self setSyncSnapshot:v4];
}

- (void)library:(id)a3 didChangeTracks:(id)a4 syncAction:(int64_t)a5
{
  id v6 = a4;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[SHMediaLibraryItemMapper libraryTrackFromShazamLibraryTrack:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v10);
  }

  long long v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  if (a5)
  {
    if (a5 != 1) {
      goto LABEL_29;
    }
    v38 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
    long long v15 = [(SHMediaLibraryController *)self dataStore];
    long long v16 = [v15 updateReportForLibraryTrack:v7];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v37 = v16;
    long long v17 = [v16 missingFromLocalStoreTracks];
    id v18 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v47;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
          char v23 = [(SHMediaLibraryController *)self currentSnapshot];
          unsigned __int8 v24 = [v23 containsLibraryItem:v22];

          if ((v24 & 1) == 0)
          {
            id v25 = [objc_alloc((Class)SHMediaLibraryChange) initWithLibraryItem:v22 changeType:1];
            [v38 addObject:v25];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v19);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v26 = [v37 locallyFoundTracks];
    id v27 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (k = 0; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)k) updatedTrack];
          [v14 addObject:v31];
        }
        id v28 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v28);
    }

    v32 = [(SHMediaLibraryController *)self syncSnapshot];
    id v33 = v38;
    id v34 = [v38 copy];
    [v32 addChanges:v34];
  }
  else
  {
    id v33 = [v7 copy];
    [v14 addObjectsFromArray:v33];
  }

LABEL_29:
  if ([v14 count])
  {
    char v35 = [(SHMediaLibraryController *)self dataStore];
    id v36 = [v14 copy];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000224AC;
    v40[3] = &unk_1000755B8;
    id v41 = v14;
    [v35 persistUpdatedTracks:v36 completionHandler:v40];
  }
}

- (void)library:(id)a3 didChangeGroups:(id)a4 syncAction:(int64_t)a5
{
  id v19 = self;
  id v6 = a4;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[SHMediaLibraryItemMapper libraryGroupFromShazamLibraryGroup:](SHMediaLibraryItemMapper, "libraryGroupFromShazamLibraryGroup:", *(void *)(*((void *)&v22 + 1) + 8 * (void)v12), v19);
        if (a5 != 1
          || ([(SHMediaLibraryController *)v19 currentSnapshot],
              long long v14 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v15 = [v14 containsLibraryItem:v13],
              v14,
              (v15 & 1) == 0))
        {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  long long v16 = v8;

  long long v17 = [(SHMediaLibraryController *)v19 dataStore];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100022778;
  v20[3] = &unk_1000755B8;
  id v21 = v7;
  id v18 = v7;
  [v17 persistLibraryGroups:v18 completionHandler:v20];
}

- (void)library:(id)a3 didDeleteItemsWithIdentifiers:(id)a4 syncAction:(int64_t)a5
{
  id v6 = a4;
  id v7 = [(SHMediaLibraryController *)self dataStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000228F8;
  v9[3] = &unk_100075658;
  id v10 = v6;
  id v8 = v6;
  [v7 deleteItemsByIdentifiers:v8 completionHandler:v9];
}

- (void)library:(id)a3 didProduceError:(id)a4 withFailedItemIdentifiers:(id)a5 syncAction:(int64_t)a6
{
}

- (void)library:(id)a3 didCompleteSyncWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHMediaLibraryController *)self syncSnapshot];
  id v9 = [v8 copy];

  [(SHMediaLibraryController *)self setSyncSnapshot:0];
  objc_initWeak(&location, self);
  id v10 = [(SHMediaLibraryController *)self snapshotUpdater];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022B28;
  v13[3] = &unk_1000756A8;
  id v11 = v9;
  id v14 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v7;
  id v15 = v12;
  [v10 updateSnapshot:v11 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)beginLibrarySync
{
  id v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SHMediaLibraryController *)self syncID];
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Remote] Media Library sync starts. Sync ID: %@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = [(SHMediaLibraryController *)self currentContext];
  id v6 = [v5 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SHMediaLibraryController *)self currentContext];
    id v9 = [v8 delegate];
    [v9 _libraryWillBeginSync:self];
  }
}

- (void)persistChangesAndCompleteSyncWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(SHMediaLibraryController *)self dataStore];
  id v26 = 0;
  id v6 = [v5 commitChangesWithError:&v26];
  id v7 = v26;

  if (v7)
  {
    id v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to persist sync changes with error: %@", buf, 0xCu);
    }
  }
  if (v4) {
    v4[2](v4, v6);
  }
  id v9 = [(SHMediaLibraryController *)self currentContext];
  int v10 = [v9 error];
  [(SHMediaLibraryController *)self resetDataIfNeededForSyncError:v10];

  id v11 = [(SHMediaLibraryController *)self currentSnapshot];
  LODWORD(v10) = [v11 hasChanges];

  if (v10)
  {
    id v12 = [(SHMediaLibraryController *)self currentSnapshot];
    id v13 = [v12 copy];

    id v14 = [(SHMediaLibraryController *)self currentContext];
    id v15 = [v14 delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      long long v17 = [(SHMediaLibraryController *)self currentContext];
      id v18 = [v17 delegate];
      [v18 _library:self didChangeWithSnapshot:v13];
    }
  }
  id v19 = [(SHMediaLibraryController *)self currentContext];
  uint64_t v20 = [v19 delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    long long v22 = [(SHMediaLibraryController *)self currentContext];
    long long v23 = [v22 delegate];
    [v23 _libraryDidCompleteSync:self];
  }
  long long v24 = sh_log_object();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    long long v25 = [(SHMediaLibraryController *)self syncID];
    *(_DWORD *)buf = 138412290;
    id v28 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Remote] Media Library completed sync. Sync ID: %@", buf, 0xCu);
  }
  [(SHMediaLibraryController *)self finishLibrarySync];
}

- (void)handleLibraryError:(id)a3 failedItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sh_log_object();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Media Library sync error: %@. Failed item identifiers: %@", (uint8_t *)&v19, 0x16u);
  }

  id v9 = [(SHMediaLibraryController *)self mapInternalLibraryErrorToMediaLibrary:v6 keyOverrides:0];
  int v10 = [(SHMediaLibraryController *)self currentContext];
  [v10 setError:v9];

  id v11 = [(SHMediaLibraryController *)self currentContext];
  id v12 = [v11 delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [(SHMediaLibraryController *)self currentContext];
    id v15 = [v14 delegate];
    char v16 = [(SHMediaLibraryController *)self currentContext];
    long long v17 = [v16 error];
    id v18 = [v7 copy];
    [v15 _library:self didProduceError:v17 failedItemIdentifiers:v18];
  }
}

- (void)resetDataIfNeededForSyncError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = [v4 domain];
    unsigned int v6 = [v5 isEqualToString:SHMediaLibraryErrorDomain];

    if (v6)
    {
      id v7 = [v9 code];
      if (v7 != (id)201)
      {
        if (v7 == (id)402)
        {
          id v8 = [(SHMediaLibraryController *)self dataStore];
          [v8 deleteAllItems];
          goto LABEL_8;
        }
        if (v7 != (id)401) {
          goto LABEL_9;
        }
      }
      id v8 = [(SHMediaLibraryController *)self dataStore];
      [v8 deleteAllSyncMetadataItems];
LABEL_8:
    }
  }
LABEL_9:

  _objc_release_x1();
}

- (id)mapInternalLibraryErrorToMediaLibrary:(id)a3 keyOverrides:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 domain];
  unsigned __int8 v8 = [v7 isEqualToString:@"com.shazam.library"];

  if (v8)
  {
    unint64_t v9 = (unint64_t)[v5 code];
    if (v9 > 8) {
      uint64_t v10 = 301;
    }
    else {
      uint64_t v10 = qword_100059708[v9];
    }
    id v12 = [v5 domain];
    char v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, [v5 code], 0);

    id v14 = +[NSMutableDictionary dictionary];
    id v15 = [v5 localizedDescription];
    [v14 setValue:v15 forKey:NSDebugDescriptionErrorKey];

    [v14 setValue:v13 forKey:NSUnderlyingErrorKey];
    if (v6) {
      [v14 addEntriesFromDictionary:v6];
    }
    uint64_t v16 = SHMediaLibraryErrorDomain;
    id v17 = [v14 copy];
    id v11 = +[NSError errorWithDomain:v16 code:v10 userInfo:v17];
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (void)finishLibrarySync
{
  id v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SHMediaLibraryController *)self syncID];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Media Library finished syncing. Sync ID: %@", (uint8_t *)&v5, 0xCu);
  }
  [(SHMediaLibraryController *)self setSyncID:0];
  [(SHMediaLibraryController *)self setCurrentContext:0];
  [(SHMediaLibraryController *)self setCurrentSnapshot:0];
}

- (void)failedToSyncContext:(id)a3
{
  uint64_t v4 = SHMediaLibraryErrorDomain;
  NSErrorUserInfoKey v10 = NSDebugDescriptionErrorKey;
  CFStringRef v11 = @"Failed to synchronize library. Try again later.";
  id v5 = a3;
  id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v7 = +[NSError errorWithDomain:v4 code:500 userInfo:v6];

  unsigned __int8 v8 = [v5 snapshot];

  unint64_t v9 = [v8 allItemIdentifiers];
  [(SHMediaLibraryController *)self handleLibraryError:v7 failedItemIdentifiers:v9];

  [(SHMediaLibraryController *)self finishLibrarySync];
}

- (void)removeInvalidChangesFromSnapshot:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100023904;
  v10[3] = &unk_1000756D0;
  objc_copyWeak(&v11, &location);
  id v5 = +[NSPredicate predicateWithBlock:v10];
  id v6 = [v4 filteredSnapshotUsingPredicate:v5];
  if ([v6 hasChanges])
  {
    NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
    CFStringRef v14 = @"Items with invalid Shazam IDs are not supported.";
    id v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    unsigned __int8 v8 = +[NSError errorWithDomain:SHMediaLibraryErrorDomain code:500 userInfo:v7];

    unint64_t v9 = [v6 allItemIdentifiers];
    [(SHMediaLibraryController *)self handleLibraryError:v8 failedItemIdentifiers:v9];
  }
  [v4 removeSnapshot:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)libraryDataStore:(id)a3 didUpdateWithChange:(id)a4
{
  id v5 = a4;
  id v6 = [(SHMediaLibraryController *)self currentSnapshot];
  id v8 = v5;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];

  [v6 addChanges:v7];
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NSException raise:NSInternalInconsistencyException, @"%@ is not supported by shazamd, please use synchronizeWithContext:", v4 format];
}

- (SHMediaLibrarySyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHMediaLibrarySyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHLShazamLibrary)remoteLibrary
{
  return self->_remoteLibrary;
}

- (void)setRemoteLibrary:(id)a3
{
}

- (SHMediaLibraryDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (SHMediaLibraryInfoFetcher)libraryInfoFetcher
{
  return self->_libraryInfoFetcher;
}

- (void)setLibraryInfoFetcher:(id)a3
{
}

- (SHMediaLibrarySnapshotUpdater)snapshotUpdater
{
  return self->_snapshotUpdater;
}

- (void)setSnapshotUpdater:(id)a3
{
}

- (SHMediaLibrarySnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (SHMediaLibrarySnapshot)syncSnapshot
{
  return self->_syncSnapshot;
}

- (void)setSyncSnapshot:(id)a3
{
}

- (SHMediaLibraryContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_syncSnapshot, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_snapshotUpdater, 0);
  objc_storeStrong((id *)&self->_libraryInfoFetcher, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_remoteLibrary, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end