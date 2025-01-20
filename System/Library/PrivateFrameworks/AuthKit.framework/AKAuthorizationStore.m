@interface AKAuthorizationStore
- (AKAuthorizationStore)init;
- (AKAuthorizationStore)initWithExecutor:(id)a3;
- (AKAuthorizationStore)initWithPath:(id)a3;
- (AKSQLiteExecutor)executor;
- (BOOL)_shouldUpdateDatabaseToListVersion:(id)a3 withAltDSID:(id)a4;
- (id)_fetchAllAuthorizedClientIDs;
- (id)_fetchAppMetadataForClientID:(id)a3;
- (id)_fetchApplicationsForTeamID:(id)a3;
- (id)_handleRevokedApplicationsForVersion:(id)a3;
- (id)_optionalValueWithString:(id)a3;
- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3;
- (void)_addTemporaryDeveloperTeam:(id)a3;
- (void)_postApplicationsListChangedNotification;
- (void)_setDatabaseVersionWithAltDSID:(id)a3 toVersion:(int64_t)a4;
- (void)_storeConsentedApplication:(id)a3 teamID:(id)a4 listVersion:(id)a5;
- (void)_storeDeveloperTeam:(id)a3 listVersion:(id)a4;
- (void)_storePrimaryAppAMSMetadata:(id)a3;
- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4;
- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4;
- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)perform:(id)a3;
- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)setExecutor:(id)a3;
- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4;
- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5;
- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5;
- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5;
@end

@implementation AKAuthorizationStore

- (AKAuthorizationStore)init
{
  return [(AKAuthorizationStore *)self initWithPath:@"/Library/Application Support/com.apple.akd/authorization.db"];
}

- (AKAuthorizationStore)initWithExecutor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationStore;
  v6 = [(AKAuthorizationStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_executor, a3);
  }

  return v7;
}

- (AKAuthorizationStore)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationStore;
  id v5 = [(AKAuthorizationStore *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(AKAuthorizationStoreMigrator);
    v7 = [[AKSQLiteExecutor alloc] initWithDatabasePath:v4 migrationController:v6];
    executor = v5->_executor;
    v5->_executor = v7;
  }
  return v5;
}

- (void)perform:(id)a3
{
}

- (void)updateAuthorizationListWithMetadataInfo:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void *, void))a5;
  v11 = [v8 authorizedAppListVersion];
  if ([(AKAuthorizationStore *)self _shouldUpdateDatabaseToListVersion:v11 withAltDSID:v9])
  {
    v12 = [(AKAuthorizationStore *)self _fetchAllAuthorizedClientIDs];
    v13 = +[NSMutableSet setWithArray:v12];

    v14 = [v8 teams];
    v15 = [v14 allValues];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_100079740;
    v25 = &unk_100229870;
    id v16 = v13;
    id v26 = v16;
    v27 = self;
    id v17 = v11;
    id v28 = v17;
    [v15 enumerateObjectsUsingBlock:&v22];

    v18 = -[AKAuthorizationStore _handleRevokedApplicationsForVersion:](self, "_handleRevokedApplicationsForVersion:", v17, v22, v23, v24, v25);
    [(AKAuthorizationStore *)self setListVersionToVersion:v17 withAltDSID:v9];
    v29[0] = &off_10023B038;
    v19 = [v16 allObjects];
    v29[1] = &off_10023B050;
    v30[0] = v19;
    v30[1] = v18;
    v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

    if (v10) {
      v10[2](v10, v20, 0);
    }
    [(AKAuthorizationStore *)self _postApplicationsListChangedNotification];
  }
  else
  {
    v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100188CA8(v21);
    }

    if (v10) {
      v10[2](v10, 0, 0);
    }
  }
}

- (void)updatePrimaryAppsWithAMSAppMetadata:(id)a3 withAltDSID:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, void))a5;
  if ([v7 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100079994;
    v10[3] = &unk_100229898;
    v10[4] = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
  else if (v8)
  {
    id v9 = +[NSError errorWithDomain:AKSQLErrorDomain code:-6002 userInfo:0];
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v9);
  }
}

