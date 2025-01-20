void sub_24B4(id a1)
{
  uint64_t vars8;

  qword_1A6E0 = [[WOWorkoutExternalProviderObserver alloc] _init];

  _objc_release_x1();
}

void sub_270C(id a1, BOOL a2, NSError *a3)
{
  v3 = a3;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (v3)
  {
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B394((uint64_t)v3, v4);
    }
  }
  else if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[WorkoutExternalProviderObserver] successfully handled uninstalled apps", v5, 2u);
  }
}

void sub_283C(uint64_t a1)
{
  v2 = +[NSMutableArray array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "bundleIdentifier", (void)v9);
        [v2 addObject:v8];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    objc_msgSend(*(id *)(a1 + 40), "queue_evaluateRemovedBundleIdentifiers:", v2);
  }
}

int64_t sub_2B80(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  v24[0] = @"CREATE TABLE WorkoutHealthPlugin_workout_configurations_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid UUID NOT NULL UNIQUE, serialization_version INTEGER NOT NULL, serialized BLOB NOT NULL, sync_provenance INTEGER, object_state INTEGER NOT NULL, object_modification_date REAL NOT NULL, configuration_type INTEGER NOT NULL, goal_type INTEGER);";
  uint64_t v6 = a3;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"INSERT INTO WorkoutHealthPlugin_workout_configurations_new (ROWID, uuid, serialization_version, serialized, sync_provenance, object_state, object_modification_date, configuration_type, goal_type) SELECT ROWID, uuid, serialization_version, serialized, sync_provenance, %lu, %f, configuration_type, goal_type FROM WorkoutHealthPlugin_workout_configurations;",
    0,
  v7 = 0);
  v24[1] = v7;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"UPDATE WorkoutHealthPlugin_workout_configurations_new SET object_state = %lu WHERE length(serialized) <= 1;",
  v8 = 1);
  v24[2] = v8;
  v24[3] = @"DROP TABLE WorkoutHealthPlugin_workout_configurations;";
  v24[4] = @"ALTER TABLE WorkoutHealthPlugin_workout_configurations_new RENAME TO WorkoutHealthPlugin_workout_configurations;";
  long long v9 = +[NSArray arrayWithObjects:v24 count:5];

  long long v10 = [(HDDatabaseMigrationTransaction *)v6 unprotectedDatabase];

  unsigned int v11 = [v10 executeSQLStatements:v9 error:a5];
  _HKInitializeLogging();
  long long v12 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    id v14 = *a5;
    if (v11) {
      CFStringRef v13 = @"YES";
    }
    *(_DWORD *)buf = 138413058;
    CFStringRef v17 = @"WorkoutHealthPlugin";
    __int16 v18 = 2048;
    uint64_t v19 = 2;
    __int16 v20 = 2112;
    CFStringRef v21 = v13;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "[%@] migration step _addSyncObjectColumnsWithMigrator, toVersion: %ld, success: %@, error: %@", buf, 0x2Au);
  }

  return v11 ^ 1;
}

int64_t sub_2D74(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"WorkoutHealthPlugin";
    __int16 v9 = 2048;
    uint64_t v10 = 2;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] migration step _emptyMigrationToSchemaVersion2WithMigrator, toVersion: %ld", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

