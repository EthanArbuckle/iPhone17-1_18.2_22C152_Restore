@interface PDDatabase
+ (Class)entityNamed:(id)a3;
+ (NSArray)recordTypesOfEntitiesTrackingUserActivity;
+ (NSArray)registeredEntities;
+ (id)nameOfEntity:(Class)a3;
+ (id)whereSQLForArray:(id)a3 prefix:(id)a4;
+ (void)registerEntities;
+ (void)registerEntity:(Class)a3;
- (BOOL)_deleteAll:(Class)a3 where:(id)a4 bindings:(id)a5 trackDeletes:(BOOL)a6;
- (BOOL)_insertObject:(id)a3;
- (BOOL)_markObject:(id)a3 as:(int64_t)a4;
- (BOOL)_postDidInsertNotificationWithEntity:(id)a3;
- (BOOL)_postWillChangeNotificationWithEntity:(id)a3;
- (BOOL)_pruneAuthTreeAtNodeWithAssignedItemStatusID:(id)a3;
- (BOOL)_pruneAuthTreeAtNodeWithContextStatusID:(id)a3;
- (BOOL)_setCurrentUser:(id)a3 withRoleLocations:(id)a4 orRole:(unint64_t)a5;
- (BOOL)_statusID:(id *)a3 deniedCount:(int64_t *)a4 authCount:(int64_t *)a5 forContextPath:(id)a6;
- (BOOL)_statusID:(id *)a3 deniedCount:(int64_t *)a4 authCount:(int64_t *)a5 forHandoutAssignedItem:(id)a6;
- (BOOL)_updateFileProtectionAttribs;
- (BOOL)_updateObject:(id)a3;
- (BOOL)childEntitiesExistForClass:(Class)a3 parentIdentity:(id)a4;
- (BOOL)deleteAll:(Class)a3 where:(id)a4 bindings:(id)a5;
- (BOOL)deleteAllWithoutTracking:(Class)a3 where:(id)a4 bindings:(id)a5;
- (BOOL)deleteObject:(id)a3;
- (BOOL)entityClass:(Class)a3 containsColumnNamed:(id)a4;
- (BOOL)entityExistsByClass:(Class)a3 identity:(id)a4;
- (BOOL)insertObject:(id)a3;
- (BOOL)insertObjects:(id)a3;
- (BOOL)insertOrUpdateObject:(id)a3;
- (BOOL)insertOrUpdateObjects:(id)a3;
- (BOOL)isInSyncBlock;
- (BOOL)isIncompleteHandout:(id)a3;
- (BOOL)isSyncableDataWritten;
- (BOOL)markAll:(Class)a3 where:(id)a4 bindings:(id)a5 as:(int64_t)a6;
- (BOOL)markObject:(id)a3 as:(int64_t)a4;
- (BOOL)migrate;
- (BOOL)migrateEntity:(Class)a3;
- (BOOL)performFrameworkMigrationIfNeeded;
- (BOOL)performTransaction:(id)a3 forWriting:(BOOL)a4;
- (BOOL)saveAndSyncObjects:(id)a3;
- (BOOL)searchFor:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 offset:(unint64_t)a7 block:(id)a8;
- (BOOL)selectAll:(Class)a3 block:(id)a4;
- (BOOL)selectAll:(Class)a3 where:(id)a4 bindings:(id)a5 block:(id)a6;
- (BOOL)selectAll:(Class)a3 where:(id)a4 orderBy:(id)a5 bindings:(id)a6 block:(id)a7;
- (BOOL)selectAll:(Class)a3 where:(id)a4 orderBy:(id)a5 limit:(int64_t)a6 offset:(unint64_t)a7 bindings:(id)a8 block:(id)a9;
- (BOOL)selectColumns:(id)a3 of:(Class)a4 where:(id)a5 bindings:(id)a6 block:(id)a7;
- (BOOL)selectColumns:(id)a3 of:(Class)a4 where:(id)a5 orderBy:(id)a6 limit:(int64_t)a7 offset:(unint64_t)a8 bindings:(id)a9 block:(id)a10;
- (BOOL)syncableDatabaseEntityExistsByObjectID:(id)a3;
- (BOOL)updateAll:(Class)a3 set:(id)a4 where:(id)a5 bindings:(id)a6;
- (BOOL)updateObject:(id)a3;
- (BOOL)updateObjects:(id)a3;
- (BOOL)withSyncEnabled:(id)a3;
- (PDDatabase)init;
- (PDSQLiteDatabase)currentDB;
- (id)_databaseFileURLs;
- (id)_progressEventsForContext:(id)a3 eventType:(int64_t)a4 activityID:(id)a5 activityItemID:(id)a6;
- (id)_progressEventsWithAssignedItem:(id)a3 eventType:(int64_t)a4 activityID:(id)a5 activityItemID:(id)a6;
- (id)dbPool;
- (id)locationIDsMatchingConstraintsForSearchSpecification:(id)a3;
- (id)locationIDsWithPrivilege:(id)a3 onPersonIDs:(id)a4;
- (id)locationIDsWithRoleType:(int64_t)a3 onPersonIDs:(id)a4;
- (id)locationIDsWithoutPrivilege:(id)a3 onPersonIDs:(id)a4;
- (id)locationSearchPredicateForSearchSpec:(id)a3;
- (id)normalizeKeyPath:(id)a3 forValue:(id)a4;
- (id)normalizedValue:(id)a3 forKeyPath:(id)a4;
- (id)objectIDsForSQL:(id)a3 resultColumnName:(id)a4 bindings:(id)a5;
- (id)organizationSearchPredicateForSearchSpec:(id)a3;
- (id)personIDsAnyRoleAtLocationIDs:(id)a3;
- (id)personIDsForClassMembersMatchingConstraintsForSearchSpecification:(id)a3;
- (id)personIDsForGroupMembersMatchingConstraintsForSearchSpecification:(id)a3;
- (id)personIDsMatchingConstraintsForSearchSpecification:(id)a3;
- (id)personIDsToPerson:(id)a3;
- (id)personIDsWithRoleID:(id)a3 atLocationIDs:(id)a4;
- (id)personIDsWithRoleType:(int64_t)a3 atLocationIDs:(id)a4;
- (id)poolItemForPool:(id)a3;
- (id)prlConstraintSQLOnColumn:(id)a3 andValues:(id)a4;
- (id)prlSelectColumn:(id)a3 havingPrivilege:(id)a4 whereConstraintColumn:(id)a5 hasValues:(id)a6;
- (id)prlSelectColumn:(id)a3 havingRoleType:(int64_t)a4 whereConstraintColumn:(id)a5 hasValues:(id)a6;
- (id)select:(Class)a3 identity:(id)a4;
- (id)select:(Class)a3 where:(id)a4 bindings:(id)a5;
- (id)selectColumns:(id)a3 of:(Class)a4 where:(id)a5 bindings:(id)a6;
- (id)trackDeletedObject:(id)a3;
- (unint64_t)count:(Class)a3 where:(id)a4 bindings:(id)a5;
- (void)_delete;
- (void)_notifyOfDataChange:(id)a3 changeTime:(id)a4 changedRowCount:(int64_t)a5;
- (void)_saveInsightEventsFor:(id)a3;
- (void)cleanupAssociatedObjects;
- (void)dealloc;
- (void)generateInsightEventsForClass:(Class)a3 where:(id)a4 bindings:(id)a5;
- (void)generateInsightEventsForObject:(id)a3;
- (void)lock;
- (void)populateSearchField:(id)a3 bindings:(id)a4;
- (void)setCurrentDB:(id)a3;
- (void)setDatabaseURL:(id)a3;
- (void)setInSyncBlock:(BOOL)a3;
- (void)setSyncableDataWritten:(BOOL)a3;
- (void)setupDevDB;
- (void)tearDownDevDB;
- (void)unlock;
@end

@implementation PDDatabase

- (unint64_t)count:(Class)a3 where:(id)a4 bindings:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000041A4;
  v14[3] = &unk_1001F4968;
  Class v19 = a3;
  id v10 = v8;
  id v15 = v10;
  v16 = self;
  id v11 = v9;
  id v17 = v11;
  v18 = &v20;
  sub_10000749C(self, v14);
  unint64_t v12 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (id)poolItemForPool:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = v5;
  if (v5)
  {
    v7 = v5->_databaseURL;
    if (v6->_invalidated)
    {
      CLSInitLog();
      id v8 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        v21 = v8;
        uint64_t v22 = [(NSURL *)v7 path];
        *(_DWORD *)buf = 138543362;
        *(void *)v27 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot create new connection, database invalidated: %{public}@", buf, 0xCu);
      }
      id v9 = 0;
      goto LABEL_24;
    }
    id v11 = [[PDSQLiteDatabase alloc] initWithDatabaseURL:v7];
    id v25 = 0;
    unsigned int v12 = [(PDSQLiteDatabase *)v11 openWithError:&v25];
    id v13 = v25;
    if (v12)
    {
      [(PDSQLiteDatabase *)v11 close];
      if (v12 == 26 || v12 == 11)
      {
        CLSInitLog();
        v14 = (void *)CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = v14;
          v24 = [(NSURL *)v7 path];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v27 = v12;
          *(_WORD *)&v27[4] = 2114;
          *(void *)&v27[6] = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Database corruption detected: [%d, %{public}@]; nuking db; and retrying;",
            buf,
            0x12u);
        }
        [(PDDatabase *)v6 _delete];
        id v15 = [(PDDatabase *)v6 poolItemForPool:v4];
        goto LABEL_17;
      }
      CLSInitLog();
      v16 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        id v17 = v16;
        v18 = [(NSURL *)v7 path];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v12;
        *(_WORD *)&v27[4] = 2114;
        *(void *)&v27[6] = v18;
        __int16 v28 = 2114;
        id v29 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to open database: [%d, %{public}@]; %{public}@",
          buf,
          0x1Cu);
      }
    }
    else
    {
      if ([(PDDatabase *)v6 _updateFileProtectionAttribs])
      {
        id v15 = v11;
LABEL_17:
        id v9 = v15;
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      [(PDSQLiteDatabase *)v11 close];
      CLSInitLog();
      Class v19 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to update file protection attributes of database", buf, 2u);
      }
    }
    id v9 = 0;
    goto LABEL_23;
  }
  CLSInitLog();
  id v10 = CLSLogDatabase;
  if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", buf, 2u);
  }
  id v9 = 0;