- (void)fetchAllPrimaryApplicationMetadataForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[AKSQLiteQuery queryWithString:@"SELECT client_id, app_name, app_developer_name, adam_id FROM authorized_primary_applications"];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000F900;
  id v26 = sub_10000F7D0;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000F900;
  v20 = sub_10000F7D0;
  id v21 = objc_alloc_init((Class)NSMutableArray);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079C28;
  v15[3] = &unk_100226D80;
  v15[4] = &v16;
  [v8 setRowHandler:v15];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100079D3C;
  v10[3] = &unk_100226DA8;
  objc_copyWeak(&v13, &location);
  id v9 = v8;
  id v11 = v9;
  v12 = &v22;
  +[AKSQLiteExecutor performBlockAndWait:v10];
  if (v23[5]) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v17[5]);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)_postApplicationsListChangedNotification
{
  v2 = +[AKFeatureManager sharedManager];
  unsigned int v3 = [v2 isSiwaInPasswordsFeatureEnabled];

  if (v3)
  {
    id v4 = +[NSDistributedNotificationCenter defaultCenter];
    [v4 postNotificationName:AKSignInWithAppleAccountsListChangedNotification object:0 userInfo:0 deliverImmediately:1];
  }
}

- (void)storeAuthorization:(id)a3 withAltDSID:(id)a4 forClient:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 authorizedRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [v8 bundleID];
    if (v11
      && (v12 = (void *)v11,
          [v8 teamID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      v14 = [v7 authorizedRequest];
      v15 = [v7 credential];
      id v16 = objc_alloc_init((Class)AKDeveloperTeam);
      id v17 = [v8 teamID];
      [v16 setTeamID:v17];

      uint64_t v18 = [v15 userIdentifier];
      [v16 setUserIdentifier:v18];

      id v19 = objc_alloc_init((Class)AKConsentedApplication);
      v20 = [v8 bundleID];
      [v19 setClientID:v20];

      id v21 = [v14 requestedScopes];
      [v19 setScopes:v21];

      uint64_t v22 = [v8 bundleID];
      uint64_t v24 = v22;
      id v25 = v19;
      uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v16 setApps:v23];

      [(AKAuthorizationStore *)self _addTemporaryDeveloperTeam:v16];
    }
    else
    {
      v14 = _AKLogSiwa();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100188CEC(v14);
      }
    }
  }
  else
  {
    v14 = _AKLogSiwa();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100188D30(v14);
    }
  }
}

- (void)fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void))a5;
  if (v8)
  {
    uint64_t v11 = +[AKSQLiteQuery queryWithString:@"SELECT team_id, uid FROM authorized_teams WHERE team_id = ?"];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_10000F900;
    v39 = sub_10000F7D0;
    id v40 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_10000F900;
    v33 = sub_10000F7D0;
    id v34 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = sub_10000F900;
    id v27 = sub_10000F7D0;
    id v28 = 0;
    id obj = 0;
    [v11 bindParameter:v8 error:&obj];
    objc_storeStrong(&v40, obj);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10007A4B8;
    v21[3] = &unk_1002298C0;
    v21[4] = &v29;
    v21[5] = &v23;
    [v11 setRowHandler:v21];
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007A564;
    v16[3] = &unk_100226DA8;
    objc_copyWeak(&v19, &location);
    id v12 = v11;
    id v17 = v12;
    uint64_t v18 = &v35;
    +[AKSQLiteExecutor performBlockAndWait:v16];
    if (v36[5])
    {
      v10[2](v10, 0);
    }
    else
    {
      if (v30[5] || v24[5])
      {
        id v14 = objc_alloc_init((Class)AKDeveloperTeam);
        [v14 setTeamID:v30[5]];
        [v14 setUserIdentifier:v24[5]];
        v15 = [(AKAuthorizationStore *)self _fetchApplicationsForTeamID:v8];
        [v14 setApps:v15];

        ((void (*)(void (**)(id, void), id, void))v10[2])(v10, v14, 0);
      }
      else
      {
        id v14 = +[NSError errorWithDomain:AKSQLErrorDomain code:-6003 userInfo:0];
        ((void (*)(void (**)(id, void), void, id))v10[2])(v10, 0, v14);
      }
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v13 = +[NSError errorWithDomain:AKSQLErrorDomain code:-6002 userInfo:0];
    ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0, v13);
  }
}