int64_t sub_2E5C(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  int v7 = a2;
  CFStringRef v8 = a3;
  __int16 v9 = [(HDDatabaseMigrationTransaction *)v8 unprotectedDatabase];
  if ([v9 executeUncachedSQL:@"CREATE TABLE WorkoutHealthPlugin_workout_configurations_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid UUID NOT NULL UNIQUE, serialization_version INTEGER NOT NULL, serialized BLOB NOT NULL, sync_provenance INTEGER, object_state INTEGER NOT NULL, object_modification_date REAL NOT NULL, configuration_type INTEGER NOT NULL, goal_type INTEGER, sync_identity INTEGER NOT NULL)", a5 error])
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT ROWID FROM sync_identities WHERE hardware_identifier = %@('00000000-0000-0000-0000-000000000000') AND database_identifier = %@('00000000-0000-0000-0000-000000000000') AND instance_discriminator = '' LIMIT 1;",
      HDSQLiteConvertUUIDStringToBlobFunction,
    uint64_t v10 = HDSQLiteConvertUUIDStringToBlobFunction);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_30D4;
    v17[3] = &unk_14568;
    v17[4] = v18;
    if ([v9 executeSQL:v10 error:a5 bindingHandler:0 enumerationHandler:v17])
    {
      unsigned int v11 = +[NSString stringWithFormat:@"INSERT INTO WorkoutHealthPlugin_workout_configurations_new (ROWID, uuid, serialization_version, serialized, sync_provenance, object_state, object_modification_date, configuration_type, goal_type, sync_identity) SELECT ROWID, uuid, serialization_version, serialized, sync_provenance, object_state, object_modification_date, configuration_type, goal_type, ? FROM WorkoutHealthPlugin_workout_configurations;"];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_3110;
      v16[3] = &unk_14590;
      v16[4] = v18;
      if ([v9 executeSQL:v11 error:a5 bindingHandler:v16 enumerationHandler:0])
      {
        v19[0] = @"DROP TABLE WorkoutHealthPlugin_workout_configurations;";
        v19[1] = @"ALTER TABLE WorkoutHealthPlugin_workout_configurations_new RENAME TO WorkoutHealthPlugin_workout_configurations;";
        long long v12 = +[NSArray arrayWithObjects:v19 count:2];
        unsigned int v13 = [v9 executeSQLStatements:v12 error:a5];

        int64_t v14 = v13 ^ 1;
      }
      else
      {
        int64_t v14 = 1;
      }
    }
    else
    {
      int64_t v14 = 1;
    }
    _Block_object_dispose(v18, 8);
  }
  else
  {
    int64_t v14 = 1;
  }

  return v14;
}

void sub_30AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_30D4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t sub_3110(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

int64_t sub_314C(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"WorkoutHealthPlugin";
    __int16 v9 = 2048;
    uint64_t v10 = 3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] migration step _emptyMigrationToSchemaVersion3WithMigrator, toVersion: %ld", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

int64_t sub_3234(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  uint64_t v6 = [(HDDatabaseMigrationTransaction *)a3 unprotectedDatabase];
  int64_t v7 = [v6 executeUncachedSQL:@"CREATE TABLE WorkoutHealthPlugin_workout_managed_configurations (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid UUID NOT NULL UNIQUE, serialization_version INTEGER NOT NULL, serialized BLOB NOT NULL, sync_provenance INTEGER, object_state INTEGER NOT NULL, object_modification_date REAL NOT NULL, configuration_type INTEGER NOT NULL, goal_type INTEGER, sync_identity INTEGER NOT NULL, managed_source_identifier TEXT NOT NULL, managed_source_scheduled_date REAL, managed_source_completed_date REAL)", a5 error] ^ 1;

  return v7;
}

int64_t sub_32A4(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"WorkoutHealthPlugin";
    __int16 v9 = 2048;
    uint64_t v10 = 4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] migration step _emptyMigrationToSchemaVersion4WithMigrator, toVersion: %ld", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

int64_t sub_338C(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  uint64_t v6 = [(HDDatabaseMigrationTransaction *)a3 unprotectedDatabase];
  unsigned int v7 = [v6 executeSQLStatements:&off_15968 error:a5];

  _HKInitializeLogging();
  CFStringRef v8 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    id v10 = *a5;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    int v12 = 138413058;
    CFStringRef v13 = @"WorkoutHealthPlugin";
    __int16 v14 = 2048;
    uint64_t v15 = 5;
    __int16 v16 = 2112;
    CFStringRef v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%@] migration step _addProtoConfigurationsColumnsWithMigrator, toVersion: %ld, success: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }
  return v7 ^ 1;
}

int64_t sub_34D8(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  uint64_t v6 = [(HDDatabaseMigrationTransaction *)a3 unprotectedDatabase];
  unsigned int v7 = [v6 executeSQLStatements:&off_15980 error:a5];

  _HKInitializeLogging();
  CFStringRef v8 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    id v10 = *a5;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    int v12 = 138413058;
    CFStringRef v13 = @"WorkoutHealthPlugin";
    __int16 v14 = 2048;
    uint64_t v15 = 5;
    __int16 v16 = 2112;
    CFStringRef v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%@] migration step _addManagedProtoConfigurationsColumnsWithMigrator, toVersion: %ld, success: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }
  return v7 ^ 1;
}

int64_t sub_3624(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"WorkoutHealthPlugin";
    __int16 v9 = 2048;
    uint64_t v10 = 5;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] migration step _emptyMigrationToSchemaVersion5WithMigrator, toVersion: %ld", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

