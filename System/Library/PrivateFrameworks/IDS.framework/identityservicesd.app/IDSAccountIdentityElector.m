@interface IDSAccountIdentityElector
- (IDSAccountIdentityElector)initWithKeychainElectionStore:(id)a3 cloudKitElectionStore:(id)a4 groupServerElectionStore:(id)a5;
- (IDSCloudKitKeyElectionStore)cloudKitElectionStore;
- (IDSGroupServerKeyElectionStore)groupServerElectionStore;
- (IDSKeychainKeyElectionStore)keychainElectionStore;
- (id)_fullAccountIdentityWithError:(id *)a3;
- (id)_fullClusterWithAccountIdentityClusterWithAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6;
- (id)_fullServiceIdentityAdminWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (id)_fullServiceIdentitySigningWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (void)_cleanupFailedElectionWithFullAccountIdentityCluster:(id)a3;
- (void)_createAccountKeysWithFullAccountIdentity:(id)a3 serviceTypeNames:(id)a4 oldCluster:(id)a5 completion:(id)a6;
- (void)_getCurrentAccountClusterWithCompletion:(id)a3;
- (void)_getKeysForServiceTypeName:(id)a3 completion:(id)a4;
- (void)_rollAccountKeyWithFullCluster:(id)a3 completion:(id)a4;
- (void)getKeysForServiceTypeName:(id)a3 completion:(id)a4;
- (void)rollAccountKeyWithCompletion:(id)a3;
@end

@implementation IDSAccountIdentityElector

- (IDSAccountIdentityElector)initWithKeychainElectionStore:(id)a3 cloudKitElectionStore:(id)a4 groupServerElectionStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSAccountIdentityElector;
  v12 = [(IDSAccountIdentityElector *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keychainElectionStore, a3);
    objc_storeStrong((id *)&v13->_cloudKitElectionStore, a4);
    objc_storeStrong((id *)&v13->_groupServerElectionStore, a5);
  }

  return v13;
}

- (void)getKeysForServiceTypeName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "ElectAccountIdentity", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v10, &state);
  v8 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "!setState serviceTypeName=%@", buf, 0xCu);
  }

  [(IDSAccountIdentityElector *)self _getKeysForServiceTypeName:v6 completion:v7];
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)rollAccountKeyWithCompletion:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v9 = _os_activity_create((void *)&_mh_execute_header, "RollAccountKey", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v9, &state);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003185C;
  v6[3] = &unk_10097EBE8;
  id v5 = v4;
  v6[4] = self;
  id v7 = v5;
  [(IDSAccountIdentityElector *)self _getCurrentAccountClusterWithCompletion:v6];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_getKeysForServiceTypeName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031A3C;
  v9[3] = &unk_10097EC10;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(IDSAccountIdentityElector *)self _getCurrentAccountClusterWithCompletion:v9];
}

- (void)_getCurrentAccountClusterWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSAccountIdentityElector *)self cloudKitElectionStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031F94;
  v7[3] = &unk_10097EC38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAccountIdentityItemWithCompletion:v7];
}

- (void)_rollAccountKeyWithFullCluster:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 fullAccountIdentity];
  id v9 = [v6 fullServiceIdentitiesSigning];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      objc_super v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) identityServiceTypeName];
        [v10 addObject:v16];

        objc_super v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100032454;
  v18[3] = &unk_10097EC60;
  id v19 = v7;
  id v17 = v7;
  [(IDSAccountIdentityElector *)self _createAccountKeysWithFullAccountIdentity:v8 serviceTypeNames:v10 oldCluster:v6 completion:v18];
}