- (void)fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void))a5;
  if (v8)
  {
    uint64_t v11 = +[AKSQLiteQuery queryWithString:@"SELECT team_id FROM authorized_applications WHERE client_id = ?"];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    uint64_t v35 = sub_10000F900;
    v36 = sub_10000F7D0;
    id v37 = 0;
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = sub_10000F900;
    v30 = sub_10000F7D0;
    id v31 = 0;
    id obj = 0;
    [v11 bindParameter:v8 error:&obj];
    objc_storeStrong(&v37, obj);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10007A91C;
    v24[3] = &unk_100226D80;
    v24[4] = &v26;
    [v11 setRowHandler:v24];
    objc_initWeak(&location, self);
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_10007A984;
    id v19 = &unk_100226DA8;
    objc_copyWeak(&v22, &location);
    id v12 = v11;
    id v20 = v12;
    id v21 = &v32;
    +[AKSQLiteExecutor performBlockAndWait:&v16];
    if (v33[5])
    {
      v10[2](v10, 0);
    }
    else
    {
      uint64_t v14 = v27[5];
      if (v14)
      {
        -[AKAuthorizationStore fetchDeveloperTeamWithTeamID:withAltDSID:completion:](self, "fetchDeveloperTeamWithTeamID:withAltDSID:completion:", v14, v9, v10, v16, v17, v18, v19);
      }
      else
      {
        v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AKSQLErrorDomain, -6003, 0, v16, v17, v18, v19);
        ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0, v15);
      }
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v13 = +[NSError errorWithDomain:AKSQLErrorDomain code:-6002 userInfo:0];
    ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0, v13);
  }
}

- (void)performUnsafeVerificationWithUserID:(id)a3 withAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void))a5;
  uint64_t v11 = +[AKSQLiteQuery queryWithString:@"SELECT team_id FROM authorized_teams WHERE uid = ?"];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10000F900;
  v24[4] = sub_10000F7D0;
  id v25 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id obj = 0;
  [v11 bindParameter:v8 error:&obj];
  objc_storeStrong(&v25, obj);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007AC5C;
  v18[3] = &unk_100226D80;
  v18[4] = &v20;
  [v11 setRowHandler:v18];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007ACB8;
  v13[3] = &unk_100226DA8;
  objc_copyWeak(&v16, &location);
  id v12 = v11;
  id v14 = v12;
  v15 = v24;
  +[AKSQLiteExecutor performBlockAndWait:v13];
  v10[2](v10, *((unsigned __int8 *)v21 + 24));

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[AKSQLiteQuery queryWithString:@"UPDATE authorized_applications SET credential_state = ? WHERE client_id = ?"];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = sub_10000F900;
    id v25 = sub_10000F7D0;
    id v26 = 0;
    id v9 = +[NSNumber numberWithInt:0];
    objc_super v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v6, 0);
    uint64_t v11 = (id *)(v22 + 5);
    id obj = (id)v22[5];
    [v8 bindParameters:v10 error:&obj];
    objc_storeStrong(v11, obj);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007AFAC;
    v15[3] = &unk_100226DA8;
    objc_copyWeak(&v18, &location);
    id v12 = v8;
    id v16 = v12;
    uint64_t v17 = &v21;
    +[AKSQLiteExecutor performBlockAndWait:v15];
    id v13 = (void (*)(void *, uint64_t))v7[2];
    if (v22[5]) {
      v13(v7, 0);
    }
    else {
      v13(v7, 1);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v14 = +[NSError errorWithDomain:AKSQLErrorDomain code:-6002 userInfo:0];
    ((void (*)(void *, void, void *))v7[2])(v7, 0, v14);
  }
}