int64_t sub_370C(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  uint64_t v6 = [(HDDatabaseMigrationTransaction *)a3 unprotectedDatabase];
  int64_t v7 = [v6 executeUncachedSQL:@"CREATE TABLE WorkoutHealthPlugin_workout_external_configuration_providers (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid UUID NOT NULL UNIQUE, serialization_version INTEGER NOT NULL, serialized BLOB NOT NULL, sync_provenance INTEGER, object_state INTEGER NOT NULL, object_modification_date REAL NOT NULL, sync_identity INTEGER NOT NULL, proto BLOB, name TEXT NOT NULL, bundleId TEXT NOT NULL, imageData BLOB NOT NULL, syncPermission INTEGER NOT NULL, syncStartDate REAL NOT NULL)", a5 error] ^ 1;

  return v7;
}

int64_t sub_377C(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"WorkoutHealthPlugin";
    __int16 v9 = 2048;
    uint64_t v10 = 6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] migration step _emptyMigrationToSchemaVersion6WithMigrator, toVersion: %ld", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

int64_t sub_3864(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  uint64_t v6 = [(HDDatabaseMigrationTransaction *)a3 unprotectedDatabase];
  unsigned int v7 = [v6 executeSQLStatements:&off_15998 error:a5];

  _HKInitializeLogging();
  CFStringRef v8 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    id v10 = *a5;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    int v12 = 138413058;
    CFStringRef v13 = @"WorkoutHealthPlugin";
    __int16 v14 = 2048;
    uint64_t v15 = 7;
    __int16 v16 = 2112;
    CFStringRef v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%@] migration step _addOccurrenceColumnsWithMigrator, toVersion: %ld, success: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }
  return v7 ^ 1;
}

int64_t sub_39B0(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"WorkoutHealthPlugin";
    __int16 v9 = 2048;
    uint64_t v10 = 7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] migration step _emptyMigrationToSchemaVersion7WithMigrator, toVersion: %ld", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

int64_t sub_3A98(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  uint64_t v6 = [(HDDatabaseMigrationTransaction *)a3 unprotectedDatabase];
  unsigned int v7 = [v6 executeSQLStatements:&off_159B0 error:a5];

  _HKInitializeLogging();
  CFStringRef v8 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    id v10 = *a5;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    int v12 = 138413058;
    CFStringRef v13 = @"WorkoutHealthPlugin";
    __int16 v14 = 2048;
    uint64_t v15 = 8;
    __int16 v16 = 2112;
    CFStringRef v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%@] migration step _deleteRaceWorkoutConfigurationsWithMigrator, toVersion: %ld, success: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }
  return v7 ^ 1;
}

int64_t sub_3BE4(id a1, HDDatabaseMigrator *a2, HDDatabaseMigrationTransaction *a3, int64_t a4, id *a5)
{
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    CFStringRef v8 = @"WorkoutHealthPlugin";
    __int16 v9 = 2048;
    uint64_t v10 = 8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%@] migration step _emptyMigrationToSchemaVersion8WithMigrator, toVersion: %ld", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