LABEL_25:

  return v9;
}

- (id)_databaseFileURLs
{
  v2 = self;
  if (v2)
  {
    v3 = +[NSMutableArray arrayWithObject:v2->_databaseURL];
    id v4 = [(NSURL *)v2->_databaseURL lastPathComponent];
    v5 = [(NSURL *)v2->_databaseURL URLByDeletingLastPathComponent];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [&off_10020B248 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(&off_10020B248);
          }
          id v10 = [v4 stringByAppendingString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          id v11 = [v5 URLByAppendingPathComponent:v10 isDirectory:0];
          [v3 addObject:v11];
        }
        id v7 = [&off_10020B248 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    CLSInitLog();
    unsigned int v12 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", buf, 2u);
    }
    v3 = &__NSArray0__struct;
  }

  return v3;
}

- (BOOL)_updateFileProtectionAttribs
{
  v2 = self;
  if (!v2)
  {
    CLSInitLog();
    v24 = CLSLogDatabase;
    BOOL v23 = 0;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", buf, 2u);
      BOOL v23 = 0;
    }
    goto LABEL_35;
  }
  v31 = +[NSFileManager defaultManager];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(PDDatabase *)v2 _databaseFileURLs];
  id v3 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v3)
  {
    BOOL v23 = 1;
    goto LABEL_34;
  }
  id v4 = v3;
  __int16 v28 = v2;
  uint64_t v5 = *(void *)v36;
  NSFileAttributeKey v6 = NSFileProtectionKey;
  uint64_t v29 = *(void *)v36;
  while (2)
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v36 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      if (objc_msgSend(v8, "cls_fileExists", v28))
      {
        id v9 = [v8 absoluteURL];
        id v10 = [v9 path];

        id v34 = 0;
        id v11 = [v31 attributesOfItemAtPath:v10 error:&v34];
        id v12 = v34;
        id v13 = [v11 mutableCopy];

        if (v13)
        {
          v32 = v10;
          uint64_t v14 = [v13 objectForKeyedSubscript:v6];
          if (!(v14 | (unint64_t)NSFileProtectionCompleteUntilFirstUserAuthentication))
          {
LABEL_18:
            id v10 = v32;
LABEL_21:

            continue;
          }
          long long v15 = (void *)v14;
          long long v16 = [v13 objectForKeyedSubscript:v6];
          NSFileAttributeKey v17 = v6;
          v18 = v16;
          if (v16) {
            BOOL v19 = NSFileProtectionCompleteUntilFirstUserAuthentication == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
          }
          else
          {
            uint64_t v20 = [v13 objectForKeyedSubscript:v17];
            unsigned __int8 v21 = [v20 isEqualToString:NSFileProtectionCompleteUntilFirstUserAuthentication];

            uint64_t v5 = v29;
            if (v21)
            {
              NSFileAttributeKey v6 = NSFileProtectionKey;
              goto LABEL_18;
            }
          }
          NSFileAttributeKey v6 = NSFileProtectionKey;
          [v13 setObject:NSFileProtectionCompleteUntilFirstUserAuthentication forKeyedSubscript:NSFileProtectionKey];
          id v33 = v12;
          id v10 = v32;
          [v31 setAttributes:v13 ofItemAtPath:v32 error:&v33];
          id v22 = v33;

          if (!v22)
          {
            id v12 = 0;
            goto LABEL_21;
          }
          CLSInitLog();
          v26 = CLSLogDatabase;
          if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v40 = v8;
            __int16 v41 = 2114;
            id v42 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to set file protection attribute for file at URL \"%{public}@\": %{public}@", buf, 0x16u);
          }
          id v12 = v22;
        }
        else
        {
          CLSInitLog();
          id v25 = CLSLogDatabase;
          if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v40 = v8;
            __int16 v41 = 2114;
            id v42 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to get file attributes for file at URL \"%{public}@\": %{public}@", buf, 0x16u);
          }
        }
        v2 = v28;

        BOOL v23 = 0;
        goto LABEL_34;
      }
    }
    id v4 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v4) {
      continue;
    }
    break;
  }
  BOOL v23 = 1;
  v2 = v28;
LABEL_34:

LABEL_35:
  return v23;
}

- (id)select:(Class)a3 where:(id)a4 bindings:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  id v11 = v10;
  if (v10)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_10000B754;
    BOOL v19 = sub_10000B5C4;
    id v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000E7EE4;
    v14[3] = &unk_1001F4850;
    void v14[4] = &v15;
    if ([(PDDatabase *)v10 selectAll:a3 where:v8 orderBy:0 limit:1 offset:0 bindings:v9 block:v14])
    {
      id v12 = (id)v16[5];
    }
    else
    {
      id v12 = 0;
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)selectAll:(Class)a3 where:(id)a4 orderBy:(id)a5 limit:(int64_t)a6 offset:(unint64_t)a7 bindings:(id)a8 block:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  if (self)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100009810;
    v21[3] = &unk_1001F48A0;
    Class v26 = a3;
    v21[4] = self;
    id v22 = v15;
    id v23 = v16;
    int64_t v27 = a6;
    unint64_t v28 = a7;
    id v24 = v17;
    id v25 = v18;
    BOOL v19 = self;
    LOBYTE(self) = sub_10000749C(v19, v21);
  }
  return (char)self;
}

- (BOOL)performTransaction:(id)a3 forWriting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  id v8 = v7;
  if (v7)
  {
    [(PDDatabase *)v7 lock];
    id v9 = v8;
    [(PDDatabase *)v9 lock];
    BOOL invalidated = v9->_invalidated;
    [(PDDatabase *)v9 unlock];

    if (invalidated)
    {
      [(PDDatabase *)v9 unlock];
LABEL_6:
      unsigned __int8 v12 = 0;
      goto LABEL_28;
    }
    uint64_t v13 = [(PDDatabase *)v9 currentDB];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = 0;
      id v16 = (void *)v13;
    }
    else
    {
      id v16 = sub_100009E10((uint64_t)v9->_dbPool);
      if (!v16)
      {
        CLSInitLog();
        int64_t v27 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Failed to acquire database from dbPool", buf, 2u);
        }
        [(PDDatabase *)v9 unlock];
        goto LABEL_6;
      }
      [(PDDatabase *)v9 setCurrentDB:v16];
      uint64_t v15 = (int)[v16 totalChangesCount];
    }
    uint64_t v40 = 0;
    __int16 v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    *(void *)buf = 0;
    long long v35 = buf;
    uint64_t v36 = 0x3032000000;
    long long v37 = sub_10000B784;
    long long v38 = sub_10000B5DC;
    id v39 = (id)objc_opt_new();
    if (!v14 && [(NSSet *)v9->_changeTrackedTableNames count])
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000FB1E0;
      v33[3] = &unk_1001F4EA8;
      v33[4] = v9;
      v33[5] = &v40;
      v33[6] = buf;
      [v16 onRowUpdate:v33];
    }
    id v32 = 0;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000878C;
    v30[3] = &unk_1001F4ED0;
    id v31 = v6;
    unsigned __int8 v12 = [v16 performTransactionWithType:0 error:&v32 usingBlock:v30];
    id v17 = v32;
    id v18 = v17;
    if (v12)
    {
      if (v4)
      {
        uint64_t v28 = v15;
        id v29 = v17;
        unsigned __int8 v19 = [v16 incrementalVacuumDatabaseIfNeeded:0 error:&v29];
        id v20 = v29;

        if ((v19 & 1) == 0)
        {
          CLSInitLog();
          unsigned __int8 v21 = CLSLogDatabase;
          if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v44 = 138543362;
            id v45 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Failed to vacuum db: %{public}@", v44, 0xCu);
          }
        }
        id v18 = v20;
        uint64_t v15 = v28;
      }
    }
    else
    {
      CLSInitLog();
      id v22 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v44 = 138543362;
        id v45 = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "DB Transaction failed: %{public}@", v44, 0xCu);
      }
    }
    if (!v14)
    {
      [(PDDatabase *)v9 setCurrentDB:0];
      uint64_t v23 = v41[3];
      [v16 onRowUpdate:0];
      if (!v23) {
        uint64_t v23 = (int)[v16 totalChangesCount] - v15;
      }
      sub_100009F5C((uint64_t)v9->_dbPool, v16);
      if (v23)
      {
        uint64_t v24 = *((void *)v35 + 5);
        id v25 = +[NSDate date];
        [(PDDatabase *)v9 _notifyOfDataChange:v24 changeTime:v25 changedRowCount:v23];
      }
    }
    [(PDDatabase *)v9 unlock];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    CLSInitLog();
    id v11 = CLSLogDatabase;
    unsigned __int8 v12 = 0;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", buf, 2u);
      goto LABEL_6;
    }
  }
LABEL_28:

  return v12;
}

- (void)unlock
{
}

- (void)lock
{
}

- (PDSQLiteDatabase)currentDB
{
  id v3 = +[NSThread currentThread];
  BOOL v4 = [v3 threadDictionary];
  uint64_t v5 = [v4 objectForKeyedSubscript:self->_threadDBKey];

  return (PDSQLiteDatabase *)v5;
}

- (void)setCurrentDB:(id)a3
{
  id v4 = a3;
  id v6 = +[NSThread currentThread];
  uint64_t v5 = [v6 threadDictionary];
  [v5 setObject:v4 forKeyedSubscript:self->_threadDBKey];
}

- (BOOL)searchFor:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 offset:(unint64_t)a7 block:(id)a8
{
  if (a4) {
    return sub_1000465E4(self, a3, a4, a5, a6, a7, a8);
  }
  else {
    return 1;
  }
}

- (id)objectIDsForSQL:(id)a3 resultColumnName:(id)a4 bindings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A39C;
  v17[3] = &unk_1001F1DC0;
  v17[4] = self;
  id v18 = v8;
  id v19 = a5;
  id v20 = v9;
  id v10 = (id)objc_opt_new();
  id v21 = v10;
  id v11 = v9;
  id v12 = v19;
  id v13 = v8;
  sub_10000749C(self, v17);
  uint64_t v14 = v21;
  id v15 = v10;

  return v15;
}