- (void)removeApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL, void))a4;
  if (v6)
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to delete application with clientID: %@ from DB", (uint8_t *)&buf, 0xCu);
    }

    id v9 = +[AKSQLiteQuery queryWithString:@"DELETE FROM authorized_applications WHERE client_id = ?"];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x3032000000;
    id v26 = sub_10000F900;
    id v27 = sub_10000F7D0;
    id v28 = 0;
    id obj = 0;
    [v9 bindParameter:v6 error:&obj];
    objc_storeStrong(&v28, obj);
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007B360;
    v16[3] = &unk_100226DA8;
    objc_copyWeak(&v19, &location);
    id v10 = v9;
    id v17 = v10;
    p_long long buf = &buf;
    +[AKSQLiteExecutor performBlockAndWait:v16];
    uint64_t v11 = *(void *)(*((void *)&buf + 1) + 40);
    if (v11)
    {
      id v12 = _AKLogSiwa();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100188D74((uint64_t)v6, (uint64_t)&buf + 8, v12);
      }

      uint64_t v13 = *(void *)(*((void *)&buf + 1) + 40);
    }
    else
    {
      v15 = _AKLogSiwa();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v22 = 138412290;
        id v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Application with clientID: %@ removed from database successfully", v22, 0xCu);
      }

      uint64_t v13 = 0;
    }
    v7[2](v7, v11 == 0, v13);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v14 = +[NSError errorWithDomain:AKSQLErrorDomain code:-6002 userInfo:0];
    ((void (**)(id, BOOL, void *))v7)[2](v7, 0, v14);
  }
}

- (void)revokeAuthorizationForAllApplicationsWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = +[AKSQLiteQuery queryWithString:@"UPDATE authorized_applications SET credential_state = ?, authorizedAppListVersion = 'TEMPORARY'"];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10000F900;
  id v28 = sub_10000F7D0;
  id v29 = 0;
  id v9 = +[NSNumber numberWithInt:0];
  id v10 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  [v8 bindParameter:v9 error:&obj];
  objc_storeStrong(v10, obj);

  uint64_t v11 = [(AKAuthorizationStore *)self _fetchAllAuthorizedClientIDs];
  objc_initWeak(&location, self);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10007B6B4;
  id v18 = &unk_100226DA8;
  objc_copyWeak(&v21, &location);
  id v12 = v8;
  id v19 = v12;
  uint64_t v20 = &v24;
  +[AKSQLiteExecutor performBlockAndWait:&v15];
  if (v25[5])
  {
    uint64_t v13 = _AKLogSiwa();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100188E04();
    }

    if (v7) {
      v7[2](v7, 0, v25[5]);
    }
  }
  else
  {
    v30 = &off_10023B050;
    id v31 = v11;
    id v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v15, v16, v17, v18);
    if (v7) {
      ((void (**)(id, void *, uint64_t))v7)[2](v7, v14, 0);
    }
    [(AKAuthorizationStore *)self _postApplicationsListChangedNotification];
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v24, 8);
}

- (void)fetchAllDeveloperTeamsAndApplicationsForAltDSID:(id)a3 withCompletion:(id)a4
{
  id v17 = a3;
  id v18 = (void (**)(id, void, uint64_t))a4;
  id v6 = +[AKSQLiteQuery queryWithString:@"SELECT team_id, uid, private_email FROM authorized_teams"];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10000F900;
  v39 = sub_10000F7D0;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_10000F900;
  v33 = sub_10000F7D0;
  id v34 = objc_alloc_init((Class)NSMutableArray);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10007BB1C;
  v28[3] = &unk_100226D80;
  v28[4] = &v29;
  [v6 setRowHandler:v28];
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10007BC00;
  v23[3] = &unk_100226DA8;
  objc_copyWeak(&v26, &location);
  id v7 = v6;
  id v24 = v7;
  uint64_t v25 = &v35;
  +[AKSQLiteExecutor performBlockAndWait:v23];
  if (v36[5])
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100188E6C();
    }

    v18[2](v18, 0, v36[5]);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = (id)v30[5];
    id v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v41, 16, v17);
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [v13 teamID];
          v15 = [(AKAuthorizationStore *)self _fetchApplicationsForTeamID:v14];
          [v13 setApps:v15];
        }
        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v41 count:16];
      }
      while (v10);
    }

    id v16 = [(id)v30[5] copy];
    ((void (**)(id, id, uint64_t))v18)[2](v18, v16, 0);
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