void sub_5DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t sub_5DD4(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5 = a2;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = *(id *)(a1 + 32);
  id v52 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v52)
  {
    v49 = a3;
    uint64_t v51 = *(void *)v60;
    char v46 = 1;
    p_cache = WOWorkoutExternalProviderObserver.cache;
    uint64_t v48 = a1;
    while (2)
    {
      int v7 = 0;
      do
      {
        if (*(void *)v60 != v51) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v8 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v7);
        __int16 v9 = [v8 uuid];
        uint64_t v10 = objc_msgSend(p_cache + 18, "_lookup:ofType:profile:transaction:", v9, objc_msgSend(v8, "type"), *(void *)(a1 + 40), v5);

        if (!v10 || [p_cache + 18 _shouldInsertOrReplaceLocal:v10 withRemote:v8])
        {
          unsigned int v11 = [*(id *)(a1 + 40) syncIdentityManager];
          int v12 = [v11 legacySyncIdentity];

          CFStringRef v13 = [v10 syncIdentity];

          v53 = v10;
          if (v13)
          {
            v50 = v12;
            id v14 = objc_alloc((Class)HDSyncIdentity);
            uint64_t v15 = [v10 syncIdentity];
            __int16 v16 = [v15 hardwareIdentifier];
            CFStringRef v17 = [v10 syncIdentity];
            __int16 v18 = [v17 databaseIdentifier];
            id v19 = [v10 syncIdentity];
            [v19 instanceDiscriminator];
            v21 = id v20 = v5;
            id v22 = [v14 initWithHardwareIdentifier:v16 databaseIdentifier:v18 instanceDiscriminator:v21];

            id v5 = v20;
            id v23 = v22;

            a1 = v48;
            v24 = [*(id *)(v48 + 40) syncIdentityManager];
            id v58 = 0;
            int v12 = [v24 concreteIdentityForIdentity:v22 shouldCreate:1 transaction:v20 error:&v58];
            id v25 = v58;

            if (!v12)
            {
              _HKInitializeLogging();
              v42 = HKLogDatabase;
              if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v66 = v25;
                _os_log_fault_impl(&dword_0, v42, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
              }
              id v43 = v25;
              v44 = v43;
              if (v43)
              {
                if (v49) {
                  uint64_t *v49 = (uint64_t)v43;
                }
                else {
                  _HKLogDroppedError();
                }
              }

              char v46 = 0;
              goto LABEL_32;
            }
          }
          v26 = *(void **)(a1 + 72);
          [v5 unprotectedDatabase];
          v28 = uint64_t v27 = a1;
          v29 = [*(id *)(v27 + 72) allProperties];
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_63C4;
          v54[3] = &unk_14740;
          uint64_t v57 = *(void *)(v27 + 72);
          v54[4] = v8;
          id v55 = *(id *)(v27 + 48);
          id v30 = v12;
          id v56 = v30;
          v31 = [v26 insertOrReplaceEntity:1 database:v28 properties:v29 error:v49 bindingHandler:v54];

          if (v31)
          {
            ++*(void *)(*(void *)(*(void *)(v27 + 64) + 8) + 24);
            p_cache = WOWorkoutExternalProviderObserver.cache;
            objc_opt_class();
            a1 = v27;
            if (objc_opt_isKindOfClass())
            {
              v32 = *(void **)(v27 + 56);
              [(id)objc_opt_class() persistenceType];
              v33 = NSNotificationNameForSyncedPersistenceType();
              [v32 addObject:v33];
            }
            else
            {
              _HKInitializeLogging();
              v35 = (void *)HKLogWorkouts;
              if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                sub_B76C(v63, v35, (uint64_t)v31, &v64);
              }
            }
          }
          else
          {
            _HKInitializeLogging();
            v34 = (void *)HKLogWorkouts;
            p_cache = (void **)(WOWorkoutExternalProviderObserver + 16);
            if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
            {
              v36 = v34;
              v37 = objc_opt_class();
              id v38 = v37;
              v39 = [v8 uuid];
              uint64_t v40 = *v49;
              *(_DWORD *)buf = 138543874;
              id v66 = v37;
              __int16 v67 = 2112;
              v68 = v39;
              __int16 v69 = 2112;
              uint64_t v70 = v40;
              _os_log_error_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "[WOSync] %{public}@ unable to store entity of uuid %@, error: %@", buf, 0x20u);

              p_cache = (void **)(WOWorkoutExternalProviderObserver + 16);
              a1 = v48;

              char v46 = 0;
            }
            else
            {
              char v46 = 0;
              a1 = v48;
            }
          }
          uint64_t v10 = v53;
        }
        int v7 = (char *)v7 + 1;
      }
      while (v52 != v7);
      id v41 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
      id v52 = v41;
      if (v41) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v46 = 1;
  }
LABEL_32:

  return v46 & 1;
}

void sub_63C4(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) syncProvenance];
  id v7 = [*(id *)(a1 + 48) entity];
  objc_msgSend(v4, "bind:provenance:syncIdentity:toBinder:", v5, v6, objc_msgSend(v7, "persistentID"), a2);
}

void sub_6924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6948(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6958(uint64_t a1)
{
}

BOOL sub_6960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [*(id *)(a1 + 56) persistenceFromRow:a4 type:*(void *)(a1 + 64) profile:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40)];
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  }

  return v5 != 0;
}

id sub_6D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) database];
  id v7 = [v5 deleteEntitiesWithPredicate:v4 healthDatabase:v6 error:a3];

  return v7;
}

void sub_7014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_702C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 64);
  id v6 = [v5 allProperties];
  id v7 = [*(id *)(a1 + 64) _nonRaceConfigPredicate:*(void *)(a1 + 64)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8) + 24;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) database];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_7190;
  v17[3] = &unk_147E0;
  uint64_t v21 = *(void *)(a1 + 64);
  id v18 = *(id *)(a1 + 40);
  id v19 = v4;
  id v20 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  id v13 = v4;
  id v14 = objc_msgSend(v5, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, v7, v9, v12, v11, 0, v8, v10, a3, v17);

  return v14;
}