- (id)prlConstraintSQLOnColumn:(id)a3 andValues:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && [v6 count])
  {
    id v8 = +[NSString stringWithFormat:@"and PRL.%@ in ", v5];
    id v9 = +[PDDatabase whereSQLForArray:v7 prefix:v8];
  }
  else
  {
    id v9 = &stru_1001F6580;
  }

  return v9;
}

- (id)prlSelectColumn:(id)a3 havingRoleType:(int64_t)a4 whereConstraintColumn:(id)a5 hasValues:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(PDDatabase *)self prlConstraintSQLOnColumn:a5 andValues:v10];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"select distinct %@ from PDPersonRoleLocation as PRL where PRL.roleType =? %@;",
    v11,
  id v13 = v12);
  id v14 = objc_alloc((Class)NSMutableArray);
  id v15 = +[NSNumber numberWithInteger:a4];
  id v16 = objc_msgSend(v14, "initWithObjects:", v15, 0);

  [v16 addObjectsFromArray:v10];
  id v17 = [(PDDatabase *)self objectIDsForSQL:v13 resultColumnName:v11 bindings:v16];

  return v17;
}

- (id)prlSelectColumn:(id)a3 havingPrivilege:(id)a4 whereConstraintColumn:(id)a5 hasValues:(id)a6
{
  id v10 = (__CFString *)a4;
  if (!v10) {
    id v10 = @"❌✋🔒";
  }
  id v11 = a6;
  id v12 = a3;
  id v13 = [(PDDatabase *)self prlConstraintSQLOnColumn:a5 andValues:v11];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"select distinct %@ from PDPersonRoleLocation as PRL join PDRolePrivilege as P on PRL.roleID = P.roleID and P.privilegeName =? %@;",
    v12,
  id v14 = v13);
  id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v10, 0);
  [v15 addObjectsFromArray:v11];

  id v16 = [(PDDatabase *)self objectIDsForSQL:v14 resultColumnName:v12 bindings:v15];

  return v16;
}

- (id)personIDsMatchingConstraintsForSearchSpecification:(id)a3
{
  id v4 = a3;
  if (![v4 hasPersonConstraints])
  {
    id v11 = 0;
    goto LABEL_34;
  }
  id v5 = [v4 personLocationIDs];

  if (v5)
  {
    id v6 = [v4 personLocationIDs];
    id v5 = [(PDDatabase *)self personIDsAnyRoleAtLocationIDs:v6];
  }
  id v7 = [v4 requiredRoleID];

  if (v7)
  {
    id v8 = [v4 requiredRoleID];
    id v9 = [v4 personLocationIDs];
    id v10 = [(PDDatabase *)self personIDsWithRoleID:v8 atLocationIDs:v9];

LABEL_9:
    goto LABEL_10;
  }
  if ([v4 requiredRoleType])
  {
    id v12 = [v4 requiredRoleType];
    id v8 = [v4 personLocationIDs];
    id v10 = [(PDDatabase *)self personIDsWithRoleType:v12 atLocationIDs:v8];
    goto LABEL_9;
  }
  id v10 = 0;
LABEL_10:
  id v13 = [v4 requiredPrivilege];

  if (v13)
  {
    id v14 = [v4 requiredPrivilege];
    id v15 = [v4 requiredPrivilegeLocationIDs];
    id v13 = sub_10001AAE4(self, (uint64_t)v14, (uint64_t)v15);
  }
  id v16 = [v4 prohibitedPrivilege];

  if (v16)
  {
    id v17 = [v4 prohibitedPrivilege];
    id v18 = [v4 prohibitedPrivilegeLocationIDs];
    id v19 = sub_10001AB2C(self, v17, v18);
  }
  else
  {
    id v19 = 0;
  }
  if (!v5)
  {
    if (!v10)
    {
      if (!v13)
      {
        if (!v19)
        {
          id v21 = 0;
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  uint64_t v20 = +[NSMutableSet setWithArray:v5];
  id v21 = (void *)v20;
  if (v10)
  {
    if (v20)
    {
      id v22 = +[NSSet setWithArray:v10];
      [v21 intersectSet:v22];

      goto LABEL_21;
    }
LABEL_20:
    id v21 = +[NSMutableSet setWithArray:v10];
  }
LABEL_21:
  if (!v13) {
    goto LABEL_24;
  }
  if (v21)
  {
    uint64_t v23 = +[NSSet setWithArray:v13];
    [v21 intersectSet:v23];

LABEL_24:
    if (!v19) {
      goto LABEL_33;
    }
LABEL_29:
    if (v21)
    {
      uint64_t v24 = +[NSSet setWithArray:v19];
      [v21 intersectSet:v24];

      goto LABEL_33;
    }
LABEL_32:
    id v21 = +[NSMutableSet setWithArray:v19];
    goto LABEL_33;
  }
LABEL_28:
  id v21 = +[NSMutableSet setWithArray:v13];
  if (v19) {
    goto LABEL_29;
  }
LABEL_33:
  id v11 = [v21 allObjects];

LABEL_34:

  return v11;
}

- (id)personIDsAnyRoleAtLocationIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[PDDatabase whereSQLForArray:v4 prefix:@"select distinct personID from PDPersonRoleLocation where locationID in "];
    id v6 = [(PDDatabase *)self objectIDsForSQL:v5 resultColumnName:@"personID" bindings:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)personIDsWithRoleID:(id)a3 atLocationIDs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDDatabase *)self prlConstraintSQLOnColumn:@"locationID" andValues:v6];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"select distinct personID from PDPersonRoleLocation as PRL where PRL.roleID =? %@;",
  id v9 = v8);
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v7, 0);

  [v10 addObjectsFromArray:v6];
  id v11 = [(PDDatabase *)self objectIDsForSQL:v9 resultColumnName:@"personID" bindings:v10];

  return v11;
}

- (id)personIDsWithRoleType:(int64_t)a3 atLocationIDs:(id)a4
{
  return [(PDDatabase *)self prlSelectColumn:@"personID" havingRoleType:a3 whereConstraintColumn:@"locationID" hasValues:a4];
}

- (id)locationSearchPredicateForSearchSpec:(id)a3
{
  id v4 = a3;
  id v5 = [(PDDatabase *)self locationIDsMatchingConstraintsForSearchSpecification:v4];
  if (v5)
  {
    id v6 = [v4 searchString];

    if (v6)
    {
      id v7 = [v4 classLocationIDs];
      id v8 = [v4 predicateWithLocationIDs:v7];

      goto LABEL_7;
    }
    uint64_t v9 = +[CLSDataObserver predicateForObjectsWithObjectIDs:v5];
  }
  else
  {
    uint64_t v9 = [v4 predicate];
  }
  id v8 = (void *)v9;
LABEL_7:

  return v8;
}

- (id)locationIDsMatchingConstraintsForSearchSpecification:(id)a3
{
  id v4 = a3;
  if (![v4 hasLocationConstraints])
  {
    id v8 = 0;
    goto LABEL_23;
  }
  if ([v4 requiredLocationRoleType])
  {
    id v5 = [v4 requiredLocationRoleType];
    id v6 = [v4 locationPersonIDs];
    id v7 = [(PDDatabase *)self locationIDsWithRoleType:v5 onPersonIDs:v6];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v9 = [v4 requiredLocationPrivilege];

  if (v9)
  {
    id v10 = [v4 requiredLocationPrivilege];
    id v11 = [v4 requiredLocationPersonIDs];
    uint64_t v9 = [(PDDatabase *)self locationIDsWithPrivilege:v10 onPersonIDs:v11];
  }
  id v12 = [v4 prohibitedLocationPrivilege];

  if (v12)
  {
    id v13 = [v4 prohibitedLocationPrivilege];
    id v14 = [v4 requiredLocationPersonIDs];
    id v15 = [(PDDatabase *)self locationIDsWithoutPrivilege:v13 onPersonIDs:v14];
  }
  else
  {
    id v15 = 0;
  }
  if (v7)
  {
    uint64_t v16 = +[NSMutableSet setWithArray:v7];
    id v17 = (void *)v16;
    if (!v9) {
      goto LABEL_17;
    }
    if (v16)
    {
      id v18 = +[NSSet setWithArray:v9];
      [v17 intersectSet:v18];

      goto LABEL_17;
    }
  }
  else if (!v9)
  {
    if (!v15)
    {
      id v17 = 0;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v17 = +[NSMutableSet setWithArray:v9];
LABEL_17:
  if (v15)
  {
    if (v17)
    {
      id v19 = +[NSSet setWithArray:v15];
      [v17 intersectSet:v19];

      goto LABEL_22;
    }
LABEL_21:
    id v17 = +[NSMutableSet setWithArray:v15];
  }
LABEL_22:
  id v8 = [v17 allObjects];

LABEL_23:

  return v8;
}

- (id)locationIDsWithRoleType:(int64_t)a3 onPersonIDs:(id)a4
{
  return [(PDDatabase *)self prlSelectColumn:@"locationID" havingRoleType:a3 whereConstraintColumn:@"personID" hasValues:a4];
}

- (id)locationIDsWithPrivilege:(id)a3 onPersonIDs:(id)a4
{
  return [(PDDatabase *)self prlSelectColumn:@"locationID" havingPrivilege:a3 whereConstraintColumn:@"personID" hasValues:a4];
}

- (id)locationIDsWithoutPrivilege:(id)a3 onPersonIDs:(id)a4
{
  id v6 = (__CFString *)a3;
  if (!v6) {
    id v6 = @"❌✋🔒";
  }
  id v7 = a4;
  id v8 = [(PDDatabase *)self prlConstraintSQLOnColumn:@"personID" andValues:v7];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"select objectID from CLSLocation where CLSLocation.objectid NOT IN( select distinct %@ from PDPersonRoleLocation as PRL  join PDRolePrivilege as P  on PRL.roleID = P.roleID and P.privilegeName =?  %@);",
    @"locationID",
  uint64_t v9 = v8);
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v6, 0);
  [v10 addObjectsFromArray:v7];

  id v11 = [(PDDatabase *)self objectIDsForSQL:v9 resultColumnName:@"objectID" bindings:v10];

  return v11;
}

- (id)organizationSearchPredicateForSearchSpec:(id)a3
{
  id v3 = a3;
  id v4 = [v3 requiredOrganizationEmailDomain];

  if (v4)
  {
    id v5 = [v3 requiredOrganizationEmailDomain];
    [v3 setSearchString:v5];
  }
  id v6 = [v3 predicate];

  return v6;
}

- (id)personIDsForClassMembersMatchingConstraintsForSearchSpecification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requiredClassMemberClassIDs];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 requiredClassMemberClassIDs];
    id v8 = +[NSString stringWithFormat:@"where %@ in ", @"parentObjectID"];
    uint64_t v9 = +[PDDatabase whereSQLForArray:v7 prefix:v8];

    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"select distinct personID from CLSClassMember %@ AND (roles & ? > 0);",
    id v10 = v9);
    id v11 = objc_opt_new();
    if ([v4 requiredClassMemberRole])
    {
      id v12 = objc_alloc((Class)NSMutableArray);
      id v13 = [v4 requiredClassMemberClassIDs];
      id v14 = [v12 initWithArray:v13];

      [v14 addObject:&off_10020ACC8];
      id v15 = [(PDDatabase *)self objectIDsForSQL:v10 resultColumnName:@"personID" bindings:v14];
      [v11 addObjectsFromArray:v15];
    }
    if (([v4 requiredClassMemberRole] & 2) != 0)
    {
      id v16 = objc_alloc((Class)NSMutableArray);
      id v17 = [v4 requiredClassMemberClassIDs];
      id v18 = [v16 initWithArray:v17];

      [v18 addObject:&off_10020ACE0];
      id v19 = [(PDDatabase *)self objectIDsForSQL:v10 resultColumnName:@"personID" bindings:v18];
      [v11 addObjectsFromArray:v19];
    }
    uint64_t v20 = [v11 allObjects];
  }
  else
  {
    uint64_t v20 = &__NSArray0__struct;
  }

  return v20;
}

