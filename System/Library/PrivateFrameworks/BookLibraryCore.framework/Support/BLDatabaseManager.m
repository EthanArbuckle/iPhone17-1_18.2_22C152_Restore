@interface BLDatabaseManager
- (BLDatabaseManager)init;
- (BLDatabaseManager)initWithDatabaseFolderBaseURL:(id)a3;
- (BOOL)_modelChanged;
- (BOOL)canResumeDownloadWithState:(int64_t)a3;
- (BUOSStateHandler)osStateHandler;
- (NSManagedObjectContext)moc;
- (NSManagedObjectModel)mom;
- (NSPersistentStoreCoordinator)psc;
- (NSURL)persistentStoreURL;
- (id)_setupPersistentStore:(BOOL)a3;
- (id)_stateForLog;
- (id)_stateForLogWithTimeout:(double)a3;
- (id)mq_newDownloadPolicyFromDownloadPolicyInfo:(id)a3;
- (id)mq_newInMemoryDownloadFromDownloadInfo:(id)a3;
- (id)mq_writeArtworkWithURL:(id)a3 downloadID:(id)a4;
- (id)mq_writeMetadata:(id)a3 clientIdentifier:(id)a4 downloadID:(id)a5;
- (id)mq_writeSinf:(id)a3 downloadID:(id)a4;
- (void)_deleteDownloadPolicyWithID:(id)a3 save:(BOOL)a4 completion:(id)a5;
- (void)_fetchDownloadInfoEntityWithID:(id)a3 block:(id)a4;
- (void)_fetchDownloadInfoEntityWithID:(id)a3 sync:(BOOL)a4 block:(id)a5;
- (void)_fetchDownloadPoliciesWithPredicate:(id)a3 block:(id)a4;
- (void)_fetchDownloadPolicyInfoEntityWithID:(id)a3 relatedPolicyWithStorePlaylistIdentifier:(id)a4 block:(id)a5;
- (void)_fetchDownloadsWithIDs:(id)a3 block:(id)a4;
- (void)_fetchDownloadsWithPredicate:(id)a3 block:(id)a4;
- (void)_fetchDownloadsWithPredicate:(id)a3 sync:(BOOL)a4 block:(id)a5;
- (void)addDownloadWithBuyParameters:(id)a3 storeID:(id)a4 clientIdentifier:(id)a5 completion:(id)a6;
- (void)addDownloadWithPermlink:(id)a3 clientIdentifier:(id)a4 completion:(id)a5;
- (void)cancelDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)deleteDownloadPolicyWithID:(id)a3 completion:(id)a4;
- (void)deleteDownloadWithID:(id)a3 completion:(id)a4;
- (void)fetchDownloadFromDownloadID:(id)a3 withCompletion:(id)a4;
- (void)fetchDownloadListWithCompletion:(id)a3;
- (void)fetchDownloadListWithPredicate:(id)a3 completion:(id)a4;
- (void)fetchDownloadListWithPredicate:(id)a3 sync:(BOOL)a4 completion:(id)a5;
- (void)fetchDownloadPolicyWithID:(id)a3 withCompletion:(id)a4;
- (void)fetchListOfAllDownloadCandidatesWithCompletion:(id)a3;
- (void)fetchListOfAllDownloadPoliciesWithCompletion:(id)a3;
- (void)fetchListOfFailedDownloadsWithCompletion:(id)a3;
- (void)fetchListOfPendingDownloadsSortedByStartTime:(id)a3;
- (void)fetchModifiableDownloadsMatchingPredicate:(id)a3 results:(id)a4 completion:(id)a5;
- (void)finalizeOrCanceAndCleanupWithDownloadID:(id)a3 cleanupBlock:(id)a4 completion:(id)a5;
- (void)pauseDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)pauseDownloadsWithIDs:(id)a3 withCompletion:(id)a4;
- (void)purgeAllStaleDownloadsWithCompletion:(id)a3;
- (void)requestDownloadWithParameters:(id)a3 completion:(id)a4;
- (void)resumeDownloadWithID:(id)a3 withCompletion:(id)a4;
- (void)resumeDownloadsWithID:(id)a3 withCompletion:(id)a4;
- (void)saveDownloadPathWithId:(id)a3 path:(id)a4 completion:(id)a5;
- (void)saveDownloadSizeWithId:(id)a3 size:(unint64_t)a4 completion:(id)a5;
- (void)saveDownloadStateWithId:(id)a3 state:(int64_t)a4 completion:(id)a5;
- (void)saveIsLocalCacheServerWithId:(id)a3 isLocal:(BOOL)a4 completion:(id)a5;
- (void)saveOrUpdateDownloadPolicy:(id)a3 completion:(id)a4;
- (void)setMoc:(id)a3;
- (void)setMom:(id)a3;
- (void)setOsStateHandler:(id)a3;
- (void)setPsc:(id)a3;
- (void)syncSaveDownloadStateWithId:(id)a3 state:(int64_t)a4;
- (void)syncTouchDownloadWithId:(id)a3;
- (void)updateAllInterruptedDownloadsToTheirProperStatesWithCompletion:(id)a3;
- (void)updateDownloadWithID:(id)a3 updateBlock:(id)a4 completion:(id)a5;
@end