- (id)_fetchAppMetadataForClientID:(id)a3
{
  id v4 = a3;
  id v5 = +[AKSQLiteQuery queryWithString:@"SELECT client_id, app_name, app_developer_name, adam_id FROM authorized_primary_applications WHERE client_id = ?"];
  uint64_t v24 = 0;
  uint64_t v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10000F900;
  id v28 = sub_10000F7D0;
  id v29 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = sub_10000F900;
  long long v22 = sub_10000F7D0;
  id v23 = objc_alloc_init((Class)AKAppiTunesMetadata);
  id v6 = v25;
  id obj = v25[5];
  [v5 bindParameter:v4 error:&obj];
  objc_storeStrong(v6 + 5, obj);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007BF40;
  v16[3] = &unk_100226D80;
  void v16[4] = &v18;
  [v5 setRowHandler:v16];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007C050;
  v11[3] = &unk_100226DA8;
  objc_copyWeak(&v14, &location);
  id v7 = v5;
  id v12 = v7;
  uint64_t v13 = &v24;
  +[AKSQLiteExecutor performBlockAndWait:v11];
  if (v25[5])
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100188ED4();
    }
  }
  id v9 = (id)v19[5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v9;
}

- (void)_addTemporaryDeveloperTeam:(id)a3
{
}

- (BOOL)_shouldUpdateDatabaseToListVersion:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = [(AKAuthorizationStore *)self fetchAuthorizationListVersionWithAltDSID:a4];
  LOBYTE(self) = [v6 isEqualToString:v7];

  return self ^ 1;
}

- (void)_storeDeveloperTeam:(id)a3 listVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKSQLiteQuery queryWithString:@"INSERT OR REPLACE INTO authorized_teams (team_id, uid, private_email) VALUES (?, ?,?)"];
  id v9 = [v6 teamID];
  id v10 = [v6 userIdentifier];
  uint64_t v11 = [v6 privateEmail];
  id v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v10, v11, 0);

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10000F900;
  id v29 = sub_10000F7D0;
  id v30 = 0;
  id obj = 0;
  [v8 bindParameters:v12 error:&obj];
  objc_storeStrong(&v30, obj);
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007C424;
  v19[3] = &unk_100226DA8;
  objc_copyWeak(&v22, &location);
  id v13 = v8;
  id v20 = v13;
  long long v21 = &v25;
  +[AKSQLiteExecutor performBlockAndWait:v19];
  if (v26[5])
  {
    id v14 = _AKLogSiwa();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100188F3C();
    }
  }
  else
  {
    v15 = [v6 apps];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007C498;
    v16[3] = &unk_1002298E8;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [v15 enumerateKeysAndObjectsUsingBlock:v16];
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);
}

- (void)_storeConsentedApplication:(id)a3 teamID:(id)a4 listVersion:(id)a5
{
  id v8 = a3;
  id v28 = a4;
  id v27 = a5;
  id v9 = [v8 scopes];
  id v10 = [v9 componentsJoinedByString:@","];
  uint64_t v26 = [(AKAuthorizationStore *)self _optionalValueWithString:v10];

  uint64_t v11 = [v8 transferState];
  uint64_t v25 = [(AKAuthorizationStore *)self _optionalValueWithString:v11];

  id v12 = [v8 primaryClientID];
  id v13 = [(AKAuthorizationStore *)self _optionalValueWithString:v12];

  id v14 = [v8 origin];
  v15 = [(AKAuthorizationStore *)self _optionalValueWithString:v14];

  id v16 = +[NSNumber numberWithInt:1];
  id v17 = [v8 clientName];
  id v18 = [(AKAuthorizationStore *)self _optionalValueWithString:v17];

  long long v19 = +[AKSQLiteQuery queryWithString:@"INSERT OR REPLACE INTO authorized_applications (client_id, team_id, scopes, origin, credential_state, transfer_state, primary_client_id, authorizedAppListVersion, creation_date, client_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"];
  id v20 = [v8 clientID];
  long long v21 = [v8 creationDate];
  id v22 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v28, v26, v15, v16, v25, v13, v27, v21, v18, 0);

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10000F900;
  v39 = sub_10000F7D0;
  id v40 = 0;
  id v34 = 0;
  [v19 bindParameters:v22 error:&v34];
  objc_storeStrong(&v40, v34);
  objc_initWeak(&location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  void v29[2] = sub_10007C8B8;
  v29[3] = &unk_100226DA8;
  objc_copyWeak(&v32, &location);
  id v23 = v19;
  id v30 = v23;
  uint64_t v31 = &v35;
  +[AKSQLiteExecutor performBlockAndWait:v29];
  if (v36[5])
  {
    uint64_t v24 = _AKLogSiwa();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100188FA4();
    }
  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v35, 8);
}