- (id)personIDsForGroupMembersMatchingConstraintsForSearchSpecification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requiredGroupMemberGroupIDs];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 requiredGroupMemberGroupIDs];
    id v8 = +[NSString stringWithFormat:@"where %@ in ", @"parentObjectID"];
    uint64_t v9 = +[PDDatabase whereSQLForArray:v7 prefix:v8];

    id v10 = +[NSString stringWithFormat:@"select distinct personID from CLSGroupMember %@", v9];
    id v11 = objc_opt_new();
    id v12 = [v4 requiredGroupMemberGroupIDs];
    id v13 = [(PDDatabase *)self objectIDsForSQL:v10 resultColumnName:@"personID" bindings:v12];
    [v11 addObjectsFromArray:v13];

    id v14 = [v11 allObjects];
  }
  else
  {
    id v14 = &__NSArray0__struct;
  }

  return v14;
}

- (BOOL)_statusID:(id *)a3 deniedCount:(int64_t *)a4 authCount:(int64_t *)a5 forHandoutAssignedItem:(id)a6
{
  id v10 = a6;
  if (![v10 length]) {
    __assert_rtn("-[PDDatabase(CLSHandoutAssignedItem) _statusID:deniedCount:authCount:forHandoutAssignedItem:]", "CLSHandoutAssignedItem+PDDatabaseEntity.m", 231, "objectID.length > 0");
  }
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_10000B624;
  __int16 v41 = sub_10000B52C;
  id v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10000B624;
  v35[4] = sub_10000B52C;
  id v36 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001C624;
  v20[3] = &unk_1001F1E60;
  uint64_t v23 = &v37;
  id v11 = v10;
  id v21 = v11;
  id v22 = self;
  uint64_t v24 = v35;
  id v25 = &v31;
  Class v26 = &v27;
  if ((sub_10000749C(self, v20) & 1) == 0) {
    goto LABEL_15;
  }
  if (!v38[5])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001C8D0;
    v15[3] = &unk_1001F1E88;
    id v18 = v35;
    id v19 = &v37;
    id v16 = v11;
    id v17 = self;
    if (self)
    {
      unsigned int v12 = [(PDDatabase *)self performTransaction:v15 forWriting:1];

      if (v12) {
        goto LABEL_6;
      }
    }
    else
    {
    }
LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }
LABEL_6:
  if (a3) {
    *a3 = (id) v38[5];
  }
  if (a5) {
    *a5 = v28[3];
  }
  if (a4) {
    *a4 = v32[3];
  }
  BOOL v13 = 1;
LABEL_16:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  return v13;
}

- (BOOL)_pruneAuthTreeAtNodeWithAssignedItemStatusID:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  id v28 = v4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10000B624;
  id v18 = sub_10000B52C;
  id v19 = 0;
  id v5 = +[NSArray arrayWithObjects:&v28 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001D514;
  v13[3] = &unk_1001F1E38;
  v13[4] = &v24;
  v13[5] = &v20;
  v13[6] = &v14;
  if (sub_100007540(self, @"select authorizedCount, deniedCount, parentStatusID from AuthStatus where statusID = ? limit 1", 1, v5, v13))
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001D5D4;
    v8[3] = &unk_1001F1F28;
    v8[4] = &v9;
    if (sub_100007540(self, @"select count(*) as count from AuthStatus where parentStatusID = ? limit 1", 1, v5, v8))
    {
      if (v25[3] || v21[3] || !*((unsigned char *)v10 + 24)) {
        goto LABEL_5;
      }
      if (sub_1000AC4E8(self, @"AuthStatus", @"statusID = ?", v5))
      {
        if (v15[5])
        {
          BOOL v6 = -[PDDatabase _pruneAuthTreeAtNodeWithAssignedItemStatusID:](self, "_pruneAuthTreeAtNodeWithAssignedItemStatusID:");
          goto LABEL_12;
        }
LABEL_5:
        BOOL v6 = 1;
LABEL_12:
        _Block_object_dispose(&v9, 8);
        goto LABEL_13;
      }
    }
    BOOL v6 = 0;
    goto LABEL_12;
  }
  BOOL v6 = 0;
LABEL_13:

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v6;
}

- (id)normalizeKeyPath:(id)a3 forValue:(id)a4
{
  id v4 = a3;

  return v4;
}

- (id)normalizedValue:(id)a3 forKeyPath:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  uint64_t v6 = +[CLSCurrentUser magicValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!(v5 | v6) || v5 && v6 && [(id)v5 isEqualToString:v6]))
  {
    sub_100002F74(self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)v5;
  }
  id v8 = v7;

  return v8;
}

- (id)_progressEventsWithAssignedItem:(id)a3 eventType:(int64_t)a4 activityID:(id)a5 activityItemID:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  char v12 = [v9 parentObjectID];
  BOOL v13 = [(PDDatabase *)self select:v11 identity:v12];

  if (v13 && (sub_10001E7F8(self, v13, a4), (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v15 = v14;
    [v14 setActivityID:v10];
    uint64_t v16 = [v9 objectID];
    [v15 setHandoutAuthorizedObjectID:v16];

    id v21 = v15;
    id v17 = +[NSArray arrayWithObjects:&v21 count:1];
  }
  else
  {
    CLSInitLog();
    id v18 = CLSLogUpload;
    if (os_log_type_enabled(CLSLogUpload, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CLSActivity+InsightEvents: failed to build event for assigned item", v20, 2u);
    }
    id v17 = &__NSArray0__struct;
  }

  return v17;
}

- (id)_progressEventsForContext:(id)a3 eventType:(int64_t)a4 activityID:(id)a5 activityItemID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = objc_opt_new();
  id v15 = [v10 identifierPath];
  uint64_t v16 = +[CLSContext objectIDPathFromIdentifierPath:v15];

  [v16 addObject:v11];
  if (v12) {
    [v16 addObject:v12];
  }
  id v17 = [v16 componentsJoinedByString:@"/"];

  uint64_t v18 = objc_opt_class();
  v35[0] = &off_10020ADB8;
  id v19 = [v10 appIdentifier];
  v35[1] = v19;
  uint64_t v20 = +[NSArray arrayWithObjects:v35 count:2];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004CE10;
  v28[3] = &unk_1001F2E10;
  id v29 = v10;
  uint64_t v30 = self;
  int64_t v34 = a4;
  id v31 = v11;
  id v32 = v17;
  id v21 = v13;
  id v33 = v21;
  id v22 = v17;
  id v23 = v11;
  id v24 = v10;
  [(PDDatabase *)self selectAll:v18 where:@"type = ? AND bundleIdentifier = ?" bindings:v20 block:v28];

  id v25 = v33;
  id v26 = v21;

  return v26;
}

- (BOOL)_setCurrentUser:(id)a3 withRoleLocations:(id)a4 orRole:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(PDDatabase *)self lock];
  if ((sub_10010C28C(self, v8, v9) & 1) == 0)
  {
    [v9 count];
    id v12 = 0;
    goto LABEL_25;
  }
  id v10 = [v8 objectID];
  if (sub_10016018C(self, v10, @"currentUserPersonID")) {
    unsigned int v11 = sub_10015FF5C(self, a5, @"currentUserRole");
  }
  else {
    unsigned int v11 = 0;
  }

  id v13 = [v9 count];
  if (!v11 || !v13)
  {
    id v12 = 0;
    if (v11) {
      goto LABEL_30;
    }
LABEL_25:
    objc_setAssociatedObject(self, &off_1001F3410, 0, (void *)1);
    objc_setAssociatedObject(self, &off_1001F3418, 0, (void *)1);
    objc_setAssociatedObject(self, &off_1001F3420, 0, (void *)1);

    BOOL v27 = 0;
    goto LABEL_26;
  }
  unint64_t v32 = a5;
  id v33 = self;
  id v12 = +[NSMutableDictionary dictionaryWithCapacity:v13];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v9;
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v18);
        if (v19) {
          uint64_t v20 = *(void *)(v19 + 32);
        }
        else {
          uint64_t v20 = 0;
        }
        id v21 = +[NSNumber numberWithInteger:v20];
        id v22 = [v21 stringValue];

        id v23 = [v12 objectForKeyedSubscript:v22];
        if (!v23)
        {
          id v23 = objc_opt_new();
          [v12 setObject:v23 forKeyedSubscript:v22];
        }
        if (v19) {
          id v24 = *(void **)(v19 + 24);
        }
        else {
          id v24 = 0;
        }
        id v25 = v24;
        [v23 addObject:v25];

        uint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v26 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
      id v16 = v26;
    }
    while (v26);
  }

  self = v33;
  a5 = v32;
  if ((sub_1001603F8(v33, v12, @"currentUserLocationIDsByRoleType") & 1) == 0) {
    goto LABEL_25;
  }