@implementation BLDatabaseManager

- (void)fetchDownloadListWithCompletion:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005294;
  v7[3] = &unk_1001A1430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSManagedObjectContext *)moc performBlock:v7];
}

- (BLDatabaseManager)init
{
  v3 = +[IMLibraryPlist sharedContainerURL];
  if (!v3)
  {
    id v4 = BLServiceDatabaseManagerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      CFStringRef v8 = @"/var/mobile/Media/Books/Downloads/Database/";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[Database]: System could not produce a shared container. Falling back to using: %@.  Please file a radar.", (uint8_t *)&v7, 0xCu);
    }

    v3 = +[NSURL fileURLWithPath:@"/var/mobile/Media/Books/Downloads/Database/"];
  }
  v5 = [(BLDatabaseManager *)self initWithDatabaseFolderBaseURL:v3];

  return v5;
}

- (BLDatabaseManager)initWithDatabaseFolderBaseURL:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BLDatabaseManager;
  v5 = [(BLDatabaseManager *)&v36 init];
  if (v5)
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    int v7 = [v6 URLForResource:@"DownloadsDatabase" withExtension:@"momd"];

    CFStringRef v8 = (NSManagedObjectModel *)[objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v7];
    mom = v5->_mom;
    v5->_mom = v8;

    v10 = (NSPersistentStoreCoordinator *)[objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v5->_mom];
    psc = v5->_psc;
    v5->_psc = v10;

    v12 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    moc = v5->_moc;
    v5->_moc = v12;

    [(NSManagedObjectContext *)v5->_moc setPersistentStoreCoordinator:v5->_psc];
    v14 = +[NSFileManager defaultManager];
    v15 = [v4 URLByAppendingPathComponent:off_1001C75B0[0]];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 path];
      unsigned __int8 v18 = [v14 fileExistsAtPath:v17];

      if (v18)
      {
        v19 = BLServiceDatabaseManagerLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[Database]: Documents folder in shared container already existed.", buf, 2u);
        }
        uint64_t v20 = 1;
      }
      else
      {
        v21 = [v16 path];
        uint64_t v35 = 0;
        unsigned __int8 v22 = [v14 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v35];

        v23 = BLServiceDatabaseManagerLog();
        v19 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[Database]: Created documents folder in shared container.", buf, 2u);
          }
          uint64_t v20 = 0;
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[Database]: Failed to create documents folder in shared container.", buf, 2u);
          }

          uint64_t v20 = 0;
          v19 = v16;
          v16 = 0;
        }
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    v24 = [v16 URLByAppendingPathComponent:@"BLDatabaseManager.sqlite"];
    v25 = BLServiceDatabaseManagerLog();
    v26 = v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[Database]: Store is at %{public}@", buf, 0xCu);
      }

      objc_storeStrong((id *)&v5->_persistentStoreURL, v24);
      v27 = [(BLDatabaseManager *)v5 _setupPersistentStore:v20];
      if (v27)
      {
        objc_initWeak((id *)buf, v5);
        id v28 = objc_alloc((Class)BUOSStateHandler);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10001A488;
        v33[3] = &unk_1001A1880;
        objc_copyWeak(&v34, (id *)buf);
        v29 = (BUOSStateHandler *)[v28 initWithTitle:@"BLDatabaseManager" block:v33];
        osStateHandler = v5->_osStateHandler;
        v5->_osStateHandler = v29;

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
LABEL_28:

        goto LABEL_29;
      }
      v31 = BLServiceDatabaseManagerLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[Database]: Failed to initialize database manager.", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[Database]: Failed to initialize database manager.  No URL.", buf, 2u);
      }
    }
    v27 = v5;
    v5 = 0;
    goto LABEL_28;
  }