- (void)_createAccountKeysWithFullAccountIdentity:(id)a3 serviceTypeNames:(id)a4 oldCluster:(id)a5 completion:(id)a6
{
  id v72 = a3;
  id v71 = a4;
  id v10 = a5;
  v70 = (void (**)(id, void, uint64_t))a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v104 = _os_activity_create((void *)&_mh_execute_header, "Create account keys", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v104, &state);
  id v11 = +[IDSFoundationLog accountIdentity];
  v73 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Create Account Key", buf, 2u);
  }

  id v12 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v106 = v72;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "!setState currentIdentity=%@", buf, 0xCu);
  }

  id v13 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v106 = v71;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "!setState serviceTypeNames=%@", buf, 0xCu);
  }

  uint64_t v14 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v106 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "!setState oldCluster=%@", buf, 0xCu);
  }

  if (v72)
  {
    objc_super v15 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Rolling full identity", buf, 2u);
    }

    uint64_t v102 = 0;
    v16 = (id *)&v102;
    uint64_t v17 = [v72 rolledAccountIdenityWithError:&v102];
  }
  else
  {
    v18 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Creating new full identity", buf, 2u);
    }

    uint64_t v101 = 0;
    v16 = (id *)&v101;
    uint64_t v17 = [(IDSAccountIdentityElector *)self _fullAccountIdentityWithError:&v101];
  }
  id v19 = (void *)v17;
  id v20 = *v16;
  long long v21 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v106 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "!setState newAccountIdentity=%@", buf, 0xCu);
  }

  if (v19)
  {
    id v75 = objc_alloc_init((Class)NSMutableArray);
    id v74 = objc_alloc_init((Class)NSMutableArray);
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v22 = v71;
    long long v23 = (char *)[v22 countByEnumeratingWithState:&v97 objects:v109 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v98;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(void *)v98 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = IDSMPServiceIdentityTypeForName();
          id v96 = v20;
          v27 = [(IDSAccountIdentityElector *)self _fullServiceIdentityAdminWithAccountIdentity:v19 type:v26 error:&v96];
          id v28 = v96;

          if (!v27)
          {
            v35 = +[IDSFoundationLog accountIdentity];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v106 = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to create adming identity -- Fail {adminServiceIdentity: %{public}@}", buf, 0xCu);
            }

            v70[2](v70, 0, 131073);
            goto LABEL_70;
          }
          id v95 = v28;
          v29 = [(IDSAccountIdentityElector *)self _fullServiceIdentitySigningWithAccountIdentity:v19 type:v26 error:&v95];
          id v20 = v95;

          if (!v29)
          {
            v36 = +[IDSFoundationLog accountIdentity];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v106 = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Failed to create signingServiceIdenitty -- Fail {signingServiceIdentity: %{public}@}", buf, 0xCu);
            }

            v70[2](v70, 0, 131074);
            goto LABEL_69;
          }
          [v75 addObject:v27];
          [v74 addObject:v29];
        }
        long long v23 = (char *)[v22 countByEnumeratingWithState:&v97 objects:v109 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    v30 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v106 = v75;
      __int16 v107 = 2114;
      id v108 = v74;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Created service identities {fullServiceAdminIdentities: %{public}@, fullServiceSigningIdentities: %{public}@}", buf, 0x16u);
    }

    if (v73)
    {
      v31 = +[IDSFoundationLog accountIdentity];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Rolling old cluster", buf, 2u);
      }

      id v94 = v20;
      v32 = &v94;
      uint64_t v33 = [v73 rolledClusterWithFullAccountIdentity:v19 fullAdminServiceIdentities:v75 fullSigningServiceIdentities:v74 error:&v94];
    }
    else
    {
      v37 = +[IDSFoundationLog accountIdentity];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Creating new cluster", buf, 2u);
      }

      id v93 = v20;
      v32 = &v93;
      uint64_t v33 = [(IDSAccountIdentityElector *)self _fullClusterWithAccountIdentityClusterWithAccountIdentity:v19 fullAdminServiceIdentities:v75 fullSigningServiceIdentities:v74 error:&v93];
    }
    id v22 = (id)v33;
    id v38 = *v32;

    v39 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v106 = v22;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "!setState newCluster=%@", buf, 0xCu);
    }

    if (v73 && ([v73 isParentOfCluster:v22] & 1) == 0) {
      __assert_rtn("-[IDSAccountIdentityElector _createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:]", "IDSAccountIdentityElector.m", 262, "[oldCluster isParentOfCluster:newCluster]");
    }
    v40 = [(IDSAccountIdentityElector *)self keychainElectionStore];
    v27 = [v40 identifierForFullCluster:v73];

    v41 = [(IDSAccountIdentityElector *)self keychainElectionStore];
    v68 = [v41 identifierForFullCluster:v22];

    v42 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v106 = v27;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "!setState existingIdentityGroupName=%@", buf, 0xCu);
    }

    v43 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v106 = v68;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "!setState accountIdentityGroupName=%@", buf, 0xCu);
    }

    id v92 = v38;
    v44 = [v22 publicAccountClusterWithError:&v92];
    id v45 = v92;

    if (!v44) {
      __assert_rtn("-[IDSAccountIdentityElector _createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:]", "IDSAccountIdentityElector.m", 271, "newPublicCluster");
    }
    id v91 = v45;
    v69 = [v44 dataRepresentationWithError:&v91];
    id v20 = v91;

    if (v69)
    {
      v67 = [v22 groupID];
      id v46 = [v73 publicKey];
      v66 = [v22 forwardingTicket];
      id v90 = v20;
      v65 = [v22 signData:v69 withError:&v90];
      id v60 = v90;

      id v64 = [v22 publicKey];
      v47 = v73;
      if (v73)
      {
        v48 = [v73 groupID];
        v63 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (int)[v48 generation]);

        v49 = [v22 groupID];
        v50 = [v49 stableGroupID];
        v62 = [v50 dataRepresentation];

        v47 = v73;
      }
      else
      {
        v62 = 0;
        v63 = 0;
      }
      v52 = +[IDSFoundationLog accountIdentity];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v106 = v67;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "!setState newGroupID=%@", buf, 0xCu);
      }

      if (v47)
      {
        v53 = [v73 publicAccountClusterWithError:0];
        if (([v53 isParentOfCluster:v44] & 1) == 0) {
          __assert_rtn("-[IDSAccountIdentityElector _createAccountKeysWithFullAccountIdentity:serviceTypeNames:oldCluster:completion:]", "IDSAccountIdentityElector.m", 298, "[oldPublicCluster isParentOfCluster:newPublicCluster]");
        }
      }
      v54 = [(IDSAccountIdentityElector *)self cloudKitElectionStore];
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100033350;
      v76[3] = &unk_10097ED00;
      v76[4] = self;
      id v77 = v22;
      v87 = v70;
      id v78 = v27;
      id v79 = v69;
      id v55 = v65;
      id v80 = v55;
      id v56 = v67;
      id v81 = v56;
      id v57 = v66;
      id v82 = v57;
      id v88 = v46;
      id v89 = v64;
      id v58 = v63;
      id v83 = v58;
      id v59 = v62;
      id v84 = v59;
      id v85 = v68;
      id v86 = v73;
      [v54 fetchAccountIdentityItemWithCompletion:v76];

      id v20 = v61;
    }
    else
    {
      v51 = +[IDSFoundationLog accountIdentity];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v106 = v20;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Failed to create publicClusterBlob -- Fail {error: %{public}@}", buf, 0xCu);
      }

      [(IDSAccountIdentityElector *)self _cleanupFailedElectionWithFullAccountIdentityCluster:v22];
      v70[2](v70, 0, 131075);
    }