LABEL_30:
  objc_setAssociatedObject(self, &off_1001F3410, v8, (void *)1);
  id v31 = +[NSNumber numberWithUnsignedInteger:a5];
  objc_setAssociatedObject(self, &off_1001F3418, v31, (void *)1);

  BOOL v27 = 1;
  if (v12)
  {
    objc_setAssociatedObject(self, &off_1001F3420, v12, (void *)1);
  }
  else
  {
    objc_setAssociatedObject(self, &off_1001F3420, 0, (void *)1);
  }
LABEL_26:
  [(PDDatabase *)self unlock];
  id v28 = +[PDUserDefaults sharedDefaults];
  unsigned int v29 = [v28 enableVerboseLogging];

  if (v29) {
    CLSLogDebugCurrentPersona();
  }
  +[CLSUtil postNotificationAsync:"com.apple.progressd.accountChanged"];

  return v27;
}

+ (NSArray)recordTypesOfEntitiesTrackingUserActivity
{
  if (qword_10023E648 != -1) {
    dispatch_once(&qword_10023E648, &stru_1001F47C8);
  }
  v2 = (void *)qword_10023E650;

  return (NSArray *)v2;
}

+ (NSArray)registeredEntities
{
  if (qword_10023E660 != -1) {
    dispatch_once(&qword_10023E660, &stru_1001F47E8);
  }
  v2 = (void *)qword_10023E658;

  return (NSArray *)v2;
}

+ (id)nameOfEntity:(Class)a3
{
  id v4 = sub_1000E5F08();
  unint64_t v5 = [v4 objectForKey:a3];

  return v5;
}

+ (Class)entityNamed:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000E6094();
  id v5 = [v4 objectForKey:v3];

  return (Class)v5;
}

+ (void)registerEntity:(Class)a3
{
  id v4 = sub_1000E6094();
  id v5 = [(objc_class *)a3 entityName];
  [v4 setObject:a3 forKey:v5];

  sub_1000E5F08();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(objc_class *)a3 entityName];
  [v7 setObject:v6 forKey:a3];
}

+ (id)whereSQLForArray:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count]) {
    __assert_rtn("+[PDDatabase(Entities) whereSQLForArray:prefix:]", "PDDatabase+Entities.m", 111, "array.count > 0");
  }
  id v7 = [objc_alloc((Class)NSMutableString) initWithString:v6];
  objc_msgSend(v7, "appendString:", @"(");
  id v8 = (char *)[v5 count];
  if ((unint64_t)v8 >= 2)
  {
    id v9 = v8 - 1;
    do
    {
      [v7 appendString:@"?, "];
      --v9;
    }
    while (v9);
  }
  [v7 appendString:@"?"]);

  return v7;
}

- (void)populateSearchField:(id)a3 bindings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 tokenizableColumnNames];
  long long v35 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v37 = v5;
  id obj = [v5 searchableColumnNames];
  id v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      unsigned int v11 = 0;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v11);
        if (v6) {
          id v13 = (void *)*((void *)v6 + 2);
        }
        else {
          id v13 = 0;
        }
        id v14 = v13;
        id v15 = [v14 indexOfObject:v12];

        id v16 = [v7 containsObject:v12];
        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v17 = v16;
          if (v6) {
            uint64_t v18 = (void *)*((void *)v6 + 3);
          }
          else {
            uint64_t v18 = 0;
          }
          id v19 = v18;
          uint64_t v20 = [v19 objectAtIndexedSubscript:v15];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v17)
            {
              id v21 = objc_msgSend(v20, "_cls_searchableTokens");
              [v35 addObjectsFromArray:v21];
            }
            else
            {
              [v35 addObject:v20];
            }
          }
          if (objc_opt_respondsToSelector())
          {
            id v22 = [v37 tokensForSearchableColumn:v12 withValue:v20 tokenize:v17];
            if (v22) {
              [v35 unionSet:v22];
            }
          }
        }
        unsigned int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v23 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      id v9 = v23;
    }
    while (v23);
  }

  id v24 = [(id)objc_opt_class() searchColumnName];
  id v25 = [v35 allObjects];
  id v26 = [v25 componentsJoinedByString:@"\n"];
  BOOL v27 = [v26 lowercaseString];

  if (v6) {
    id v28 = (void *)*((void *)v6 + 2);
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;
  id v30 = [v29 indexOfObject:v24];

  if (v30 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      id v31 = *((id *)v6 + 2);
      [v31 addObject:v24];

      unint64_t v32 = (void *)*((void *)v6 + 3);
    }
    else
    {
      [0 addObject:v24];
      unint64_t v32 = 0;
    }
    id v33 = v32;
    [v33 addObject:v27];
  }
  else
  {
    if (v6) {
      long long v34 = (void *)*((void *)v6 + 3);
    }
    else {
      long long v34 = 0;
    }
    id v33 = v34;
    [v33 setObject:v27 atIndexedSubscript:v30];
  }
}

- (BOOL)_insertObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [(id)objc_opt_class() entityName];
    id v6 = [v4 identityValue];
    id v14 = v6;
    id v7 = +[NSArray arrayWithObjects:&v14 count:1];
    sub_1000AC4E8(self, v5, @"entityIdentity = ?", v7);
  }
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v10 = sub_10008C488((id *)[PDDatabaseBindings alloc], v8, v9);
  [v4 bindTo:v10];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PDSearchableDatabaseEntity]) {
    [(PDDatabase *)self populateSearchField:v4 bindings:v10];
  }
  unsigned int v11 = [(id)objc_opt_class() entityName];
  if (!sub_1000AC17C(self, v11, v9, v8)) {
    goto LABEL_10;
  }
  if (sub_1000FB340(self, v11)) {
    sub_1000E58EC(self, v4, 1);
  }
  if ([(PDDatabase *)self markObject:v4 as:1])
  {
    [(PDDatabase *)self generateInsightEventsForObject:v4];
    BOOL v12 = 1;
  }
  else
  {
LABEL_10:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)insertObject:(id)a3
{
  id v3 = self;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_1000E687C;
  id v9 = &unk_1001F1ED8;
  uint64_t v10 = self;
  id v4 = a3;
  id v11 = v4;
  if (v10)
  {
    if ([(PDDatabase *)v3 performTransaction:&v6 forWriting:1])
    {
      -[PDDatabase _postDidInsertNotificationWithEntity:](v3, "_postDidInsertNotificationWithEntity:", v4, v6, v7, v8, v9, v10, v11);
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }

  return (char)v3;
}

- (BOOL)insertObjects:(id)a3
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E6A08;
  v15[3] = &unk_1001F1ED8;
  id v4 = a3;
  id v16 = v4;
  id v17 = self;
  if (self)
  {
    if ([(PDDatabase *)self performTransaction:v15 forWriting:1])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = v4;
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v18 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            -[PDDatabase _postDidInsertNotificationWithEntity:](self, "_postDidInsertNotificationWithEntity:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
          }
          id v7 = [v5 countByEnumeratingWithState:&v11 objects:v18 count:16];
        }
        while (v7);
      }

      LOBYTE(self) = 1;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (BOOL)_postDidInsertNotificationWithEntity:(id)a3
{
  id v4 = a3;
  if (v4
    && (id v5 = objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0)
    && ([v5 entityDidInsertNotificationName], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    CFStringRef v12 = @"currentEntity";
    id v13 = v4;
    BOOL v8 = 1;
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:v7 object:self userInfo:v9];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_updateObject:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() identityColumnName];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = objc_alloc_init((Class)NSMutableArray);
    id v19 = v6;
    BOOL v8 = sub_10008C488((id *)[PDDatabaseBindings alloc], v6, v7);
    [v4 bindTo:v8];
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PDSearchableDatabaseEntity]) {
      [(PDDatabase *)self populateSearchField:v4 bindings:v8];
    }
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PDDatabaseEntityWithImmutability])
    {
      id v9 = v4;
      if ([v9 isImmutabilityEnforced])
      {
        uint64_t v10 = [v9 immutableColumnNames];
        sub_10008C5D0((uint64_t)v8, v10);
      }
    }
    id v11 = objc_alloc_init((Class)NSMutableString);
    CFStringRef v12 = [(id)objc_opt_class() identityColumnName];
    [v11 appendString:v12];

    [v11 appendString:@" = ?"];
    id v13 = [(id)objc_opt_class() entityName];
    long long v14 = [v4 identityValue];
    uint64_t v20 = v14;
    id v15 = +[NSArray arrayWithObjects:&v20 count:1];
    unsigned int v16 = sub_1000AC31C(self, v13, v19, v7, v11, v15);

    if (!v16) {
      goto LABEL_13;
    }
    if (sub_1000FB340(self, v13)) {
      sub_1000E58EC(self, v4, 2);
    }
    if ([(PDDatabase *)self markObject:v4 as:2])
    {
      [(PDDatabase *)self generateInsightEventsForObject:v4];
      BOOL v17 = 1;
    }
    else
    {
LABEL_13:
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)updateObject:(id)a3
{
  id v4 = a3;
  [(PDDatabase *)self _postWillChangeNotificationWithEntity:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E6F6C;
  v9[3] = &unk_1001F1ED8;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v5;
  if (self)
  {
    LOBYTE(self) = [(PDDatabase *)self performTransaction:v9 forWriting:1];
    id v7 = v10;
  }
  else
  {
    id v7 = v5;
  }

  return (char)self;
}

- (BOOL)updateObjects:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      BOOL v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PDDatabase *)self _postWillChangeNotificationWithEntity:*(void *)(*((void *)&v14 + 1) + 8 * (void)v8)];
        BOOL v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E70DC;
  v11[3] = &unk_1001F1ED8;
  id v12 = v4;
  id v13 = self;
  id v9 = v4;
  if (self) {
    LOBYTE(self) = [(PDDatabase *)self performTransaction:v11 forWriting:1];
  }

  return (char)self;
}