LABEL_29:

  return v5;
}

- (BOOL)_modelChanged
{
  v2 = self;
  v3 = +[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType URL:self->_persistentStoreURL options:0 error:0];
  LOBYTE(v2) = ![(NSManagedObjectModel *)v2->_mom isConfiguration:0 compatibleWithStoreMetadata:v3];

  return (char)v2;
}

- (id)_setupPersistentStore:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSFileManager defaultManager];
  v48[0] = NSMigratePersistentStoresAutomaticallyOption;
  v48[1] = NSInferMappingModelAutomaticallyOption;
  v49[0] = &__kCFBooleanTrue;
  v49[1] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  unsigned int v7 = [(BLDatabaseManager *)self _modelChanged];
  persistentStoreURL = self->_persistentStoreURL;
  psc = self->_psc;
  id v44 = 0;
  v10 = [(NSPersistentStoreCoordinator *)psc addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:persistentStoreURL options:v6 error:&v44];
  id v11 = v44;
  if (v10) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    v13 = +[BLDownloadManager downloadsDirectory];
    id v43 = v11;
    [v5 removeItemAtURL:v13 error:&v43];
    id v14 = v43;

    if (v14)
    {
      v15 = BLServiceDatabaseManagerLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[Database]: Error removing the download scratch directory:  %@", buf, 0xCu);
      }
    }
    if (v3)
    {
      v32 = v13;
      v33 = v10;
      id v34 = v6;
      uint64_t v35 = v5;
      [(NSManagedObjectContext *)self->_moc reset];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v16 = [(NSPersistentStoreCoordinator *)self->_psc persistentStores];
      id v17 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v40;
        do
        {
          uint64_t v20 = 0;
          v21 = v14;
          do
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v20);
            v23 = self->_psc;
            id v38 = v21;
            unsigned __int8 v24 = [(NSPersistentStoreCoordinator *)v23 removePersistentStore:v22 error:&v38];
            id v14 = v38;

            if (v14 || (v24 & 1) == 0)
            {
              v25 = BLServiceDatabaseManagerLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v47 = v14;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[Database]: Error removing the old database persistent store:  %@", buf, 0xCu);
              }
            }
            uint64_t v20 = (char *)v20 + 1;
            v21 = v14;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v18);
      }
      v26 = v14;

      v27 = self->_persistentStoreURL;
      id v37 = v14;
      v5 = v35;
      [v35 removeItemAtURL:v27 error:&v37];
      id v14 = v37;

      if (v14)
      {
        id v28 = BLServiceDatabaseManagerLog();
        v10 = v33;
        id v6 = v34;
        v13 = v32;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v14;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[Database]: Error removing the old database persistent store:  %@", buf, 0xCu);
        }
      }
      else
      {
        v30 = self->_persistentStoreURL;
        v29 = self->_psc;
        id v36 = 0;
        v10 = [(NSPersistentStoreCoordinator *)v29 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v30 options:0 error:&v36];
        id v14 = v36;
        id v28 = v33;
        id v6 = v34;
        v13 = v32;
      }
    }
    else
    {
      if (v10)
      {
LABEL_31:

        id v11 = v14;
        goto LABEL_32;
      }
      id v28 = BLServiceDatabaseManagerLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v14;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[Database]: Error initializing PSC:  %@", buf, 0xCu);
      }
      v10 = 0;
    }

    goto LABEL_31;
  }