BOOL sub_7190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + 56;
  id v6 = objc_msgSend(*(id *)(a1 + 56), "persistenceFromRow:type:profile:transaction:", a4, objc_msgSend(*(id *)(a1 + 56), "persistenceType"), *(void *)(a1 + 32), *(void *)(a1 + 40));
  if (v6)
  {
    [*(id *)(a1 + 48) addObject:v6];
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B7F0(v5, v7);
    }
  }

  return v6 != 0;
}

void sub_72A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_72D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_72EC(uint64_t a1)
{
  return _NSRequestConcreteImplementation(v2, v1, a1);
}

uint64_t sub_7308()
{
  return objc_opt_class();
}

void sub_7320(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_78FC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) _statePredicateForClass:*(void *)(a1 + 48) state:0];
  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = [v7 allProperties];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 16) database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_7A40;
  v15[3] = &unk_149F8;
  uint64_t v18 = *(void *)(a1 + 56);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v5;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v14;
  long long v17 = v14;
  id v11 = v5;
  id v12 = [v7 enumerateProperties:v8 withPredicate:v6 healthDatabase:v9 error:a3 enumerationHandler:v15];

  return v12;
}

uint64_t sub_7A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 56) persistenceFromRow:a4 type:*(void *)(a1 + 64) profile:*(void *)(*(void *)(a1 + 32) + 16) transaction:*(void *)(a1 + 40)];
  if (v5)
  {
    [*(id *)(a1 + 48) addObject:v5];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B888();
    }
  }

  return 1;
}

id sub_7C20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) _statePredicateForClass:*(void *)(a1 + 48) state:*(void *)(a1 + 56)];
  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = [v7 allProperties];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 16) database];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_7D60;
  v15[3] = &unk_149F8;
  uint64_t v18 = *(void *)(a1 + 64);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v5;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v10 = (id)v14;
  long long v17 = v14;
  id v11 = v5;
  id v12 = [v7 enumerateProperties:v8 withPredicate:v6 healthDatabase:v9 error:a3 enumerationHandler:v15];

  return v12;
}

uint64_t sub_7D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 56) protoPersistenceFromRow:a4 type:*(void *)(a1 + 64) profile:*(void *)(*(void *)(a1 + 32) + 16) transaction:*(void *)(a1 + 40)];
  if (v5)
  {
    [*(id *)(a1 + 48) addPersistences:v5];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B888();
    }
  }

  return 1;
}

void sub_7F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7FA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7FB8(uint64_t a1)
{
}

id sub_7FC0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 56) propertyForUUID];
  id v7 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 equalToValue:*(void *)(a1 + 32)];

  uint64_t v8 = [*(id *)(a1 + 40) _statePredicateForClass:*(void *)(a1 + 56) state:*(void *)(a1 + 64)];
  uint64_t v9 = +[HDSQLitePredicate compoundPredicateWithPredicate:v7 otherPredicate:v8];
  id v10 = *(void **)(a1 + 56);
  id v11 = [v10 allProperties];
  id v12 = [*(id *)(*(void *)(a1 + 40) + 16) database];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_8148;
  v16[3] = &unk_14790;
  uint64_t v19 = *(void *)(a1 + 72);
  v16[4] = *(void *)(a1 + 40);
  id v17 = v5;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v13 = v5;
  id v14 = [v10 enumerateProperties:v11 withPredicate:v9 healthDatabase:v12 error:a3 enumerationHandler:v16];

  return v14;
}

BOOL sub_8148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 56) persistenceFromRow:a4 type:*(void *)(a1 + 64) profile:*(void *)(*(void *)(a1 + 32) + 16) transaction:*(void *)(a1 + 40)];
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B888();
    }
  }

  return v5 != 0;
}

id sub_8380(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HDSQLiteComparisonPredicate predicateWithProperty:*(void *)(a1 + 32) equalToValue:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 48) _statePredicateForClass:*(void *)(a1 + 64) state:0];
  uint64_t v8 = +[HDSQLitePredicate compoundPredicateWithPredicate:v6 otherPredicate:v7];
  uint64_t v9 = *(void **)(a1 + 64);
  id v10 = [v9 allProperties];
  id v11 = [*(id *)(*(void *)(a1 + 48) + 16) database];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_8500;
  v17[3] = &unk_14A98;
  void v17[4] = *(void *)(a1 + 48);
  id v18 = v5;
  long long v16 = *(_OWORD *)(a1 + 56);
  id v12 = (id)v16;
  long long v19 = v16;
  id v13 = v5;
  id v14 = [v9 enumerateProperties:v10 withPredicate:v8 healthDatabase:v11 error:a3 enumerationHandler:v17];

  return v14;
}