- (BOOL)_postWillChangeNotificationWithEntity:(id)a3
{
  id v4 = a3;
  if (v4
    && (id v5 = objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0)
    && ([v5 entityWillChangeNotificationName], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = (void *)v6;
    CFStringRef v12 = @"newEntity";
    id v13 = v4;
    BOOL v8 = 1;
    id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:v7 object:self userInfo:v9];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)insertOrUpdateObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  if (v6)
  {
    BOOL v8 = objc_opt_class();
    id v9 = [v8 identityColumnName];
    if (v9)
    {
      id v10 = [v5 identityValue];
      unsigned int v11 = [(PDDatabase *)v6 entityExistsByClass:v8 identity:v10];

      if (v11)
      {
        if (![(PDDatabase *)v6 updateObject:v5])
        {
LABEL_5:
          BOOL v12 = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      else if (![(PDDatabase *)v6 insertObject:v5])
      {
        goto LABEL_5;
      }
    }
    else if (![(PDDatabase *)v6 insertObject:v5])
    {
      goto LABEL_5;
    }
    if (![v5 isMemberOfClass:objc_opt_class()])
    {
LABEL_26:
      BOOL v12 = 1;
      goto LABEL_27;
    }
    id v13 = v5;
    long long v14 = sub_100003E58(v6);
    if ([v13 roles] != (id)1) {
      goto LABEL_25;
    }
    long long v15 = [v13 personID];
    if (!v15)
    {
      id v3 = [v14 objectID];
      if (!v3) {
        goto LABEL_24;
      }
    }
    uint64_t v16 = [v13 personID];
    if (v16)
    {
      long long v17 = (void *)v16;
      uint64_t v18 = [v14 objectID];
      if (v18)
      {
        id v22 = v3;
        id v23 = (void *)v18;
        id v19 = [v13 personID];
        uint64_t v20 = [v14 objectID];
        unsigned int v24 = [v19 isEqualToString:v20];

        if (v15)
        {

          if (!v24) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }

        if (v24) {
LABEL_24:
        }
          +[CLSUtil postNotificationAsync:CLSStudentClassMembershipChangedDarwinNotificationName];
LABEL_25:

        goto LABEL_26;
      }
    }
    if (v15) {

    }
    else {
    goto LABEL_25;
    }
  }
  BOOL v12 = 0;
LABEL_28:

  return v12;
}

- (BOOL)insertOrUpdateObjects:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v7 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        [(PDDatabase *)v5 _postWillChangeNotificationWithEntity:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000E77A8;
  v26[3] = &unk_1001F3060;
  id v13 = v8;
  id v27 = v13;
  id v28 = v5;
  id v14 = v7;
  id v29 = v14;
  if (v5 && [(PDDatabase *)v5 performTransaction:v26 forWriting:1])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          -[PDDatabase _postDidInsertNotificationWithEntity:](v5, "_postDidInsertNotificationWithEntity:", *(void *)(*((void *)&v22 + 1) + 8 * (void)j), (void)v22);
        }
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v17);
    }

    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)trackDeletedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [PDDeletedEntityID alloc];
    id v7 = [v5 identityValue];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = [v5 surveyID];

    id v10 = sub_100169320((id *)&v6->super.isa, v7, v8, v9);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v4 parentObjectID];

    if (v11)
    {
      id v7 = v4;
      if ([v7 parentEntityType] == (id)4)
      {
        BOOL v12 = [v7 parentObjectID];
        id v13 = sub_10016975C(self, v12);

        if (v13)
        {
          id v14 = [PDDeletedEntityID alloc];
          id v15 = [v7 identityValue];
          id v16 = (objc_class *)objc_opt_class();
          id v10 = sub_100169320((id *)&v14->super.isa, v15, v16, v13);

          goto LABEL_10;
        }
      }
    }
  }
  id v17 = [PDDeletedEntityID alloc];
  id v7 = [v4 identityValue];
  uint64_t v18 = (objc_class *)objc_opt_class();
  id v10 = sub_100169320((id *)&v17->super.isa, v7, v18, 0);
LABEL_10:

  return v10;
}

- (BOOL)deleteObject:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() identityColumnName];
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E7C2C;
    v8[3] = &unk_1001F3060;
    id v9 = v4;
    id v10 = self;
    id v6 = v5;
    id v11 = v6;
    if (self)
    {
      LOBYTE(self) = [(PDDatabase *)self performTransaction:v8 forWriting:1];
      id v6 = v11;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (id)select:(Class)a3 identity:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = self;
    if (v7)
    {
      id v8 = [(objc_class *)a3 identityColumnName];
      id v9 = v8;
      if (v8)
      {
        id v10 = [v8 stringByAppendingString:@" = ?"];
        id v14 = v6;
        id v11 = +[NSArray arrayWithObjects:&v14 count:1];
        BOOL v12 = [(PDDatabase *)v7 select:a3 where:v10 bindings:v11];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)selectAll:(Class)a3 block:(id)a4
{
  return [(PDDatabase *)self selectAll:a3 where:0 orderBy:0 limit:0 offset:0 bindings:0 block:a4];
}

- (BOOL)selectAll:(Class)a3 where:(id)a4 bindings:(id)a5 block:(id)a6
{
  return [(PDDatabase *)self selectAll:a3 where:a4 orderBy:0 limit:0 offset:0 bindings:a5 block:a6];
}

- (BOOL)selectAll:(Class)a3 where:(id)a4 orderBy:(id)a5 bindings:(id)a6 block:(id)a7
{
  if (self) {
    LOBYTE(self) = [(PDDatabase *)self selectAll:a3 where:a4 orderBy:a5 limit:0 offset:0 bindings:a6 block:a7];
  }
  return (char)self;
}

- (BOOL)updateAll:(Class)a3 set:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E8128;
  v16[3] = &unk_1001F48F0;
  id v17 = a5;
  uint64_t v18 = self;
  id v20 = v10;
  Class v21 = a3;
  id v19 = a6;
  id v11 = v10;
  id v12 = v19;
  id v13 = v17;
  if (self)
  {
    LOBYTE(self) = [(PDDatabase *)self performTransaction:v16 forWriting:1];
    id v14 = v20;
  }
  else
  {
    id v14 = v11;
  }

  return (char)self;
}

- (BOOL)_deleteAll:(Class)a3 where:(id)a4 bindings:(id)a5 trackDeletes:(BOOL)a6
{
  id v9 = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E87B0;
  v14[3] = &unk_1001F4940;
  id v15 = self;
  id v16 = a4;
  id v17 = a5;
  Class v18 = a3;
  BOOL v19 = a6;
  id v10 = v17;
  id v11 = v16;
  if (v15)
  {
    LOBYTE(v9) = [(PDDatabase *)v9 performTransaction:v14 forWriting:1];
    id v12 = v17;
  }
  else
  {
    id v12 = v10;
  }

  return (char)v9;
}

- (BOOL)deleteAll:(Class)a3 where:(id)a4 bindings:(id)a5
{
  return [(PDDatabase *)self _deleteAll:a3 where:a4 bindings:a5 trackDeletes:1];
}

- (BOOL)deleteAllWithoutTracking:(Class)a3 where:(id)a4 bindings:(id)a5
{
  return [(PDDatabase *)self _deleteAll:a3 where:a4 bindings:a5 trackDeletes:0];
}

- (id)selectColumns:(id)a3 of:(Class)a4 where:(id)a5 bindings:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = sub_10000B754;
  id v20 = sub_10000B5C4;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E8D00;
  v15[3] = &unk_1001F4990;
  void v15[4] = &v16;
  if ([(PDDatabase *)self selectColumns:v10 of:a4 where:v11 orderBy:0 limit:1 offset:0 bindings:v12 block:v15])
  {
    id v13 = (id)v17[5];
  }
  else
  {
    id v13 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)selectColumns:(id)a3 of:(Class)a4 where:(id)a5 bindings:(id)a6 block:(id)a7
{
  return [(PDDatabase *)self selectColumns:a3 of:a4 where:a5 orderBy:0 limit:0 offset:0 bindings:a6 block:a7];
}

- (BOOL)selectColumns:(id)a3 of:(Class)a4 where:(id)a5 orderBy:(id)a6 limit:(int64_t)a7 offset:(unint64_t)a8 bindings:(id)a9 block:(id)a10
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000E8E94;
  v22[3] = &unk_1001F49E0;
  id v23 = a3;
  long long v24 = self;
  id v25 = a5;
  id v26 = a6;
  Class v29 = a4;
  int64_t v30 = a7;
  unint64_t v31 = a8;
  id v27 = a9;
  id v28 = a10;
  id v16 = v28;
  id v17 = v27;
  id v18 = v26;
  id v19 = v25;
  id v20 = v23;
  LOBYTE(self) = sub_10000749C(self, v22);

  return (char)self;
}

- (BOOL)entityClass:(Class)a3 containsColumnNamed:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  [(objc_class *)a3 entityName];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E924C;
  v10[3] = &unk_1001F4A08;
  id v13 = &v14;
  v10[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v7;
  id v8 = v6;
  id v12 = v8;
  sub_10000749C(self, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (BOOL)entityExistsByClass:(Class)a3 identity:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 length])
  {
    id v8 = objc_alloc((Class)NSString);
    id v9 = [(objc_class *)a3 identityColumnName];
    id v10 = [v8 initWithFormat:@"%@ = ?", v9];

    id v15 = v7;
    id v11 = +[NSArray arrayWithObjects:&v15 count:1];
    unint64_t v12 = [(PDDatabase *)self count:a3 where:v10 bindings:v11];

    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)childEntitiesExistForClass:(Class)a3 parentIdentity:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 length])
  {
    unint64_t v12 = v7;
    id v8 = +[NSArray arrayWithObjects:&v12 count:1];
    unint64_t v9 = [(PDDatabase *)self count:a3 where:@"parentObjectID = ?" bindings:v8];

    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)syncableDatabaseEntityExistsByObjectID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (qword_10023E670 != -1) {
    dispatch_once(&qword_10023E670, &stru_1001F4A28);
  }
  if (dword_10023E640 >= 1)
  {
    int v6 = 0;
    do
    {
      [v5 addObject:v4];
      ++v6;
    }
    while (v6 < dword_10023E640);
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E984C;
  v10[3] = &unk_1001F33F0;
  v10[4] = self;
  id v7 = v5;
  id v11 = v7;
  unint64_t v12 = &v13;
  sub_10000749C(self, v10);
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)saveAndSyncObjects:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E9984;
  v6[3] = &unk_1001F1ED8;
  id v7 = self;
  id v8 = a3;
  id v3 = v8;
  unsigned __int8 v4 = [(PDDatabase *)v7 withSyncEnabled:v6];

  return v4;
}