LABEL_32:

  return v10;
}

- (void)fetchListOfAllDownloadCandidatesWithCompletion:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AA14;
  v7[3] = &unk_1001A1430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSManagedObjectContext *)moc performBlock:v7];
}

- (void)fetchListOfPendingDownloadsSortedByStartTime:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001ACB0;
  v7[3] = &unk_1001A1430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSManagedObjectContext *)moc performBlock:v7];
}

- (void)fetchListOfFailedDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  +[NSPredicate predicateWithFormat:@"%K = %@", @"state", &off_1001AF640];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(BLDatabaseManager *)self fetchDownloadListWithPredicate:v5 completion:v4];
}

- (void)purgeAllStaleDownloadsWithCompletion:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B1A0;
  v7[3] = &unk_1001A1430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSManagedObjectContext *)moc performBlock:v7];
}

- (void)saveDownloadStateWithId:(id)a3 state:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = BLServiceDatabaseManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSStringFromBLDownloadState();
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "(dID=%{public}@) [Database]: Saving state to %{public}@.", buf, 0x16u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001B8C4;
  v14[3] = &unk_1001A18D0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  [(BLDatabaseManager *)self _fetchDownloadInfoEntityWithID:v13 block:v14];
}

- (void)syncSaveDownloadStateWithId:(id)a3 state:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001BB60;
  v9[3] = &unk_1001A14B8;
  v10 = v7;
  id v8 = v7;
  [(BLDatabaseManager *)self saveDownloadStateWithId:v6 state:a4 completion:v9];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)syncTouchDownloadWithId:(id)a3
{
  id v4 = a3;
  id v5 = BLServiceDatabaseManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Database]: Touching download.", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BC8C;
  v7[3] = &unk_1001A18F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BLDatabaseManager *)self _fetchDownloadInfoEntityWithID:v6 sync:1 block:v7];
}

- (void)saveDownloadSizeWithId:(id)a3 size:(unint64_t)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001BEBC;
  v9[3] = &unk_1001A1920;
  id v10 = a5;
  unint64_t v11 = a4;
  void v9[4] = self;
  id v8 = v10;
  [(BLDatabaseManager *)self _fetchDownloadInfoEntityWithID:a3 block:v9];
}

- (void)saveIsLocalCacheServerWithId:(id)a3 isLocal:(BOOL)a4 completion:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C0AC;
  v7[3] = &unk_1001A1948;
  BOOL v10 = a4;
  id v8 = self;
  id v9 = a5;
  id v6 = v9;
  [(BLDatabaseManager *)v8 _fetchDownloadInfoEntityWithID:a3 block:v7];
}

- (void)saveDownloadPathWithId:(id)a3 path:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C2E0;
  v10[3] = &unk_1001A1970;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  [(BLDatabaseManager *)self _fetchDownloadInfoEntityWithID:a3 block:v10];
}

- (void)updateDownloadWithID:(id)a3 updateBlock:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C4D0;
  v9[3] = &unk_1001A1998;
  BOOL v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(BLDatabaseManager *)v10 _fetchDownloadInfoEntityWithID:a3 block:v9];
}

- (void)updateAllInterruptedDownloadsToTheirProperStatesWithCompletion:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C6CC;
  v7[3] = &unk_1001A1430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSManagedObjectContext *)moc performBlock:v7];
}

- (void)fetchDownloadListWithPredicate:(id)a3 sync:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001CDD8;
  v8[3] = &unk_1001A19C0;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(BLDatabaseManager *)v9 _fetchDownloadsWithPredicate:a3 sync:v5 block:v8];
}

- (void)fetchDownloadListWithPredicate:(id)a3 completion:(id)a4
{
}

- (void)fetchModifiableDownloadsMatchingPredicate:(id)a3 results:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D028;
  v9[3] = &unk_1001A19E8;
  id v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(BLDatabaseManager *)v10 _fetchDownloadsWithPredicate:a3 block:v9];
}