- (void)_storePrimaryAppAMSMetadata:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018907C(v4, v5);
  }

  id v6 = [v4 bundleId];
  long long v19 = [(AKAuthorizationStore *)self _optionalValueWithString:v6];

  id v7 = [v4 appName];
  id v8 = [(AKAuthorizationStore *)self _optionalValueWithString:v7];

  id v9 = [v4 appDeveloperName];
  id v10 = [(AKAuthorizationStore *)self _optionalValueWithString:v9];

  uint64_t v11 = [v4 adamID];
  id v12 = [(AKAuthorizationStore *)self _optionalValueWithString:v11];

  id v13 = +[AKSQLiteQuery queryWithString:@"INSERT OR REPLACE INTO authorized_primary_applications (client_id, app_name, app_developer_name, adam_id) VALUES (?, ?, ?, ?)"];
  uint64_t v26 = 0;
  v27[0] = &v26;
  v27[1] = 0x3032000000;
  v27[2] = sub_10000F900;
  v27[3] = sub_10000F7D0;
  id v28 = 0;
  id v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v8, v10, v12, 0);
  v15 = (id *)(v27[0] + 40);
  id obj = *(id *)(v27[0] + 40);
  [v13 bindParameters:v14 error:&obj];
  objc_storeStrong(v15, obj);
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007CC64;
  v20[3] = &unk_100226DA8;
  objc_copyWeak(&v23, &location);
  id v16 = v13;
  id v21 = v16;
  id v22 = &v26;
  +[AKSQLiteExecutor performBlockAndWait:v20];
  if (*(void *)(v27[0] + 40))
  {
    id v17 = _AKLogSiwa();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v4 bundleId];
      sub_10018900C(v18, (uint64_t)v27, buf, v17);
    }
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v26, 8);
}

- (id)_handleRevokedApplicationsForVersion:(id)a3
{
  id v4 = a3;
  id v5 = +[AKSQLiteQuery queryWithString:@"SELECT client_id FROM authorized_applications WHERE authorizedAppListVersion != ? AND authorizedAppListVersion != 'TEMPORARY'"];
  uint64_t v33 = 0;
  id v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_10000F900;
  uint64_t v37 = sub_10000F7D0;
  id v38 = 0;
  id v6 = +[NSMutableArray array];
  id v7 = v34;
  id v32 = v34[5];
  [v5 bindParameter:v4 error:&v32];
  objc_storeStrong(v7 + 5, v32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  void v30[2] = sub_10007D0C0;
  v30[3] = &unk_100226DD0;
  id v8 = v6;
  id v31 = v8;
  [v5 setRowHandler:v30];
  id v9 = +[AKSQLiteQuery queryWithString:@"UPDATE authorized_applications SET credential_state = ?, authorizedAppListVersion = ? WHERE authorizedAppListVersion != ?"];
  id v10 = +[NSNumber numberWithInt:0];
  uint64_t v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v4, v4, 0);
  id v12 = v34;
  id obj = v34[5];
  [v9 bindParameters:v11 error:&obj];
  objc_storeStrong(v12 + 5, obj);
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10007D124;
  v24[3] = &unk_100226DA8;
  objc_copyWeak(&v27, &location);
  id v13 = v5;
  id v25 = v13;
  uint64_t v26 = &v33;
  +[AKSQLiteExecutor performBlockAndWait:v24];
  if (v34[5])
  {
    id v14 = _AKLogSiwa();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100189180();
    }
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007D198;
  v20[3] = &unk_100226DA8;
  objc_copyWeak(&v23, &location);
  id v15 = v9;
  id v21 = v15;
  id v22 = &v33;
  +[AKSQLiteExecutor performBlockAndWait:v20];
  if (v34[5])
  {
    id v16 = _AKLogSiwa();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100189118();
    }
  }
  id v17 = v21;
  id v18 = v8;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v33, 8);

  return v18;
}