uint64_t sub_8500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 56) persistenceFromRow:a4 type:3 profile:*(void *)(*(void *)(a1 + 32) + 16) transaction:*(void *)(a1 + 40)];
  if (v5)
  {
    [*(id *)(a1 + 48) addObject:v5];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B888();
    }
  }

  return 1;
}

void sub_8634(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = a3;
    id v7 = [a2 data];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v6 = *(void (**)(uint64_t, void))(v3 + 16);
    id v7 = a3;
    v6(v3, 0);
  }
}

void sub_8770(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = a3;
    id v7 = [a2 data];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v6 = *(void (**)(uint64_t, void))(v3 + 16);
    id v7 = a3;
    v6(v3, 0);
  }
}

uint64_t sub_8A80(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 32);
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138412290;
    long long v17 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v9);
        id v11 = *(void **)(a1 + 48);
        id v12 = objc_msgSend(v4, "unprotectedDatabase", v17);
        id v13 = [*(id *)(a1 + 48) allProperties];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_8CAC;
        v20[3] = &unk_14B10;
        v20[4] = v10;
        long long v21 = *(_OWORD *)(a1 + 40);
        id v14 = [v11 insertOrReplaceEntity:1 database:v12 properties:v13 error:a3 bindingHandler:v20];

        if (!v14)
        {
          _HKInitializeLogging();
          uint64_t v15 = HKLogWorkouts;
          if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v27 = v10;
            _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to insert or replace entity for persistence: %@", buf, 0xCu);
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  return 1;
}

id sub_8CAC(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];
  id v5 = [*(id *)(a1[5] + 16) currentSyncIdentityPersistentID];

  return [v3 bind:v4 provenance:0 syncIdentity:v5 toBinder:a2];
}

void sub_9224(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_925C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_92F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v14 = a3;
  if (v14)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = WOColumnExternalProviderBundleIdentifierKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = [v11 keyedStrings];
          id v13 = [v12 objectForKeyedSubscript:v9];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 length]) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v11 forKeyedSubscript:v13];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_9498(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  uint64_t v2 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(*(void *)(a1[6] + 8) + 40);
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = WOColumnManagedSourceIdentifierKey;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [v8 keyedStrings];
        uint64_t v10 = [v9 objectForKeyedSubscript:v6];

        if ([v10 length])
        {
          id v11 = [*(id *)(*(void *)(a1[7] + 8) + 40) objectForKeyedSubscript:v10];
          if (v11)
          {
            id v12 = [v2 objectForKeyedSubscript:v11];

            if (!v12)
            {
              id v13 = objc_opt_new();
              [v2 setObject:v13 forKeyedSubscript:v11];
            }
            id v14 = [v2 objectForKeyedSubscript:v11];
            [v14 addObject:v8];
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void sub_997C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_9994(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 56) propertyForProviderIdentifier];
  id v7 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 equalToValue:*(void *)(a1 + 32)];

  uint64_t v8 = [*(id *)(a1 + 40) _statePredicateForClass:*(void *)(a1 + 56) state:0];
  uint64_t v9 = +[HDSQLitePredicate compoundPredicateWithPredicate:v7 otherPredicate:v8];
  uint64_t v10 = *(void **)(a1 + 56);
  id v11 = [v10 allProperties];
  id v12 = [*(id *)(*(void *)(a1 + 40) + 16) database];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_9B18;
  v16[3] = &unk_14BB0;
  v16[4] = *(void *)(a1 + 40);
  id v17 = v5;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v13 = v5;
  id v14 = [v10 enumerateProperties:v11 withPredicate:v9 healthDatabase:v12 error:a3 enumerationHandler:v16];

  return v14;
}

BOOL sub_9B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend(*(id *)(a1 + 56), "persistenceFromRow:type:profile:transaction:", a4, objc_msgSend(*(id *)(a1 + 56), "persistenceType"), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(a1 + 40));
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_B888();
    }
  }

  return v5 != 0;
}