- (void)deleteDownloadWithID:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D274;
  v7[3] = &unk_1001A1970;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(BLDatabaseManager *)v8 _fetchDownloadInfoEntityWithID:v6 block:v7];
}

- (void)saveOrUpdateDownloadPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 policyID];
  id v9 = [v6 storePlaylistIdentifier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D518;
  v12[3] = &unk_1001A1A10;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(BLDatabaseManager *)self _fetchDownloadPolicyInfoEntityWithID:v8 relatedPolicyWithStorePlaylistIdentifier:v9 block:v12];
}

- (void)deleteDownloadPolicyWithID:(id)a3 completion:(id)a4
{
}

- (void)_deleteDownloadPolicyWithID:(id)a3 save:(BOOL)a4 completion:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D8B4;
  v7[3] = &unk_1001A1A38;
  BOOL v10 = a4;
  id v8 = self;
  id v9 = a5;
  id v6 = v9;
  [(BLDatabaseManager *)v8 _fetchDownloadPolicyInfoEntityWithID:a3 relatedPolicyWithStorePlaylistIdentifier:0 block:v7];
}

- (void)fetchDownloadPolicyWithID:(id)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DA4C;
  v6[3] = &unk_1001A1A60;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(BLDatabaseManager *)v7 _fetchDownloadPolicyInfoEntityWithID:a3 relatedPolicyWithStorePlaylistIdentifier:0 block:v6];
}

- (void)fetchListOfAllDownloadPoliciesWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DB70;
  v4[3] = &unk_1001A19C0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BLDatabaseManager *)v5 _fetchDownloadPoliciesWithPredicate:0 block:v4];
}

- (void)fetchDownloadFromDownloadID:(id)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DE10;
  v6[3] = &unk_1001A1A88;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(BLDatabaseManager *)v7 _fetchDownloadInfoEntityWithID:a3 block:v6];
}

- (void)addDownloadWithBuyParameters:(id)a3 storeID:(id)a4 clientIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v11;
  id v15 = v14;
  if (![v14 longLongValue])
  {
    id v15 = +[BLUtilities storeIDFromBuyParameters:v10];
  }
  moc = self->_moc;
  if (moc)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001E128;
    v22[3] = &unk_1001A1AB0;
    v22[4] = self;
    id v23 = v10;
    id v24 = v12;
    id v25 = v15;
    id v26 = v13;
    [(NSManagedObjectContext *)moc performBlock:v22];
  }
  else
  {
    int64_t v17 = BLServiceDatabaseManagerLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "[Database]: no valid moc when trying to addDownloadWithBuyParameters!", v21, 2u);
    }

    id v18 = sub_10004B6AC(26, @"Unable to add download", @"There was no valid moc.");
    id v19 = objc_retainBlock(v13);
    __int16 v20 = v19;
    if (v19) {
      (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v18);
    }
  }
}

- (void)addDownloadWithPermlink:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  moc = self->_moc;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001E484;
  v15[3] = &unk_1001A1AD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(NSManagedObjectContext *)moc performBlock:v15];
}

- (void)requestDownloadWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  moc = self->_moc;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001E7C4;
  v11[3] = &unk_1001A1B00;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSManagedObjectContext *)moc performBlock:v11];
}

- (void)pauseDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v15 = v6;
    id v8 = +[NSArray arrayWithObjects:&v15 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001F77C;
    v12[3] = &unk_1001A1B28;
    id v14 = v7;
    id v13 = v6;
    [(BLDatabaseManager *)self pauseDownloadsWithIDs:v8 withCompletion:v12];
  }
  else
  {
    id v9 = sub_10004B6AC(37, @"Missing downloadID", @"Missing downloadID");
    id v10 = objc_retainBlock(v7);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v9);
    }
  }
}

- (void)pauseDownloadsWithIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLServiceDatabaseManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Database]: Pausing downloads: %@", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F974;
  v11[3] = &unk_1001A1B50;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BLDatabaseManager *)self _fetchDownloadsWithIDs:v10 block:v11];
}