- (id)_fetchApplicationsForTeamID:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10000F900;
  id v29 = sub_10000F7D0;
  id v30 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[AKSQLiteQuery queryWithString:@"SELECT client_id, scopes, credential_state, transfer_state, primary_client_id, origin, creation_date, client_name FROM authorized_applications WHERE team_id = ?"];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10000F900;
  id v23 = sub_10000F7D0;
  id v24 = 0;
  id obj = 0;
  [v5 bindParameter:v4 error:&obj];
  objc_storeStrong(&v24, obj);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007D52C;
  v17[3] = &unk_100226D80;
  v17[4] = &v25;
  [v5 setRowHandler:v17];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007D784;
  v12[3] = &unk_100226DA8;
  objc_copyWeak(&v15, &location);
  id v6 = v5;
  id v13 = v6;
  id v14 = &v19;
  +[AKSQLiteExecutor performBlockAndWait:v12];
  id v7 = (void *)v26[5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007D7F8;
  v11[3] = &unk_100229910;
  void v11[4] = self;
  v11[5] = &v25;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  if (v20[5])
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001891E8();
    }
  }
  id v9 = [(id)v26[5] copy];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v9;
}

- (id)_optionalValueWithString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = @"NULL";
  }

  return v5;
}

- (id)_fetchAllAuthorizedClientIDs
{
  id v3 = +[AKSQLiteQuery queryWithString:@"SELECT client_id FROM authorized_applications WHERE credential_state = ?"];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_10000F900;
  uint64_t v26 = sub_10000F7D0;
  id v27 = 0;
  id v4 = +[NSNumber numberWithInt:1];
  id v5 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  [v3 bindParameter:v4 error:&obj];
  objc_storeStrong(v5, obj);
  +[NSMutableArray array];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007DB78;
  v19[3] = &unk_100226DD0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v6;
  [v3 setRowHandler:v19];
  objc_initWeak(&location, self);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10007DBE4;
  id v14 = &unk_100226DA8;
  objc_copyWeak(&v17, &location);
  id v7 = v3;
  id v15 = v7;
  id v16 = &v22;
  +[AKSQLiteExecutor performBlockAndWait:&v11];
  if (v23[5])
  {
    id v8 = _AKLogSiwa();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100189250();
    }
  }
  id v9 = objc_msgSend(v6, "copy", v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v22, 8);

  return v9;
}

- (id)fetchAuthorizationListVersionWithAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10000F900;
  id v18 = sub_10000F7D0;
  id v19 = 0;
  id v5 = +[NSString stringWithFormat:@"SELECT authorizedAppListVersion FROM version;"];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007DDF8;
  v9[3] = &unk_100226DA8;
  objc_copyWeak(&v12, &location);
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = &v14;
  +[AKSQLiteExecutor performBlockAndWait:v9];
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)setListVersionToVersion:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKSQLiteQuery queryWithString:@"UPDATE version SET authorizedAppListVersion = ?"];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10000F900;
  uint64_t v21 = sub_10000F7D0;
  id v22 = 0;
  id obj = 0;
  [v8 bindParameter:v6 error:&obj];
  objc_storeStrong(&v22, obj);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007E0D8;
  v11[3] = &unk_100226DA8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v13 = &v17;
  +[AKSQLiteExecutor performBlockAndWait:v11];
  if (v18[5])
  {
    id v10 = _AKLogSiwa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001892B8();
    }
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);
}

- (void)_setDatabaseVersionWithAltDSID:(id)a3 toVersion:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[AKSQLiteQuery queryWithString:@"UPDATE version SET db_version = ?"];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10000F900;
  id v20 = sub_10000F7D0;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007E358;
  v15[3] = &unk_100229960;
  void v15[4] = &v16;
  void v15[5] = a4;
  [v7 setBindHandler:v15];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007E3DC;
  v10[3] = &unk_100226DA8;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v11 = v8;
  id v12 = &v16;
  +[AKSQLiteExecutor performBlockAndWait:v10];
  if (v17[5])
  {
    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100189320();
    }
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);
}

- (void)clearDatabaseWithAltDSID:(id)a3 error:(id *)a4
{
  executor = self->_executor;
  id v9 = 0;
  [(AKSQLiteExecutor *)executor wipeDatabase:&v9];
  id v7 = v9;
  id v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  [(AKAuthorizationStore *)self _postApplicationsListChangedNotification];
}

- (AKSQLiteExecutor)executor
{
  return self->_executor;
}

- (void)setExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end