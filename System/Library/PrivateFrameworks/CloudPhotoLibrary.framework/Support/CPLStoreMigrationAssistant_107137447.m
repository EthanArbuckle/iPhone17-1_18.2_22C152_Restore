@interface CPLStoreMigrationAssistant_107137447
- (BOOL)performMigrationWithError:(id *)a3;
- (CPLEngineStore)store;
- (CPLStoreMigrationAssistant_107137447)initWithStore:(id)a3;
- (NSString)migrationDescription;
@end

@implementation CPLStoreMigrationAssistant_107137447

- (CPLStoreMigrationAssistant_107137447)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLStoreMigrationAssistant_107137447;
  v6 = [(CPLStoreMigrationAssistant_107137447 *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (BOOL)performMigrationWithError:(id *)a3
{
  id v5 = [(CPLEngineStore *)self->_store scopes];
  v6 = [(CPLEngineStore *)self->_store platformObject];
  v7 = [v5 primaryScope];
  if (!v7) {
    goto LABEL_17;
  }
  if ([v5 valueForFlag:16 forScope:v7]) {
    goto LABEL_17;
  }
  uint64_t v8 = [v5 sharingScopeForScope:v7];
  if (!v8) {
    goto LABEL_17;
  }
  objc_super v9 = (void *)v8;
  uint64_t v10 = [v5 initialSyncAnchorForScope:v7];
  if (!v10)
  {

LABEL_17:
    id v23 = 0;
    unsigned __int8 v24 = 1;
    goto LABEL_18;
  }
  v11 = (void *)v10;
  v12 = [v5 platformObject];
  v13 = [v12 creationDateForScope:v7];
  v14 = [v12 creationDateForScope:v9];
  v15 = +[NSUserDefaults standardUserDefaults];
  [v15 doubleForKey:@"CPLRewindForSparseRecordsInterval"];
  double v17 = v16;

  v32 = v14;
  if (!v13 || !v14) {
    goto LABEL_12;
  }
  if (v17 <= 0.0) {
    double v17 = 86400.0;
  }
  [v14 timeIntervalSinceDate:v13];
  if (v18 < 0.0) {
    double v18 = -v18;
  }
  if (v18 >= v17)
  {
    id v23 = 0;
    unsigned __int8 v24 = 1;
  }
  else
  {
LABEL_12:
    v31 = v13;
    v19 = [v5 scopeChangeForScope:v7];
    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v30 = v12;
      v20 = [v19 rewindAnchorsPerSharingScopes];
      v21 = [v9 scopeIdentifier];
      v22 = [v20 objectForKeyedSubscript:v21];

      if (v22)
      {
        id v23 = 0;
        unsigned __int8 v24 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v26 = sub_1001A814C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "User has a Sharing scope likely present during initial download but Primary Scope does not know when it was created. Triggering an anchor reset sync", buf, 2u);
          }
        }
        [v6 recordUpgradeEvent:@"Triggering anchor reset sync for shared library user to account for missing rewind anchors"];
        id v34 = 0;
        unsigned int v27 = [v5 resetSyncAnchorForScope:v7 error:&v34];
        id v28 = v34;
        id v23 = v28;
        if (v27)
        {
          id v33 = v28;
          unsigned __int8 v24 = [v5 setInitialSyncAnchor:0 forScope:v7 error:&v33];
          id v29 = v33;

          id v23 = v29;
        }
        else
        {
          unsigned __int8 v24 = 0;
        }
      }
      v12 = v30;
    }
    else
    {
      id v23 = 0;
      unsigned __int8 v24 = 1;
    }

    v13 = v31;
  }

  if (a3 && (v24 & 1) == 0)
  {
    id v23 = v23;
    unsigned __int8 v24 = 0;
    *a3 = v23;
  }
LABEL_18:

  return v24;
}

- (NSString)migrationDescription
{
  return (NSString *)@"Migration-107137447";
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

@end