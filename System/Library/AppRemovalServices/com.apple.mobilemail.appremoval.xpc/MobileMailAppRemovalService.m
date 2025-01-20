@interface MobileMailAppRemovalService
- (id)_disableMailAccounts;
- (id)_recordMailAppUninstalled;
- (id)_removeContentsOfDirectory:(id)a3;
- (id)_removeNanoMailDirectory;
- (void)removeAppWithReply:(id)a3;
@end

@implementation MobileMailAppRemovalService

- (id)_disableMailAccounts
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Will disable mail accounts", buf, 2u);
  }
  id v2 = objc_alloc_init((Class)ACAccountStore);
  uint64_t v17 = kAccountDataclassMail;
  v16 = objc_msgSend(v2, "accountIdentifiersEnabledForDataclass:");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v3 = [v16 count];
    *(_DWORD *)buf = 134217984;
    id v29 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Found %lu account identifiers", buf, 0xCu);
  }
  v18 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v16;
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v8 = [v2 accountWithIdentifier:v7];
        v9 = [v8 parentAccount];

        BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
        if (v9)
        {
          if (v10)
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v8;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Skipping child account: %@", buf, 0xCu);
          }
        }
        else
        {
          if (v10)
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v8;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Disabling %@", buf, 0xCu);
          }
          v11 = +[EFPromise promise];
          v12 = [v11 future];
          [v18 addObject:v12];

          [v8 setEnabled:0 forDataclass:v17];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100002144;
          v20[3] = &unk_100004180;
          id v13 = v11;
          id v21 = v13;
          uint64_t v22 = v7;
          [v2 saveAccount:v8 withCompletionHandler:v20];
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }

  v14 = +[EFFuture combine:v18];

  return v14;
}

- (id)_removeContentsOfDirectory:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Will remove %@", buf, 0xCu);
  }
  id v4 = +[NSFileManager defaultManager];
  id v21 = +[EFPromise promise];
  id v27 = 0;
  v20 = [v4 contentsOfDirectoryAtPath:v3 error:&v27];
  id v5 = v27;
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(v6, "ef_publicDescription");
      sub_100002B80(v7, buf);
    }
    [v21 finishWithError:v6];
    goto LABEL_26;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v20;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v9)
  {

    goto LABEL_23;
  }
  v6 = 0;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = [v3 stringByAppendingPathComponent:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      id v22 = 0;
      [v4 removeItemAtPath:v12 error:&v22];
      id v13 = v22;
      if ([v13 code] != (id)4)
      {
        if (!v13) {
          goto LABEL_16;
        }
        id v14 = v13;

        v6 = v14;
      }

LABEL_16:
    }
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  }
  while (v9);

  if (v6)
  {
    id v15 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v6, "ef_publicDescription");
      sub_100002B80(v16, buf);
    }

    [v21 finishWithError:v6];
    goto LABEL_26;
  }
LABEL_23:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Finished removal of directory", buf, 2u);
  }
  v6 = 0;
  [v21 finishWithResult:v3];
LABEL_26:

  uint64_t v17 = [v21 future];

  return v17;
}

- (id)_removeNanoMailDirectory
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Will remove NanoMail directory", buf, 2u);
  }
  id v8 = 0;
  unsigned int v2 = +[NNMKSyncProvider prepareForSystemAppDeletion:&v8];
  id v3 = v8;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "NanoMail remove success", buf, 2u);
    }
    uint64_t v4 = +[EFFuture futureWithResult:@"NNMKSyncProvider"];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend(v3, "ef_publicDescription");
      sub_100002BDC(v5, buf);
    }
    uint64_t v4 = +[EFFuture futureWithError:v3];
  }
  v6 = (void *)v4;

  return v6;
}

- (id)_recordMailAppUninstalled
{
  +[EMDaemonInterface setCachedMailAppIsInstalled:0];
  return +[EFFuture futureWithResult:@"_recordMailAppUninstalled"];
}

- (void)removeAppWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "removeAppWithReply called", buf, 2u);
  }
  int v5 = SFTerminateProcessNamed();
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002CA0(v5);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Terminated maild", buf, 2u);
  }
  v6 = [(MobileMailAppRemovalService *)self _disableMailAccounts];
  v23[0] = v6;
  uint64_t v7 = MFMailDirectory();
  id v8 = [(MobileMailAppRemovalService *)self _removeContentsOfDirectory:v7];
  v23[1] = v8;
  id v9 = [(MobileMailAppRemovalService *)self _removeNanoMailDirectory];
  v23[2] = v9;
  uint64_t v10 = [(MobileMailAppRemovalService *)self _recordMailAppUninstalled];
  v23[3] = v10;
  v11 = +[NSArray arrayWithObjects:v23 count:4];

  v12 = +[EFFuture sequence:v11];
  id v20 = 0;
  id v13 = [v12 result:&v20];
  id v14 = v20;
  if ([v13 count]
    && (+[NSNull null],
        id v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [v13 containsObject:v15],
        v15,
        (v16 & 1) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Joined future success: %@", buf, 0xCu);
    }
    id v18 = 0;
  }
  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    id v18 = v14;
    if (v17)
    {
      v19 = objc_msgSend(v14, "ef_publicDescription");
      sub_100002C38(v19, (uint64_t)v13, buf);
      id v18 = v14;
    }
  }
  ((void (**)(id, id))v4)[2](v4, v18);
}

@end