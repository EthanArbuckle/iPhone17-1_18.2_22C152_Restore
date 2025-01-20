@interface XPCAppRemovalService
- (BOOL)removeDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeSharedCacheDirectory:(id *)a3;
- (BOOL)removeSharedDocumentsDirectory:(id *)a3;
- (BOOL)removeSharedImageStoreDirectory:(id *)a3;
- (BOOL)removeSharedLibraryDirectory:(id *)a3;
- (id)errorWithError:(id)a3 code:(int64_t)a4;
- (id)sharedCacheURL;
- (id)sharedDocumentsURL;
- (id)sharedLibraryURL;
- (void)removeAllMediaWithCompletion:(id)a3;
- (void)removeAppWithReply:(id)a3;
@end

@implementation XPCAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v5 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing Podcasts app resources from the system.", buf, 2u);
  }

  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  *(void *)buf = 0;
  v33 = buf;
  uint64_t v34 = 0x3032000000;
  v35 = sub_1000086A4;
  v36 = sub_1000086B4;
  id v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000086BC;
  v29[3] = &unk_100010688;
  v31 = buf;
  v7 = v6;
  v30 = v7;
  [(XPCAppRemovalService *)self removeAllMediaWithCompletion:v29];
  v8 = +[MTIntentDonationUtil sharedInstance];
  [v8 removeAllDonations];

  v9 = +[INRelevantShortcutStore defaultStore];
  [v9 setRelevantShortcuts:&__NSArray0__struct completionHandler:0];

  v10 = +[INUpcomingMediaManager sharedManager];
  v11 = +[NSOrderedSet orderedSet];
  [v10 setSuggestedMediaIntents:v11];

  v12 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remove Image storage.", v28, 2u);
  }

  id v27 = 0;
  [(XPCAppRemovalService *)self removeSharedImageStoreDirectory:&v27];
  id v13 = v27;
  v14 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remove shared cache.", v28, 2u);
  }

  id v26 = v13;
  [(XPCAppRemovalService *)self removeSharedCacheDirectory:&v26];
  id v15 = v26;

  v16 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Remove shared documents.", v28, 2u);
  }

  id v25 = v15;
  [(XPCAppRemovalService *)self removeSharedDocumentsDirectory:&v25];
  id v17 = v25;

  v18 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Remove shared library.", v28, 2u);
  }

  id v24 = v17;
  [(XPCAppRemovalService *)self removeSharedLibraryDirectory:&v24];
  id v19 = v24;

  v20 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Removing all NanoPreferencesSync defaults.", v28, 2u);
  }

  v21 = [sub_10000871C() sharedDefaults];
  [v21 clearPodcastsDefaults];

  v22 = [sub_10000871C() sharedDefaults];
  [v22 clearAppActivityStatusDefaultsForBundleID:kMTApplicationBundleIdentifier];

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (!v19) {
    id v19 = *((id *)v33 + 5);
  }

  _Block_object_dispose(buf, 8);
  v23 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Podcasts resources were removed from the system.", buf, 2u);
  }

  v4[2](v4, v19);
}

- (void)removeAllMediaWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = _MTLogCategoryAppRemoval();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing all media...", buf, 2u);
  }

  v5 = +[MTMediaLibraryTransactionManager sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000894C;
  v7[3] = &unk_1000106F0;
  id v8 = v3;
  id v6 = v3;
  [v5 requestMediaLibraryWriteTransaction:&stru_1000106C8 completion:v7];
}

- (BOOL)removeSharedImageStoreDirectory:(id *)a3
{
  v5 = +[MTImageStoreConstants defaultImageStoreURL];
  id v9 = 0;
  BOOL v6 = [(XPCAppRemovalService *)self removeDirectoryAtURL:v5 error:&v9];
  id v7 = v9;

  if (a3 && !v6)
  {
    *a3 = [(XPCAppRemovalService *)self errorWithError:v7 code:8];
  }

  return v6;
}

- (BOOL)removeSharedDocumentsDirectory:(id *)a3
{
  v5 = [(XPCAppRemovalService *)self sharedDocumentsURL];
  id v9 = 0;
  BOOL v6 = [(XPCAppRemovalService *)self removeDirectoryAtURL:v5 error:&v9];
  id v7 = v9;

  if (a3 && !v6)
  {
    *a3 = [(XPCAppRemovalService *)self errorWithError:v7 code:4];
  }

  return v6;
}

- (BOOL)removeSharedCacheDirectory:(id *)a3
{
  v5 = [(XPCAppRemovalService *)self sharedCacheURL];
  id v9 = 0;
  BOOL v6 = [(XPCAppRemovalService *)self removeDirectoryAtURL:v5 error:&v9];
  id v7 = v9;

  if (a3 && !v6)
  {
    *a3 = [(XPCAppRemovalService *)self errorWithError:v7 code:5];
  }

  return v6;
}

- (BOOL)removeSharedLibraryDirectory:(id *)a3
{
  v5 = [(XPCAppRemovalService *)self sharedLibraryURL];
  id v9 = 0;
  BOOL v6 = [(XPCAppRemovalService *)self removeDirectoryAtURL:v5 error:&v9];
  id v7 = v9;

  if (a3 && !v6)
  {
    *a3 = [(XPCAppRemovalService *)self errorWithError:v7 code:7];
  }

  return v6;
}

- (BOOL)removeDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = 0;
LABEL_6:
    id v13 = _MTLogCategoryAppRemoval();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error removing directory: %{public}@ %{public}@", buf, 0x16u);
    }
    BOOL v12 = 0;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v6 = +[NSFileManager defaultManager];
  id v7 = [v5 path];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

  if ((v8 & 1) == 0)
  {
    id v13 = _MTLogCategoryAppRemoval();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipping removal of directory that does not exist: %{public}@", buf, 0xCu);
    }
    id v11 = 0;
    BOOL v12 = 1;
    goto LABEL_12;
  }
  id v9 = +[NSFileManager defaultManager];
  id v15 = 0;
  unsigned __int8 v10 = [v9 removeItemAtURL:v5 error:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0)
  {
    if (a4 && v11)
    {
      id v11 = v11;
      *a4 = v11;
    }
    goto LABEL_6;
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (id)sharedDocumentsURL
{
  v2 = +[MTConstants sharedContainerURL];
  id v3 = [v2 URLByAppendingPathComponent:kMTLibraryDocumentsPath isDirectory:1];

  return v3;
}

- (id)sharedCacheURL
{
  v2 = +[MTConstants sharedContainerURL];
  id v3 = [v2 URLByAppendingPathComponent:kMTLibraryCachePath isDirectory:1];

  return v3;
}

- (id)sharedLibraryURL
{
  v2 = +[MTConstants sharedContainerURL];
  id v3 = [v2 URLByAppendingPathComponent:kMTLibraryLibraryPath isDirectory:1];

  return v3;
}

- (id)errorWithError:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = +[NSMutableDictionary dictionary];
  id v7 = [v5 userInfo];

  if (v7)
  {
    unsigned __int8 v8 = [v5 userInfo];
    [v6 addEntriesFromDictionary:v8];
  }
  id v9 = [v5 domain];
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = [v5 domain];
    [v6 setObject:v11 forKeyedSubscript:@"originalDomain"];

    BOOL v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 code]);
    [v6 setObject:v12 forKeyedSubscript:@"originalCode"];
  }
  id v13 = +[NSError errorWithDomain:@"com.apple.podcasts.appremoval" code:a4 userInfo:v6];

  return v13;
}

@end