void sub_9DE8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)a1[4];
    id v9 = v5;
    uint64_t v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [v7 _deleteConfigurations:v8 ofType:a1[6] withCompletion:a1[5]];
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void sub_9F94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    id v7 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v7;
      id v9 = [v5 count];
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 134218242;
      id v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "[WorkoutQueryServer] deleting %lu managed configurations for id: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 40) _deleteConfigurations:v5 ofType:3 withCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_A188(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "[WorkoutQueryServer] deleting provider for id: %{public}@", buf, 0xCu);
    }
    uint64_t v8 = *(void **)(a1 + 40);
    id v15 = v5;
    id v9 = +[NSArray arrayWithObjects:&v15 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_A328;
    v12[3] = &unk_14C50;
    id v14 = *(id *)(a1 + 48);
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    [v8 _deleteConfigurations:v9 ofType:4 withCompletion:v12];
  }
  else
  {
    (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a3 == 0, a3);
  }
}

id sub_A328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _deleteManagedFromSource:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
  }
}

void sub_B394(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[WorkoutExternalProviderObserver] failed to handle uninstalled apps: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_B4DC()
{
  sub_7340();
  sub_72D0(&dword_0, v0, v1, "Unable to deserialize - missing UUID", v2, v3, v4, v5, v6);
}

void sub_B510()
{
  sub_7340();
  sub_72D0(&dword_0, v0, v1, "Unable to deserialize - missing persisted data", v2, v3, v4, v5, v6);
}

void sub_B544()
{
  sub_72C4();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Unable to fetch sync identity for WOWorkoutEntity  %{public}@", v1, 0xCu);
}

void sub_B5B8()
{
  sub_72C4();
  sub_72A8(&dword_0, v0, v1, "Missing required property %{public}@", v2, v3, v4, v5, v6);
}

void sub_B620(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_7320(&dword_0, v3, v4, "[WOSync] Unknown entity class %{public}@", v5, v6, v7, v8, 2u);
}

void sub_B6B8(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  sub_7308();
  sub_72C4();
  __int16 v9 = 2050;
  uint64_t v10 = a3;
  id v7 = v6;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "[WOSync] %{public}@ returning next sync anchor: %{public}lld", v8, 0x16u);
}

void sub_B76C(uint8_t *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = objc_opt_class();
  *(_DWORD *)a1 = 138543362;
  *a4 = v7;
  id v8 = v7;
  _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "[WOSync] Unexpected entity class: %{public}@", a1, 0xCu);
}

void sub_B7F0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  sub_7320(&dword_0, v4, v5, "[WOSync] %{public}@ error creating WOPersistence from row", v6, v7, v8, v9, 2u);
}

void sub_B888()
{
  sub_72C4();
  sub_72A8(&dword_0, v0, v1, "Failed to load persistence from row %lld.", v2, v3, v4, v5, v6);
}

uint64_t FIIsWorkoutNFCAllDayEnabled()
{
  return _FIIsWorkoutNFCAllDayEnabled();
}

uint64_t FISetWorkoutNFCAllDayEnabled()
{
  return _FISetWorkoutNFCAllDayEnabled();
}

uint64_t HDSQLiteBindDataToProperty()
{
  return _HDSQLiteBindDataToProperty();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return _HDSQLiteBindDateToProperty();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return _HDSQLiteBindInt64ToProperty();
}

uint64_t HDSQLiteBindNullToProperty()
{
  return _HDSQLiteBindNullToProperty();
}

uint64_t HDSQLiteBindNumberToProperty()
{
  return _HDSQLiteBindNumberToProperty();
}

uint64_t HDSQLiteBindStringToProperty()
{
  return _HDSQLiteBindStringToProperty();
}

uint64_t HDSQLiteBindUUIDToProperty()
{
  return _HDSQLiteBindUUIDToProperty();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return _HDSQLiteColumnAsInt64();
}

uint64_t HDSQLiteColumnWithNameAsData()
{
  return _HDSQLiteColumnWithNameAsData();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return _HDSQLiteColumnWithNameAsDate();
}

uint64_t HDSQLiteColumnWithNameAsDouble()
{
  return _HDSQLiteColumnWithNameAsDouble();
}

uint64_t HDSQLiteColumnWithNameAsInteger()
{
  return _HDSQLiteColumnWithNameAsInteger();
}

uint64_t HDSQLiteColumnWithNameAsNumber()
{
  return _HDSQLiteColumnWithNameAsNumber();
}