- (BOOL)withSyncEnabled:(id)a3
{
  id v4 = a3;
  if ([(PDDatabase *)self isInSyncBlock])
  {
    if (self) {
      BOOL v5 = [(PDDatabase *)self performTransaction:v4 forWriting:1];
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    [(PDDatabase *)self setInSyncBlock:1];
    [(PDDatabase *)self setSyncableDataWritten:0];
    if (self) {
      BOOL v5 = [(PDDatabase *)self performTransaction:v4 forWriting:1];
    }
    else {
      BOOL v5 = 0;
    }
    if ([(PDDatabase *)self isSyncableDataWritten])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000EADB8;
      block[3] = &unk_1001F2A68;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    [(PDDatabase *)self setSyncableDataWritten:0];
    [(PDDatabase *)self setInSyncBlock:0];
  }

  return v5;
}

- (BOOL)isSyncableDataWritten
{
  v2 = +[NSThread currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"syncDataWritten"];

  LOBYTE(v2) = [v4 BOOLValue];
  return (char)v2;
}

- (void)setSyncableDataWritten:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v3 = +[NSThread currentThread];
  id v4 = [v3 threadDictionary];
  [v4 setObject:v5 forKeyedSubscript:@"syncDataWritten"];
}

- (BOOL)isInSyncBlock
{
  v2 = +[NSThread currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"isInSync"];

  LOBYTE(v2) = [v4 BOOLValue];
  return (char)v2;
}

- (void)setInSyncBlock:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  id v3 = +[NSThread currentThread];
  id v4 = [v3 threadDictionary];
  [v4 setObject:v5 forKeyedSubscript:@"isInSync"];
}

- (BOOL)markObject:(id)a3 as:(int64_t)a4
{
  id v6 = a3;
  if (![(PDDatabase *)self isInSyncBlock]) {
    goto LABEL_10;
  }
  if (![(id)objc_opt_class() conformsToProtocol:&OBJC_PROTOCOL___PDSyncableItem]) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 state] == (id)2) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    BOOL v11 = [(PDDatabase *)self _markObject:v6 as:a4];
    goto LABEL_11;
  }
  id v7 = v6;
  if ([v7 parentEntityType] != (id)4)
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = [v7 parentObjectID];
  BOOL v10 = [(PDDatabase *)self select:v8 identity:v9];

  if (v10 && [v10 state] != (id)2)
  {

    goto LABEL_13;
  }

LABEL_10:
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)markAll:(Class)a3 where:(id)a4 bindings:(id)a5 as:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([(PDDatabase *)self isInSyncBlock]
    && [(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___PDSyncableItem])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000EB234;
    v14[3] = &unk_1001F4AB8;
    void v14[4] = self;
    void v14[5] = a6;
    BOOL v12 = [(PDDatabase *)self selectAll:a3 where:v10 orderBy:0 bindings:v11 block:v14];
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)generateInsightEventsForObject:(id)a3
{
  id v4 = a3;
  if ([(PDDatabase *)self isInSyncBlock]
    && [(id)objc_opt_class() conformsToProtocol:&OBJC_PROTOCOL___PDInsightEventGenerating]&& +[PDEndpointRequestOperation isEndpointAvailable:inDatabase:](PDEndpointRequestOperation, "isEndpointAvailable:inDatabase:", @"uploadEvents", self))
  {
    [(PDDatabase *)self _saveInsightEventsFor:v4];
  }
}

- (void)generateInsightEventsForClass:(Class)a3 where:(id)a4 bindings:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(PDDatabase *)self isInSyncBlock]
    && [(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___PDInsightEventGenerating]&& +[PDEndpointRequestOperation isEndpointAvailable:@"uploadEvents" inDatabase:self])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000EB3C4;
    v10[3] = &unk_1001F4AE0;
    v10[4] = self;
    [(PDDatabase *)self selectAll:a3 where:v8 orderBy:0 bindings:v9 block:v10];
  }
}

- (BOOL)_markObject:(id)a3 as:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    if ([v8 type] == (id)3)
    {
      id v9 = [v8 parentObjectID];

      if (!v9)
      {
        if (a4 == 3) {
          sub_100125224((uint64_t)PDFileSyncManager, v8, self, &stru_1001F4B20);
        }
        LOBYTE(v12) = 1;
        [(PDDatabase *)self setSyncableDataWritten:1];
        goto LABEL_16;
      }
    }
  }
  id v10 = [v6 syncBackend:self];
  if (v10 != (id)-1)
  {
    if (v10)
    {
      if (v10 != (id)1)
      {
        id v13 = 0;
        goto LABEL_13;
      }
      id v11 = off_1001F1490;
    }
    else
    {
      id v11 = off_1001F1498;
    }
    id v13 = [objc_alloc(*v11) initWithObject:v6 state:a4];
LABEL_13:
    uint64_t v14 = objc_opt_class();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000EB688;
    v16[3] = &unk_1001F4B48;
    id v8 = v13;
    id v17 = v8;
    [(PDDatabase *)self selectColumns:&off_10020B218 of:v14 where:0 orderBy:@"position desc" limit:1 offset:0 bindings:0 block:v16];
    BOOL v12 = [(PDDatabase *)self insertObject:v8];
    if (v12) {
      [(PDDatabase *)self setSyncableDataWritten:1];
    }

LABEL_16:
    goto LABEL_17;
  }
  LOBYTE(v12) = 1;
LABEL_17:

  return v12;
}

- (void)_saveInsightEventsFor:(id)a3
{
  id v4 = [a3 generateInsightEventsWithDatabase:self];
  if ([v4 count]) {
    [(PDDatabase *)self insertOrUpdateObjects:v4];
  }
}

+ (void)registerEntities
{
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  +[PDDatabase registerEntity:objc_opt_class()];
  uint64_t v2 = objc_opt_class();

  +[PDDatabase registerEntity:v2];
}

- (PDDatabase)init
{
  uint64_t v3 = objc_opt_class();
  id v4 = NSStringFromSelector(a2);
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PDDatabase;
  [(PDDatabase *)&v2 dealloc];
}

- (id)dbPool
{
  return self->_dbPool;
}

- (void)cleanupAssociatedObjects
{
  [(PDDatabase *)self lock];
  objc_removeAssociatedObjects(self);

  [(PDDatabase *)self unlock];
}

- (BOOL)performFrameworkMigrationIfNeeded
{
  objc_super v2 = self;
  uint64_t v3 = v2;
  if (!v2)
  {
    CLSInitLog();
    id v10 = CLSLogDatabase;
    BOOL v9 = 0;
    if (!os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", (uint8_t *)&v13, 2u);
    goto LABEL_13;
  }
  uint64_t v4 = sub_100004EE8(v2, @"PDClassKitVersion");
  if (v4 <= 2)
  {
    uint64_t v5 = v4;
    CLSInitLog();
    id v6 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218240;
      uint64_t v14 = v5;
      __int16 v15 = 2048;
      uint64_t v16 = 3;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Migrating framework from version %ld to %ld", (uint8_t *)&v13, 0x16u);
    }
    if (sub_1000DB264(v3, @"bootstrap"))
    {
      id v7 = [[PDClassZoneGetChanges alloc] initWithDatabase:v3];
      unsigned int v8 = sub_1000F05DC(v7);

      if (v8)
      {
        sub_10015FF5C(v3, 3, @"PDClassKitVersion");
        goto LABEL_8;
      }
    }
    CLSInitLog();
    id v11 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "framework migration failed", (uint8_t *)&v13, 2u);
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }
LABEL_8:
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (void)setupDevDB
{
  objc_super v2 = self;
  uint64_t v3 = (uint64_t *)v2;
  if (v2)
  {
    [(PDDatabase *)v2 lock];
    uint64_t v4 = sub_100009E10(v3[4]);
    [v3 setCurrentDB:v4];
    [v3 unlock];
  }
  else
  {
    CLSInitLog();
    uint64_t v5 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", v6, 2u);
    }
  }
}

- (void)tearDownDevDB
{
  objc_super v2 = self;
  uint64_t v3 = (uint64_t *)v2;
  if (v2)
  {
    [(PDDatabase *)v2 lock];
    uint64_t v4 = [v3 currentDB];
    sub_100009F5C(v3[4], v4);
    [v3 setCurrentDB:0];
    [v3 unlock];
  }
  else
  {
    CLSInitLog();
    uint64_t v5 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", v6, 2u);
    }
  }
}

- (void)_notifyOfDataChange:(id)a3 changeTime:(id)a4 changedRowCount:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    v19[0] = v9;
    v18[0] = @"PDDataWrittenTime";
    v18[1] = @"PDDataWrittenRowsChangedCount";
    id v10 = +[NSNumber numberWithInteger:a5];
    v19[1] = v10;
    v18[2] = @"PDDataWrittenTablesChanged";
    id v11 = [v8 copy];
    v19[2] = v11;
    BOOL v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  }
  else
  {
    v16[0] = @"PDDataWrittenTime";
    v16[1] = @"PDDataWrittenRowsChangedCount";
    v17[0] = v9;
    id v10 = +[NSNumber numberWithInteger:a5];
    v17[1] = v10;
    BOOL v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB570;
  block[3] = &unk_1001F2710;
  block[4] = self;
  id v15 = v12;
  id v13 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_delete
{
  objc_super v2 = self;
  if (v2)
  {
    uint64_t v3 = +[NSFileManager defaultManager];
    [(PDDatabase *)v2 lock];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [(PDDatabase *)v2 _databaseFileURLs];
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
          id v14 = 0;
          unsigned __int8 v10 = [v3 removeItemAtURL:v9 error:&v14];
          id v11 = v14;
          if ((v10 & 1) == 0)
          {
            CLSInitLog();
            BOOL v12 = CLSLogDatabase;
            if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v20 = v9;
              __int16 v21 = 2114;
              id v22 = v11;
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to delete file at URL \"%{public}@\": %{public}@", buf, 0x16u);
            }
          }

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v6);
    }

    [(PDDatabase *)v2 unlock];
  }
  else
  {
    CLSInitLog();
    id v13 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", buf, 2u);
    }
  }
}

