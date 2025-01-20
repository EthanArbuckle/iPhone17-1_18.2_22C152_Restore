@interface SHMediaLibraryInfoFetcher
+ (int64_t)libraryStatusForAccountStatus:(int64_t)a3;
- (NSString)currentUserID;
- (void)clearCachedSyncStatus;
- (void)fetchAccountTokensWithAccountInfo:(id)a3 completion:(id)a4;
- (void)fetchLibraryInfoWithCompletionHandler:(id)a3;
- (void)setCurrentUserID:(id)a3;
@end

@implementation SHMediaLibraryInfoFetcher

- (void)fetchLibraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[SHCloudContainer sharedContainer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C288;
  v7[3] = &unk_100075D30;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 accountInfoWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)fetchAccountTokensWithAccountInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([v6 accountStatus] == (id)1)
  {
    objc_initWeak(&location, self);
    id v8 = +[SHCloudContainer sharedContainer];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003C5F4;
    v11[3] = &unk_100075D58;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    [v8 fetchUserRecordIDWithCompletionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = +[NSFileManager defaultManager];
    v10 = [v9 ubiquityIdentityToken];

    if (!v10) {
      [(SHMediaLibraryInfoFetcher *)self setCurrentUserID:0];
    }
    v7[2](v7);
  }
}

- (NSString)currentUserID
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"SHLibraryAvailabilityListenerUserID"];

  return (NSString *)v3;
}

- (void)setCurrentUserID:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(SHMediaLibraryInfoFetcher *)self currentUserID];
  if (v4 | v5 && ([(id)v4 isEqualToString:v5] & 1) == 0)
  {
    id v6 = sh_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "iCloud account has changed, updating current user account id", buf, 2u);
    }

    v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setObject:v4 forKey:@"SHLibraryAvailabilityListenerUserID"];

    if (v5)
    {
      id v8 = sh_log_object();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clear all local data and cache sync status", v11, 2u);
      }

      id v9 = [[SHMediaLibraryDataStore alloc] initWithStoreType:1];
      [(SHMediaLibraryDataStore *)v9 deleteAllItems];
      [(SHMediaLibraryInfoFetcher *)self clearCachedSyncStatus];
    }
    v10 = +[NSDistributedNotificationCenter defaultCenter];
    [v10 postNotificationName:SHMediaLibraryAccountChangeNotification object:0 userInfo:0 deliverImmediately:1];
  }
}

- (void)clearCachedSyncStatus
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  unint64_t v4 = [v3 stringByAppendingPathComponent:@"com.apple.shazamlibrary.cloud"];
  char v32 = 0;
  uint64_t v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v32];

  if (v6) {
    BOOL v7 = v32 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = +[NSFileManager defaultManager];
    id v31 = 0;
    id v9 = [v8 contentsOfDirectoryAtPath:v4 error:&v31];
    v24 = v31;

    if (v9)
    {
      v23 = v4;
      v10 = +[SHCloudContainer sharedContainer];
      v11 = [v10 containerIdentifier];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v22 = v9;
      id obj = v9;
      id v12 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            v17 = [SHLCloudLibraryCache alloc];
            uint64_t v18 = +[NSUUID UUID];
            v19 = [(SHLCloudLibraryCache *)v17 initWithCallingProcessIdentifier:v16 containerIdentifier:v11 transactionIdentifier:v18];

            id v26 = 0;
            LOBYTE(v18) = [(SHLCloudLibraryCache *)v19 resetWithError:&v26];
            id v20 = v26;
            if ((v18 & 1) == 0)
            {
              v21 = sh_log_object();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v34 = v11;
                __int16 v35 = 2112;
                uint64_t v36 = v16;
                __int16 v37 = 2112;
                v38 = v24;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to reset cache (%@) for %@, error: %@", buf, 0x20u);
              }
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
        }
        while (v13);
      }

      unint64_t v4 = v23;
      id v9 = v22;
    }
    else
    {
      v11 = sh_log_object();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "No cached sync status to reset %@", buf, 0xCu);
      }
    }
  }
}

+ (int64_t)libraryStatusForAccountStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return qword_100059778[a3];
  }
}

@end