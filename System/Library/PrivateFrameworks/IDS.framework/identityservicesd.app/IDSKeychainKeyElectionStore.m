@interface IDSKeychainKeyElectionStore
+ (BOOL)isItemNotFoundError:(id)a3;
- (BOOL)removeFullClusterWithIdentifier:(id)a3 error:(id *)a4;
- (IDSKeychainKeyElectionStore)initWithKeychainWrapper:(id)a3;
- (IDSKeychainWrapper)keychainWrapper;
- (id)_fullClusterFromData:(id)a3 error:(id *)a4;
- (id)_keychainEntryForCluster:(id)a3;
- (id)fetchFullClusterWithIdentifier:(id)a3 error:(id *)a4;
- (id)identifierForFullCluster:(id)a3;
- (void)_storeData:(id)a3 forIdentifier:(id)a4 completion:(id)a5;
- (void)storeFullCluster:(id)a3 completion:(id)a4;
@end

@implementation IDSKeychainKeyElectionStore

+ (BOOL)isItemNotFoundError:(id)a3
{
  return +[IDSKeychainWrapper isItemNotFoundError:a3];
}

- (id)identifierForFullCluster:(id)a3
{
  id v3 = a3;
  v4 = [v3 fullAccountIdentity];
  if (v4)
  {
    v5 = _IDSEngramKeyElectorVersion();
    v6 = [v4 publicName];
    v7 = +[NSString stringWithFormat:@"group-pai-%@-%@", v5, v6];
  }
  else
  {
    v8 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to get name for full account identity cluster {cluster: %{public}@}", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (IDSKeychainKeyElectionStore)initWithKeychainWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSKeychainKeyElectionStore;
  v6 = [(IDSKeychainKeyElectionStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychainWrapper, a3);
  }

  return v7;
}

- (id)fetchFullClusterWithIdentifier:(id)a3 error:(id *)a4
{
  v6 = a3;
  v7 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching cluster from keychain", buf, 2u);
  }

  v8 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setState keychainClusterIdentifier=%@", buf, 0xCu);
  }

  objc_super v9 = [(IDSKeychainKeyElectionStore *)self keychainWrapper];
  id v21 = 0;
  v10 = [v9 dataForIdentifier:v6 error:&v21];
  id v11 = v21;

  if (!v10)
  {
    v12 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      __int16 v24 = 2114;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to get keychain data {identifier: %{public}@, error: %{public}@}", buf, 0x16u);
    }
    goto LABEL_26;
  }
  id v20 = 0;
  v12 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v20];
  id v13 = v20;

  if (!v12)
  {
    v14 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1007103DC();
    }
    id v11 = v13;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = +[NSError errorWithDomain:@"IDSKeychainKeyElectionStoreErrorDomain" code:-1000 userInfo:0];

    v14 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1007104AC();
    }
    goto LABEL_25;
  }
  v14 = [v12 objectForKey:@"clusterData"];
  if (!v14)
  {
    id v11 = +[NSError errorWithDomain:@"IDSKeychainKeyElectionStoreErrorDomain" code:-1000 userInfo:0];

    v17 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100710444();
    }
    goto LABEL_24;
  }
  id v19 = v13;
  v15 = [(IDSKeychainKeyElectionStore *)self _fullClusterFromData:v14 error:&v19];
  id v11 = v19;

  v16 = +[IDSFoundationLog accountIdentity];
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v23 = v14;
      __int16 v24 = 2114;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to create fullClust from clusterData {clusterData: %{private}@, error: %{public}@}", buf, 0x16u);
    }
LABEL_24:

LABEL_25:
LABEL_26:

    if (a4)
    {
      id v11 = v11;
      v15 = 0;
      *a4 = v11;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Deserialized cluster", buf, 2u);
  }

LABEL_29:

  return v15;
}

- (void)storeFullCluster:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Storing cluster in Keychain {fullCluster: %{public}@}", buf, 0xCu);
  }

  id v21 = 0;
  objc_super v9 = [v6 dataRepresentationWithError:&v21];
  id v10 = v21;
  if (v9)
  {
    CFStringRef v28 = @"clusterData";
    v29 = v9;
    id v11 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v20 = 0;
    v12 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:200 options:0 error:&v20];
    id v13 = v20;

    if (v12)
    {
      v14 = [(IDSKeychainKeyElectionStore *)self identifierForFullCluster:v6];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000FBDC8;
      v17[3] = &unk_100980B08;
      id v18 = v6;
      id v19 = v7;
      [(IDSKeychainKeyElectionStore *)self _storeData:v12 forIdentifier:v14 completion:v17];
    }
    else
    {
      v16 = +[IDSFoundationLog accountIdentity];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        id v23 = v6;
        __int16 v24 = 2113;
        id v25 = v11;
        __int16 v26 = 2114;
        id v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to serialize cluster data {fullCluster: %{public}@, dictionary: %{private}@, error: %{public}@}", buf, 0x20u);
      }

      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
    }
  }
  else
  {
    v15 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to create data from cluster {fullCluster: %{public}@, error: %{public}@}", buf, 0x16u);
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
    id v13 = v10;
  }
}

- (void)_storeData:(id)a3 forIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IDSKeychainKeyElectionStore *)self keychainWrapper];
  [v11 saveData:v10 forIdentifier:v9 dataProtectionClass:1 withCompletion:v8];
}

- (BOOL)removeFullClusterWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing cluster from keychain", (uint8_t *)&v13, 2u);
  }

  id v8 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setState keychainClusterIdentifier=%@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [(IDSKeychainKeyElectionStore *)self keychainWrapper];
  unsigned __int8 v10 = [v9 removeDataForIdentifier:v6 dataProtectionClass:1 error:a4];

  if ((v10 & 1) == 0)
  {
    id v11 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100710514((uint64_t)v6, (uint64_t *)a4, v11);
    }
  }
  return v10;
}

- (id)_keychainEntryForCluster:(id)a3
{
  id v10 = 0;
  id v3 = [a3 dataRepresentationWithError:&v10];
  id v4 = v10;
  if (v3)
  {
    CFStringRef v11 = @"clusterData";
    v12 = v3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = 0;
    id v6 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v9];
    id v7 = v9;

    id v4 = v7;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_fullClusterFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v12 = 0;
  id v6 = +[IDSMPFullAccountIdentityCluster clusterWithDataRepresentation:v5 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  if (v6)
  {
    id v9 = v6;
  }
  else
  {
    id v10 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10071059C(a4, (uint64_t)v5, v10);
    }
  }

  return v6;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void).cxx_destruct
{
}

@end