LABEL_69:
    id v28 = v20;
LABEL_70:

    id v20 = v28;
  }
  else
  {
    v34 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v106 = v20;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Failed to create new account identity -- Fail {error: %{public}@}", buf, 0xCu);
    }

    v70[2](v70, 0, 0x20000);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_cleanupFailedElectionWithFullAccountIdentityCluster:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog accountIdentity];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up after failed election {cluster %{public}@}", buf, 0xCu);
  }

  id v6 = [(IDSAccountIdentityElector *)self keychainElectionStore];
  id v7 = [v6 identifierForFullCluster:v4];

  id v8 = [(IDSAccountIdentityElector *)self keychainElectionStore];
  id v12 = 0;
  unsigned __int8 v9 = [v8 removeFullClusterWithIdentifier:v7 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    id v11 = +[IDSFoundationLog accountIdentity];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to clean up failed election {cluster: %{public}@, error: %{error}@}", buf, 0x16u);
    }
  }
}

- (id)_fullAccountIdentityWithError:(id *)a3
{
  return +[IDSMPFullAccountIdentity fullAccountIdentityWithError:a3];
}

- (id)_fullServiceIdentityAdminWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  return +[IDSMPFullServiceIdentityAdmin fullServiceIdentityWithFullAccountIdentity:a3 type:a4 error:a5];
}

- (id)_fullServiceIdentitySigningWithAccountIdentity:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  return +[IDSMPFullServiceIdentitySigning fullServiceIdentityWithFullAccountIdentity:a3 type:a4 error:a5];
}

- (id)_fullClusterWithAccountIdentityClusterWithAccountIdentity:(id)a3 fullAdminServiceIdentities:(id)a4 fullSigningServiceIdentities:(id)a5 error:(id *)a6
{
  return +[IDSMPFullAccountIdentityCluster clusterWithFullAccountIdentity:a3 fullAdminServiceIdentities:a4 fullSigningServiceIdentities:a5 error:a6];
}

- (IDSKeychainKeyElectionStore)keychainElectionStore
{
  return self->_keychainElectionStore;
}

- (IDSCloudKitKeyElectionStore)cloudKitElectionStore
{
  return self->_cloudKitElectionStore;
}

- (IDSGroupServerKeyElectionStore)groupServerElectionStore
{
  return self->_groupServerElectionStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupServerElectionStore, 0);
  objc_storeStrong((id *)&self->_cloudKitElectionStore, 0);

  objc_storeStrong((id *)&self->_keychainElectionStore, 0);
}

@end