- (void)cancelDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLServiceDatabaseManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "(dID=%{public}@) [Database]: Cancelling download", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001FF3C;
  v11[3] = &unk_1001A1970;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BLDatabaseManager *)self _fetchDownloadInfoEntityWithID:v10 block:v11];
}

- (void)finalizeOrCanceAndCleanupWithDownloadID:(id)a3 cleanupBlock:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BLServiceDatabaseManagerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Database]: Finalizing or canceling download", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000208FC;
  v15[3] = &unk_1001A1B78;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(BLDatabaseManager *)self _fetchDownloadInfoEntityWithID:v14 block:v15];
}

- (BOOL)canResumeDownloadWithState:(int64_t)a3
{
  return a3 == 4;
}

- (void)resumeDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v15 = v6;
    id v8 = +[NSArray arrayWithObjects:&v15 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100020C88;
    v12[3] = &unk_1001A1B28;
    id v14 = v7;
    id v13 = v6;
    [(BLDatabaseManager *)self resumeDownloadsWithID:v8 withCompletion:v12];
  }
  else
  {
    id v9 = sub_10004B6AC(37, @"Missing downloadID", @"Missing downloadID");
    id v10 = objc_retainBlock(v7);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v9);
    }
  }
}

- (void)resumeDownloadsWithID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLServiceDatabaseManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Database]: Resuming downloads: %@", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100020E80;
  v11[3] = &unk_1001A1B50;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(BLDatabaseManager *)self _fetchDownloadsWithIDs:v10 block:v11];
}

- (id)mq_newInMemoryDownloadFromDownloadInfo:(id)a3
{
  return [a3 createDownload];
}

- (void)_fetchDownloadInfoEntityWithID:(id)a3 block:(id)a4
{
}

- (void)_fetchDownloadInfoEntityWithID:(id)a3 sync:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    id v10 = +[NSPredicate predicateWithFormat:@"%K == %@", @"downloadID", v8];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002149C;
    v13[3] = &unk_1001A19C0;
    id v14 = v8;
    id v15 = v9;
    [(BLDatabaseManager *)self _fetchDownloadsWithPredicate:v10 sync:v6 block:v13];
  }
  else
  {
    id v11 = (void (**)(id, void, void *))objc_retainBlock(v9);
    if (v11)
    {
      id v12 = sub_10004B6AC(23, 0, 0);
      v11[2](v11, 0, v12);
    }
  }
}

- (void)_fetchDownloadsWithIDs:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"downloadID", a3];
  [(BLDatabaseManager *)self _fetchDownloadsWithPredicate:v7 block:v6];
}

- (void)_fetchDownloadsWithPredicate:(id)a3 block:(id)a4
{
}

- (void)_fetchDownloadsWithPredicate:(id)a3 sync:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021794;
    v15[3] = &unk_1001A1B00;
    id v16 = v8;
    id v17 = self;
    id v18 = v10;
    id v11 = objc_retainBlock(v15);
    moc = self->_moc;
    if (v6) {
      [(NSManagedObjectContext *)moc performBlockAndWait:v11];
    }
    else {
      [(NSManagedObjectContext *)moc performBlock:v11];
    }
  }
  else
  {
    id v13 = (void (**)(id, void, void *))objc_retainBlock(v9);
    if (v13)
    {
      id v14 = sub_10004B6AC(0, 0, 0);
      v13[2](v13, 0, v14);
    }
  }
}

- (id)mq_newDownloadPolicyFromDownloadPolicyInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_opt_new();
    id v5 = [v3 policyID];
    [v4 setPolicyID:v5];

    BOOL v6 = [v3 policyData];
    [v4 setPolicyData:v6];

    id v7 = [v3 storePlaylistIdentifier];

    [v4 setStorePlaylistIdentifier:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_fetchDownloadPolicyInfoEntityWithID:(id)a3 relatedPolicyWithStorePlaylistIdentifier:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    if ([v9 longLongValue]) {
      +[NSPredicate predicateWithFormat:@"%K == %@ or %K == %@", @"policyID", v8, @"storePlaylistIdentifier", v9];
    }
    else {
    id v13 = +[NSPredicate predicateWithFormat:@"%K == %@", @"policyID", v8, v14, v15];
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100021AC8;
    v16[3] = &unk_1001A19C0;
    id v17 = v8;
    id v18 = v10;
    [(BLDatabaseManager *)self _fetchDownloadPoliciesWithPredicate:v13 block:v16];
  }
  else
  {
    id v11 = objc_retainBlock(v10);
    if (v11)
    {
      id v12 = sub_10004B6AC(23, 0, 0);
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v12);
    }
  }
}

