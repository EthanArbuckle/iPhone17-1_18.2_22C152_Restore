@interface RemoteApplicationCatalog
- (LibraryCatalogObserver)observer;
- (id)resultsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)resultsWithBundleIDs:(id)a3 error:(id *)a4;
- (id)resultsWithItemIDs:(id)a3 error:(id *)a4;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)dealloc;
- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5;
- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5;
- (void)setObserver:(id)a3;
@end

@implementation RemoteApplicationCatalog

- (void)dealloc
{
  v3 = sub_1003B3A54();
  sub_1003B42D8((uint64_t)v3, self);

  v4.receiver = self;
  v4.super_class = (Class)RemoteApplicationCatalog;
  [(RemoteApplicationCatalog *)&v4 dealloc];
}

- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5
{
  v7 = (void (**)(id, void *, void))a5;
  id v8 = a3;
  v11 = sub_100242940((id *)[LibraryExpressionClassifier alloc], self);
  v9 = sub_100368E68((id *)[LibraryQueryPlanner alloc], v11);
  v10 = sub_10000FB20((uint64_t)v9, v8);

  v7[2](v7, v10, 0);
}

- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5
{
}

- (id)resultsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [LibraryLazyResultsEnumerator alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002CA36C;
  v10[3] = &unk_1005262B8;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  id v8 = sub_10001584C(v6, 1, v10);

  return v8;
}

- (id)resultsWithBundleIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [LibraryLazyResultsEnumerator alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002CAD84;
  v10[3] = &unk_1005262B8;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  id v8 = sub_10001584C(v6, 0, v10);

  return v8;
}

- (id)resultsWithItemIDs:(id)a3 error:(id *)a4
{
  v6 = +[NSPredicate predicateWithFormat:@"storeItemID IN %@", a3];
  id v7 = [(RemoteApplicationCatalog *)self resultsMatchingPredicate:v6 error:a4];

  return v7;
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_device pairingID];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1002CB6D4;
    v29[3] = &unk_100526308;
    v29[4] = self;
    v10 = sub_1003923F8(v6, v29);
    id v11 = v10;
    if (v7 && [v10 count])
    {
      v12 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v32 = v7;
        __int16 v33 = 2114;
        id v34 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Posting register notification for device: %{public}@ with apps: %{public}@", buf, 0x16u);
      }

      v13 = sub_1002CF520((uint64_t)ASDNotification, v11, v7);
      v14 = sub_10001A0C8();
      sub_1003D64D4((uint64_t)v14, v13);

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v24 = v11;
      id v15 = v11;
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v19);
            v21 = sub_100388088();
            v22 = [v20 bundleID];
            sub_100389C18((uint64_t)v21, v22);

            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v17);
      }

      id v11 = v24;
    }
    else
    {
      v13 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v6 count];
        *(_DWORD *)buf = 138543618;
        id v32 = v7;
        __int16 v33 = 2048;
        id v34 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid install notification received for: %{public}@ with %lu applications", buf, 0x16u);
      }
    }
  }
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_device pairingID];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    if (v7 && [v6 count])
    {
      v10 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543618;
        id v14 = v7;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Posting unregister notification for device: %{public}@ with apps: %{public}@", (uint8_t *)&v13, 0x16u);
      }

      id v11 = sub_1002CF734((uint64_t)ASDNotification, v6, v7);
      v12 = sub_10001A0C8();
      sub_1003D64D4((uint64_t)v12, v11);
    }
    else
    {
      id v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543618;
        id v14 = v7;
        __int16 v15 = 2048;
        id v16 = [v6 count];
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid uninstall notification received for: %{public}@ with %lu applications", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_device pairingID];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v10 = ASDLogHandleForCategory();
    id v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Posting refresh notification for device: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      id v11 = sub_1002CF330((uint64_t)ASDNotification, v7);
      v12 = sub_10001A0C8();
      sub_1003D64D4((uint64_t)v12, v11);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = 0;
      __int16 v15 = 2048;
      id v16 = [v6 count];
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid update notification received for: %{public}@ with %lu applications", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (LibraryCatalogObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (LibraryCatalogObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end