- (BOOL)migrate
{
  objc_super v2 = self;
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(PDDatabase *)v2 currentDB];
    id v33 = 0;
    unsigned __int8 v5 = [v4 executeUncachedSQL:@"                   create table if not exists migrations(     tableName text not null, version integer not null            )                                        ", &v33 error];
    id v6 = v33;
    id v7 = v6;
    if (v5)
    {
      id v32 = v6;
      unsigned __int8 v8 = [v4 executeUncachedSQL:@"create unique index if not exists migrations_tableName on migrations (tableName)" error:&v32];
      id v9 = v32;

      if ((v8 & 1) == 0)
      {
        CLSInitLog();
        id v23 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v36 = v9;
          long long v24 = "Failed to create migrations table indexes; %{public}@";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 0xCu);
        }
LABEL_25:
        BOOL v19 = 0;
        goto LABEL_26;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      unsigned __int8 v10 = [(id)objc_opt_class() registeredEntities];
      id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v29;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            LODWORD(v15) = [(PDDatabase *)v3 migrateEntity:v15];
            if (!v15)
            {

              goto LABEL_25;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v27 = v9;
      unsigned __int8 v17 = [v4 executeUncachedSQL:@"drop table if exists PDBlacklistedApp" error:&v27];
      id v7 = v27;

      if (v17)
      {
        id v26 = v7;
        unsigned __int8 v18 = [v4 executeUncachedSQL:@"drop table if exists PDWhitelistedHost" error:&v26];
        id v9 = v26;

        if (v18)
        {
          BOOL v19 = 1;
LABEL_26:
          id v7 = v9;
          goto LABEL_27;
        }
        CLSInitLog();
        id v23 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v36 = v9;
          long long v24 = "Failed to remove obsolete table; %{public}@";
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      CLSInitLog();
      __int16 v21 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v36 = v7;
        id v22 = "Failed to remove obsolete table; %{public}@";
        goto LABEL_19;
      }
    }
    else
    {
      CLSInitLog();
      __int16 v21 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v36 = v7;
        id v22 = "Failed to create migrations table; %{public}@";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
      }
    }
    BOOL v19 = 0;
LABEL_27:

    goto LABEL_28;
  }
  CLSInitLog();
  uint64_t v20 = CLSLogDatabase;
  BOOL v19 = 0;
  if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", buf, 2u);
    BOOL v19 = 0;
  }
LABEL_28:

  return v19;
}

- (BOOL)migrateEntity:(Class)a3
{
  uint64_t v4 = self;
  if (v4)
  {
    id v6 = [(objc_class *)a3 entityName];
    *(void *)buf = 0;
    id v33 = buf;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    id v7 = [(PDDatabase *)v4 currentDB];
    id v31 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000FC034;
    v29[3] = &unk_1001F3D88;
    id v8 = v6;
    id v30 = v8;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000FC044;
    v28[3] = &unk_1001F4EF8;
    void v28[4] = buf;
    unsigned __int8 v9 = [v7 executeUncachedSQL:@"select version from migrations where tableName = ?" error:&v31 bindingHandler:v29 enumerationHandler:v28];
    id v10 = v31;
    if (v9)
    {
      uint64_t v27 = *((void *)v33 + 3);
      if (-[objc_class migrateFromVersion:finalVersion:inDatabase:](a3, "migrateFromVersion:finalVersion:inDatabase:"))
      {
        if (*((void *)v33 + 3) == v27)
        {
          unsigned __int8 v11 = 1;
        }
        else
        {
          id v26 = v10;
          unsigned __int8 v18 = [v7 validateForeignKeysForTable:v8 databaseName:0 error:&v26];
          id v19 = v26;

          if ((v18 & 1) == 0)
          {
            CLSInitLog();
            uint64_t v20 = CLSLogDatabase;
            if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)id v36 = 138412290;
              Class v37 = a3;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Failed to validate foreign key for %@", v36, 0xCu);
            }
          }
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1000FC080;
          v22[3] = &unk_1001F4F20;
          uint64_t v24 = v27;
          id v25 = v19;
          id v23 = v8;
          unsigned __int8 v11 = [v7 executeUncachedSQL:@"insert or replace into migrations (version, tableName) values (?, ?)", &v25, v22, 0 error bindingHandler enumerationHandler];
          id v10 = v25;

          if ((v11 & 1) == 0)
          {
            CLSInitLog();
            __int16 v21 = CLSLogDatabase;
            if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)id v36 = 138412290;
              Class v37 = a3;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Failed to set new migration version for %@", v36, 0xCu);
            }
          }
        }
        goto LABEL_14;
      }
      CLSInitLog();
      long long v16 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v36 = 138412290;
        Class v37 = a3;
        id v14 = "Failed to execute migrations for %@";
        uint64_t v15 = v16;
        goto LABEL_12;
      }
    }
    else
    {
      CLSInitLog();
      uint64_t v13 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v36 = 138543362;
        Class v37 = (Class)v10;
        id v14 = "Failed to turn ON foreign_keys support; %{public}@";
        uint64_t v15 = v13;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, v36, 0xCu);
      }
    }
    unsigned __int8 v11 = 0;
LABEL_14:

    _Block_object_dispose(buf, 8);
    goto LABEL_15;
  }
  CLSInitLog();
  id v12 = CLSLogDatabase;
  unsigned __int8 v11 = 0;
  if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDDatabase went away during operation", buf, 2u);
    unsigned __int8 v11 = 0;
  }
LABEL_15:

  return v11;
}

- (void)setDatabaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_changeTrackedTableNames, 0);
  objc_storeStrong((id *)&self->_dbPool, 0);
  objc_storeStrong((id *)&self->_threadDBKey, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)personIDsToPerson:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = -[PDDatabase select:identity:](self, "select:identity:", objc_opt_class(), *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_statusID:(id *)a3 deniedCount:(int64_t *)a4 authCount:(int64_t *)a5 forContextPath:(id)a6
{
  id v10 = a6;
  id v11 = [v10 count];
  if (!v11) {
    __assert_rtn("-[PDDatabase(CLSContext) _statusID:deniedCount:authCount:forContextPath:]", "CLSContext+PDDatabaseEntity.m", 508, "pathLength > 0");
  }
  unint64_t v12 = (unint64_t)v11;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_10000B7C4;
  v52 = sub_10000B5FC;
  id v53 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_10000B7C4;
  v46[4] = sub_10000B5FC;
  id v47 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100141C88;
  v26[3] = &unk_1001F5E48;
  id v13 = v10;
  long long v29 = &v48;
  id v30 = v46;
  id v27 = v13;
  long long v28 = self;
  id v31 = &v42;
  id v32 = &v38;
  id v33 = &v34;
  if ((sub_10000749C(self, v26) & 1) == 0) {
    goto LABEL_18;
  }
  unint64_t v14 = v35[3];
  if (v14 < v12)
  {
    if (v14)
    {
      long long v15 = (char *)[v13 count];
      objc_msgSend(v13, "subarrayWithRange:", v14, &v15[-v35[3]]);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = v13;
    }
    v43[3] = 0;
    v39[3] = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100142018;
    v21[3] = &unk_1001F5E70;
    id v17 = v16;
    uint64_t v24 = v46;
    id v25 = &v48;
    id v22 = v17;
    id v23 = self;
    if (self)
    {
      unsigned int v18 = [(PDDatabase *)self performTransaction:v21 forWriting:1];

      if (v18) {
        goto LABEL_9;
      }
    }
    else
    {
    }
LABEL_18:
    BOOL v19 = 0;
    goto LABEL_19;
  }
LABEL_9:
  if (a3) {
    *a3 = (id) v49[5];
  }
  if (a5) {
    *a5 = v39[3];
  }
  if (a4) {
    *a4 = v43[3];
  }
  BOOL v19 = 1;
LABEL_19:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(&v48, 8);
  return v19;
}

- (BOOL)_pruneAuthTreeAtNodeWithContextStatusID:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  id v28 = v4;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10000B7C4;
  unsigned int v18 = sub_10000B5FC;
  id v19 = 0;
  unsigned __int8 v5 = +[NSArray arrayWithObjects:&v28 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100142D80;
  v13[3] = &unk_1001F1E38;
  v13[4] = &v24;
  v13[5] = &v20;
  v13[6] = &v14;
  if (sub_100007540(self, @"select authorizedCount, deniedCount, parentStatusID from AuthStatus where statusID = ? limit 1", 1, v5, v13))
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100142E40;
    v8[3] = &unk_1001F1F28;
    void v8[4] = &v9;
    if (sub_100007540(self, @"select count(*) as count from AuthStatus where parentStatusID = ? limit 1", 1, v5, v8))
    {
      if (v25[3] || v21[3] || !*((unsigned char *)v10 + 24)) {
        goto LABEL_5;
      }
      if (sub_1000AC4E8(self, @"AuthStatus", @"statusID = ?", v5))
      {
        if (v15[5])
        {
          BOOL v6 = -[PDDatabase _pruneAuthTreeAtNodeWithContextStatusID:](self, "_pruneAuthTreeAtNodeWithContextStatusID:");
          goto LABEL_12;
        }
LABEL_5:
        BOOL v6 = 1;
LABEL_12:
        _Block_object_dispose(&v9, 8);
        goto LABEL_13;
      }
    }
    BOOL v6 = 0;
    goto LABEL_12;
  }
  BOOL v6 = 0;
LABEL_13:

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v6;
}

- (BOOL)isIncompleteHandout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [v4 objectID];
  long long v15 = v6;
  id v7 = +[NSArray arrayWithObjects:&v15 count:1];
  id v8 = [(PDDatabase *)self select:v5 where:@"parentObjectID = ?" bindings:v7];

  if (v8)
  {
    LODWORD(v9) = [v8 isCompletedHandout] ^ 1;
  }
  else
  {
    CLSInitLog();
    id v10 = (void *)CLSLogDefault;
    LOBYTE(v9) = 0;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v10;
      uint64_t v11 = [v4 objectID];
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PDUserNotificationTrigger: collaboration state for handout with id: %{public}@ not available.", (uint8_t *)&v13, 0xCu);

      LOBYTE(v9) = 0;
    }
  }

  return (char)v9;
}

@end