uint64_t HDSQLiteColumnWithNameAsString()
{
  return _HDSQLiteColumnWithNameAsString();
}

uint64_t HDSQLiteColumnWithNameAsUUID()
{
  return _HDSQLiteColumnWithNameAsUUID();
}

uint64_t NSNotificationNameForSyncedPersistenceType()
{
  return _NSNotificationNameForSyncedPersistenceType();
}

uint64_t NSStringForWOPersistenceType()
{
  return _NSStringForWOPersistenceType();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _HKLogDroppedError()
{
  return __HKLogDroppedError();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__isWorkoutNFCAllDayEnabledString(void *a1, const char *a2, ...)
{
  return [a1 _isWorkoutNFCAllDayEnabledString];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allProperties(void *a1, const char *a2, ...)
{
  return [a1 allProperties];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDeviceProductType(void *a1, const char *a2, ...)
{
  return [a1 currentDeviceProductType];
}

id objc_msgSend_currentSyncIdentityPersistentID(void *a1, const char *a2, ...)
{
  return [a1 currentSyncIdentityPersistentID];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataProperties(void *a1, const char *a2, ...)
{
  return [a1 dataProperties];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_databaseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 databaseIdentifier];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateProperties(void *a1, const char *a2, ...)
{
  return [a1 dateProperties];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableGymKitNFCSwitchOnOldHardwareIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 disableGymKitNFCSwitchOnOldHardwareIfNeeded];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareIdentifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_instanceDiscriminator(void *a1, const char *a2, ...)
{
  return [a1 instanceDiscriminator];
}

id objc_msgSend_integerProperties(void *a1, const char *a2, ...)
{
  return [a1 integerProperties];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_keyedDatas(void *a1, const char *a2, ...)
{
  return [a1 keyedDatas];
}

id objc_msgSend_keyedDates(void *a1, const char *a2, ...)
{
  return [a1 keyedDates];
}

id objc_msgSend_keyedNumbers(void *a1, const char *a2, ...)
{
  return [a1 keyedNumbers];
}

id objc_msgSend_keyedStrings(void *a1, const char *a2, ...)
{
  return [a1 keyedStrings];
}

id objc_msgSend_legacySyncIdentity(void *a1, const char *a2, ...)
{
  return [a1 legacySyncIdentity];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_objectModificationDate(void *a1, const char *a2, ...)
{
  return [a1 objectModificationDate];
}

id objc_msgSend_objectState(void *a1, const char *a2, ...)
{
  return [a1 objectState];
}

id objc_msgSend_persistedData(void *a1, const char *a2, ...)
{
  return [a1 persistedData];
}

id objc_msgSend_persistedProtoData(void *a1, const char *a2, ...)
{
  return [a1 persistedProtoData];
}

id objc_msgSend_persistenceType(void *a1, const char *a2, ...)
{
  return [a1 persistenceType];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_profileType(void *a1, const char *a2, ...)
{
  return [a1 profileType];
}

id objc_msgSend_propertyForConfigurationType(void *a1, const char *a2, ...)
{
  return [a1 propertyForConfigurationType];
}

id objc_msgSend_propertyForManagedSourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 propertyForManagedSourceIdentifier];
}

id objc_msgSend_propertyForObjectModificationDate(void *a1, const char *a2, ...)
{
  return [a1 propertyForObjectModificationDate];
}

id objc_msgSend_propertyForObjectState(void *a1, const char *a2, ...)
{
  return [a1 propertyForObjectState];
}

id objc_msgSend_propertyForProviderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 propertyForProviderIdentifier];
}

id objc_msgSend_propertyForUUID(void *a1, const char *a2, ...)
{
  return [a1 propertyForUUID];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stringProperties(void *a1, const char *a2, ...)
{
  return [a1 stringProperties];
}

id objc_msgSend_syncIdentity(void *a1, const char *a2, ...)
{
  return [a1 syncIdentity];
}

id objc_msgSend_syncIdentityManager(void *a1, const char *a2, ...)
{
  return [a1 syncIdentityManager];
}

id objc_msgSend_syncProvenance(void *a1, const char *a2, ...)
{
  return [a1 syncProvenance];
}

id objc_msgSend_tableName(void *a1, const char *a2, ...)
{
  return [a1 tableName];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unprotectedDatabase(void *a1, const char *a2, ...)
{
  return [a1 unprotectedDatabase];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_zeroObjectModificationDate(void *a1, const char *a2, ...)
{
  return [a1 zeroObjectModificationDate];
}