- (void)_fetchDownloadPoliciesWithPredicate:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  moc = self->_moc;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021D58;
  v11[3] = &unk_1001A1B00;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSManagedObjectContext *)moc performBlock:v11];
}

- (id)mq_writeMetadata:(id)a3 clientIdentifier:(id)a4 downloadID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[BLITunesMetadataHelper alloc] initWithClientIdentifier:v8 downloadMetadata:v9];

  id v15 = 0;
  id v11 = [(BLITunesMetadataHelper *)v10 writePlistWithDownloadID:v7 error:&v15];
  id v12 = v15;
  if (![v11 length])
  {
    id v13 = BLBookInstallLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Database]: Failed to write iTunesMetadata.plist:  %@", buf, 0x16u);
    }
  }

  return v11;
}

- (id)mq_writeSinf:(id)a3 downloadID:(id)a4
{
  id v5 = a4;
  id v11 = 0;
  id v6 = +[BLSinfHelper writeSinfForDownloadID:v5 epubRightsData:a3 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    id v8 = BLBookInstallLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Database]: Failed to write sinf.xml. Error:  %@", buf, 0x16u);
    }
  }
  id v9 = [v6 path];

  return v9;
}

- (id)mq_writeArtworkWithURL:(id)a3 downloadID:(id)a4
{
  id v5 = a4;
  id v10 = 0;
  id v6 = +[BLArtworkHelper writeArtworkDownloadID:v5 artworkURL:a3 error:&v10];
  id v7 = v10;
  if (![v6 length])
  {
    id v8 = BLBookInstallLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Database]: Failed to write iTunesArtwork. Error:  %@", buf, 0x16u);
    }
  }

  return v6;
}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (NSPersistentStoreCoordinator)psc
{
  return self->_psc;
}

- (void)setPsc:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
}

- (NSManagedObjectModel)mom
{
  return self->_mom;
}

- (void)setMom:(id)a3
{
}

- (BUOSStateHandler)osStateHandler
{
  return self->_osStateHandler;
}

- (void)setOsStateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osStateHandler, 0);
  objc_storeStrong((id *)&self->_mom, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_psc, 0);

  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
}

- (id)_stateForLog
{
  return [(BLDatabaseManager *)self _stateForLogWithTimeout:0.5];
}

- (id)_stateForLogWithTimeout:(double)a3
{
  id v5 = dispatch_group_create();
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100063280;
  v29 = sub_100063290;
  id v30 = 0;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_100063280;
  id v23 = sub_100063290;
  id v24 = 0;
  dispatch_group_enter(v5);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100063298;
  v16[3] = &unk_1001A2EA0;
  __int16 v18 = &v25;
  id v6 = v5;
  id v17 = v6;
  [(BLDatabaseManager *)self fetchDownloadListWithCompletion:v16];
  dispatch_group_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000633E8;
  v13[3] = &unk_1001A2EA0;
  id v15 = &v19;
  id v7 = v6;
  id v14 = v7;
  [(BLDatabaseManager *)self fetchListOfAllDownloadPoliciesWithCompletion:v13];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_group_wait(v7, v8);
  CFStringRef v9 = (const __CFString *)v26[5];
  if (!v9) {
    CFStringRef v9 = @"<timed out>";
  }
  v31[0] = @"downloads";
  v31[1] = @"policies";
  CFStringRef v10 = (const __CFString *)v20[5];
  if (!v10) {
    CFStringRef v10 = @"<timed out>";
  }
  v32[0] = v9;
  v32[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

@end