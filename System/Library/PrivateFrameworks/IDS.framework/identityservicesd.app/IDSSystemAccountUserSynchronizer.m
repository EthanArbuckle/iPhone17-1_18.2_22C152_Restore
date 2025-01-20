@interface IDSSystemAccountUserSynchronizer
- (CUTPromise)migrationPromise;
- (IDSDataMigrationTracker)migrationTracker;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IDSSystemAccountUserSynchronizer)initWithSystemAccountAdapter:(id)a3 userStore:(id)a4 migrationTracker:(id)a5 queue:(id)a6;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)queue;
- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
- (void)setMigrationPromise:(id)a3;
- (void)setMigrationTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setUserStore:(id)a3;
@end

@implementation IDSSystemAccountUserSynchronizer

- (IDSSystemAccountUserSynchronizer)initWithSystemAccountAdapter:(id)a3 userStore:(id)a4 migrationTracker:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSSystemAccountUserSynchronizer;
  v15 = [(IDSSystemAccountUserSynchronizer *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemAccountAdapter, a3);
    objc_storeStrong((id *)&v16->_userStore, a4);
    objc_storeStrong((id *)&v16->_migrationTracker, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  id v4 = a3;
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_1007240F0((uint64_t)v4, v5);
  }
}

- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4
{
  id v5 = a4;
  if ([(IDSDataMigrationTracker *)self->_migrationTracker hasPerformedMigration])
  {
    id v35 = v5;
    id v6 = v5;
    id v36 = [v6 mutableCopy];
    systemAccountAdapter = self->_systemAccountAdapter;
    id v43 = 0;
    v8 = [(IDSSystemAccountAdapter *)systemAccountAdapter iCloudSystemAccountWithError:&v43];
    id v34 = v43;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v38 = *(void *)v40;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v40 != v38) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v13 = [v12 userName];
          id v14 = [v8 username];
          if (v13 == v14)
          {
            unsigned int v17 = 1;
          }
          else
          {
            v15 = [v12 userName];
            v16 = [v8 username];
            unsigned int v17 = [v15 isEqual:v16];
          }
          objc_super v18 = [v12 DSID];
          v19 = [v8 DSID];
          if (v18 == v19)
          {
            unsigned int v22 = 1;
          }
          else
          {
            v20 = [v12 DSID];
            v21 = [v8 DSID];
            unsigned int v22 = [v20 isEqual:v21];
          }
          if ((v22 & v17 & 1) == 0) {
            [v36 removeObject:v12];
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
      }
      while (v10);
    }

    if (![v36 count] && v8)
    {
      v23 = [IDSAppleUser alloc];
      v24 = [v8 username];
      v25 = [v8 DSID];
      v26 = [(IDSAppleUser *)v23 initWithUserName:v24 DSID:v25];

      [v36 addObject:v26];
    }
    v27 = +[IMRGLog registration];
    id v5 = v35;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v46 = obj;
      __int16 v47 = 2112;
      id v48 = v36;
      __int16 v49 = 2112;
      v50 = v8;
      __int16 v51 = 2112;
      id v52 = v34;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Finished synchronizing SystemAccounts to users {currentUsers: %@, updatedUsers: %@, iCloudAccount: %@, error: %@}", buf, 0x2Au);
    }

    id v28 = v36;
  }
  else
  {
    v29 = +[IMRGLog registration];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Waiting on migration -- deferring updateUsers", buf, 2u);
    }

    if (!self->_migrationPromise)
    {
      v30 = [(IDSDataMigrationTracker *)self->_migrationTracker performMigrationIfNeeded];
      migrationPromise = self->_migrationPromise;
      self->_migrationPromise = v30;

      v32 = self->_migrationPromise;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100405BEC;
      v44[3] = &unk_10097FCA8;
      v44[4] = self;
      [(CUTPromise *)v32 registerResultBlock:v44];
    }
    id v28 = v5;
  }

  return v28;
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSDataMigrationTracker)migrationTracker
{
  return self->_migrationTracker;
}

- (void)setMigrationTracker:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CUTPromise)migrationPromise
{
  return self->_migrationPromise;
}

- (void)setMigrationPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationPromise, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_migrationTracker, 0);
  objc_storeStrong((id *)&self->_userStore, 0);

  objc_storeStrong((id *)&self->_systemAccountAdapter, 0);
}

@end