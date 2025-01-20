@interface _CRRecentsLibrary
+ (id)defaultPath;
+ (id)storeMapping;
- (BOOL)_mergeRemoteChanges:(id)a3 fromStore:(id)a4 forRecentsDomain:(id)a5;
- (BOOL)_setDatabasePropertyValue:(unint64_t)a3 forKey:(id)a4;
- (BOOL)_synchronizeAllStores;
- (BOOL)_synchronizeStore:(id)a3;
- (BOOL)expungeRecentsOverLimitsForDomain:(id)a3 forcibly:(BOOL)a4 expungedRecentIDs:(id *)a5;
- (CRUbiquitousCoordinator)ubiquitousCoordinator;
- (NSMutableDictionary)cloudStores;
- (_CRRecentsLibrary)init;
- (_CRRecentsLibrary)initWithPath:(id)a3;
- (_CRRecentsLibrary)initWithPath:(id)a3 accountAdaptor:(id)a4;
- (double)storeSyncDelay;
- (id)_activeConnectionWrapper;
- (id)_connectionForWriting:(BOOL)a3;
- (id)_copyRecentContactForID:(int64_t)a3;
- (id)_copyRecentContactForRecordHash:(id)a3 recentsDomain:(id)a4;
- (id)_nts_expungeGroupRecentsOverLimit:(unint64_t)a3 domain:(id)a4 storeKeys:(id *)a5 connection:(id)a6;
- (id)_nts_expungeIndividualRecentsOverLimit:(unint64_t)a3 domain:(id)a4 storeKeys:(id *)a5 connection:(id)a6;
- (id)_nts_expungeRecentsOlderThanDate:(id)a3 domain:(id)a4 storeKeys:(id *)a5 connection:(id)a6;
- (id)_recentsDomainForStore:(id)a3;
- (id)_setActiveConnection:(id)a3 forWriting:(BOOL)a4;
- (id)_storeForRecentsDomain:(id)a3;
- (id)_whereClauseFromPredicate:(id)a3 inDomains:(id)a4 bindings:(id *)a5 error:(id *)a6;
- (id)addressFromExternalAddress:(id)a3 kind:(id)a4;
- (id)addressHandlerForAddressKind:(id)a3;
- (id)bindingForDomain:(id)a3;
- (id)copyContactRecentsFromStatement:(sqlite3_stmt *)a3 selectIndexes:(id *)a4 groupThreshold:(unint64_t)a5 options:(unint64_t)a6;
- (id)copyRecentContactFromStatement:(sqlite3_stmt *)a3 columnIndexes:(id *)a4 populateMetadata:(BOOL)a5;
- (id)copyRecentsForQuery:(id)a3 error:(id *)a4;
- (id)domainClauseWithDomains:(id)a3 bindings:(id)a4;
- (id)externalAddressFromAddress:(id)a3 kind:(id)a4;
- (id)hashForContact:(id)a3;
- (id)hashForGroup:(id)a3;
- (id)hashForGroupMemberHashes:(id)a3;
- (id)hashForGroupMembers:(id)a3 recentsDomain:(id)a4;
- (id)hashesForGroupMembers:(id)a3 recentsDomain:(id)a4;
- (id)keyForContact:(id)a3;
- (id)newConnectionForConnectionPool:(id)a3;
- (id)recentsHashForAddress:(id)a3 kind:(id)a4;
- (id)recentsHashForExternalAddress:(id)a3 kind:(id)a4;
- (id)upcomingEventIdentifierForRecentID:(int64_t)a3;
- (int)beginTransaction:(id)a3 withType:(int)a4;
- (int)commitTransaction:(id)a3;
- (int)handleSqliteError:(sqlite3 *)a3 format:(id)a4;
- (int)rollbackTransaction:(id)a3;
- (unint64_t)_databasePropertyValueByKey:(id)a3;
- (unint64_t)_propertyValueForKey:(id)a3 defaultValue:(unint64_t)a4;
- (unint64_t)maximumGroupRecentsForDomain:(id)a3;
- (unint64_t)maximumRecentsAgeInDaysForDomain:(id)a3;
- (unint64_t)maximumRecentsForDomain:(id)a3;
- (unint64_t)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6;
- (void)_bindContact:(id)a3 withRecentID:(int64_t)a4 forStatement:(sqlite3_stmt *)a5;
- (void)_bindRecent:(id)a3 forStatement:(sqlite3_stmt *)a4;
- (void)_deleteRecentWithRecordHash:(id)a3 kind:(id)a4 recentsDomain:(id)a5;
- (void)_deleteRecentsWithRecentIDs:(id)a3 storeKeys:(id)a4 recentsDomain:(id)a5 deleteInUbiquitousStore:(BOOL)a6;
- (void)_handleBusyError;
- (void)_handleCorruptDatabase;
- (void)_handleFullDatabase;
- (void)_handleIOError;
- (void)_handleNotADB;
- (void)_handleSQLiteErrorCode:(int)a3;
- (void)_initializeStoreForRecentsDomain:(id)a3 storeIdentifier:(id)a4;
- (void)_insertRecentContacts:(id)a3;
- (void)_performTransaction:(id)a3 forWriting:(BOOL)a4;
- (void)_removeDatabase;
- (void)_removeDatabaseFromPrivateVarMobileAndAbort;
- (void)_removeDatabaseFromUnexpectedLocationAndAbort;
- (void)_removeDatabaseFromVarMobileAndAbort;
- (void)_removeDatabaseWithEmptyHomePathAndAbort;
- (void)_saveRecentContacts:(id)a3;
- (void)_setPropertyValue:(unint64_t)a3 forKey:(id)a4;
- (void)_storeChangedExternally:(id)a3;
- (void)_syncContact:(id)a3 withStore:(id)a4;
- (void)_updateRecentContacts:(id)a3;
- (void)cancelPerformExpungeRecentsOverLimitsForDomain:(id)a3;
- (void)closeDatabaseConnections;
- (void)dealloc;
- (void)enumerateRecentsForDomain:(id)a3 usingBlock:(id)a4;
- (void)mergeCloudDataOneWayIntoLocalStoreWithReason:(unint64_t)a3;
- (void)performExpungeRecentsOverLimitsForDomain:(id)a3 afterDelay:(double)a4;
- (void)performReadTransaction:(id)a3;
- (void)performWriteTransaction:(id)a3;
- (void)populateMetadataForRecents:(id)a3;
- (void)removeAllRecentContactsWithCompletion:(id)a3;
- (void)removeContact:(id)a3;
- (void)removeLocalRecordsForDomain:(id)a3 removeInUbiquitousStore:(BOOL)a4;
- (void)removeRecentContactsWithRecentIDs:(id)a3 syncKeys:(id)a4 domain:(id)a5 removeInUbiquitousStore:(BOOL)a6;
- (void)renameOrRemoveDatabaseAndAbort;
- (void)restorePreviouslyDeletedRecentContacts:(id)a3 completion:(id)a4;
- (void)scheduleSynchronizationForStore:(id)a3;
- (void)setCloudStores:(id)a3;
- (void)setMaximumGroupRecents:(unint64_t)a3 forRecentsDomain:(id)a4;
- (void)setMaximumRecents:(unint64_t)a3 forRecentsDomain:(id)a4;
- (void)setMaximumRecentsAgeInDays:(unint64_t)a3 forRecentsDomain:(id)a4;
- (void)setStoreSyncDelay:(double)a3;
- (void)setUbiquitousCoordinator:(id)a3;
- (void)synchronize;
- (void)unlockConnection:(id)a3;
@end

@implementation _CRRecentsLibrary

- (id)domainClauseWithDomains:(id)a3 bindings:(id)a4
{
  id v7 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v11);
        [v7 addObject:@"?"];
        objc_msgSend(a4, "addObject:", -[_CRRecentsLibrary bindingForDomain:](self, "bindingForDomain:", v12));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"bundle_identifier IN (%@)", [v7 componentsJoinedByString:@", "]);
}

- (id)_setActiveConnection:(id)a3 forWriting:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [+[NSThread currentThread] threadDictionary];
  id v7 = (_CRRecentsSQLiteConnectionWrapper *)[(NSMutableDictionary *)v6 objectForKey:@"com.apple.corerecents.recentsLibrary.connection"];
  if (a3)
  {
    id v8 = v7;
    if ([(_CRRecentsSQLiteConnectionWrapper *)v7 connection] != a3)
    {
      id v8 = +[_CRRecentsSQLiteConnectionWrapper wrapperWithConnection:a3 forWriting:v4];
      [(NSMutableDictionary *)v6 setObject:v8 forKey:@"com.apple.corerecents.recentsLibrary.connection"];
    }
  }
  else
  {
    [(NSMutableDictionary *)v6 removeObjectForKey:@"com.apple.corerecents.recentsLibrary.connection"];
    return 0;
  }
  return v8;
}

- (id)_activeConnectionWrapper
{
  v2 = [+[NSThread currentThread] threadDictionary];
  return [(NSMutableDictionary *)v2 objectForKey:@"com.apple.corerecents.recentsLibrary.connection"];
}

- (id)copyContactRecentsFromStatement:(sqlite3_stmt *)a3 selectIndexes:(id *)a4 groupThreshold:(unint64_t)a5 options:(unint64_t)a6
{
  char v6 = a6;
  id v11 = +[NSMutableDictionary dictionary];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  long long v12 = *(_OWORD *)&a4->var0.var4;
  long long v21 = *(_OWORD *)&a4->var0.var0;
  v20[2] = sub_10000A150;
  v20[3] = &unk_10002CCB8;
  v20[5] = v11;
  v20[6] = a3;
  long long v22 = v12;
  $07919FF52A1CF34B835B8E07CC3CE49A var1 = a4->var1;
  v20[4] = self;
  id v13 = +[CRSQLRow enumerateRowsInStatement:a3 usingBlock:v20];
  id v14 = +[NSMutableDictionary dictionary];
  if ([v11 count])
  {
    id v15 = [(CRAccountAdaptor *)self->_accountAdaptor senderEmailAddresses];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A23C;
    v17[3] = &unk_10002CCE0;
    BOOL v18 = a5 != 0;
    char v19 = v6 & 1;
    v17[4] = self;
    v17[5] = v15;
    v17[6] = v14;
    v17[7] = a5;
    [v11 enumerateKeysAndObjectsUsingBlock:v17];
  }
  if (v13 == 101)
  {
    if ([v14 count]) {
      [(_CRRecentsLibrary *)self populateMetadataForRecents:v14];
    }
  }
  else
  {
    [(_CRRecentsLibrary *)self _handleSQLiteErrorCode:v13];
  }
  return [v14 allValues];
}

- (id)_whereClauseFromPredicate:(id)a3 inDomains:(id)a4 bindings:(id *)a5 error:(id *)a6
{
  id v11 = +[NSMutableArray array];
  id v12 = +[NSMutableArray array];
  id v13 = objc_msgSend(a3, "cr_predicateClauseWithBindings:error:", v12, a6);
  if (a3 && !v13) {
    return 0;
  }
  objc_msgSend(v11, "cr_addNonNilObject:", v13);
  objc_msgSend(v11, "cr_addNonNilObject:", -[_CRRecentsLibrary domainClauseWithDomains:bindings:](self, "domainClauseWithDomains:bindings:", a4, v12));
  if (![v11 count]) {
    return 0;
  }
  id result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"WHERE %@", [v11 componentsJoinedByString:@" AND "]);
  *a5 = v12;
  return result;
}

- (id)_connectionForWriting:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_CRRecentsLibrary *)self _activeConnectionWrapper];
  id v6 = [v5 connection];
  if (v6)
  {
    id v7 = v6;
    if (!v5) {
      return v7;
    }
    goto LABEL_9;
  }
  connectionPool = self->_connectionPool;
  if (v3) {
    id v9 = [(CRSQLiteConnectionPool *)connectionPool writerConnection];
  }
  else {
    id v9 = [(CRSQLiteConnectionPool *)connectionPool readerConnection];
  }
  id v7 = v9;
  if (!v9) {
    sub_10001A88C();
  }
  id v5 = [(_CRRecentsLibrary *)self _setActiveConnection:v9 forWriting:v3];
  if (v5)
  {
LABEL_9:
    if (v3)
    {
      if (pthread_main_np())
      {
        uint64_t v10 = +[CRLogging log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: getting writer connection on the main thread", v12, 2u);
        }
      }
      if (([v5 writer] & 1) == 0) {
        sub_10001A8B8();
      }
    }
    [v5 incrementRefcount];
  }
  return v7;
}

- (void)unlockConnection:(id)a3
{
  id v5 = [(_CRRecentsLibrary *)self _activeConnectionWrapper];
  if ([v5 connection] != a3) {
    sub_10001A860();
  }
  if (![v5 decrementRefcount])
  {
    [(CRSQLiteConnectionPool *)self->_connectionPool checkInConnection:a3];
    [(_CRRecentsLibrary *)self _setActiveConnection:0 forWriting:0];
  }
}

- (void)performReadTransaction:(id)a3
{
}

- (id)copyRecentsForQuery:(id)a3 error:(id *)a4
{
  id v7 = [a3 predicate];
  id v8 = [a3 domains];
  id v9 = [a3 implicitGroupThreshold];
  id v10 = [a3 options];
  if (![v8 count])
  {
    id v12 = 0;
    if (a4) {
      *a4 = +[NSError errorWithDomain:CRRecentContactsErrorDomain code:1001 userInfo:0];
    }
    return v12;
  }
  if ((v10 & 2) == 0 || ![(CRAccountAdaptor *)self->_accountAdaptor isUsingiCloud])
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3052000000;
    long long v17 = sub_100009AD8;
    BOOL v18 = sub_100009AE8;
    uint64_t v19 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005ABC;
    v13[3] = &unk_10002CC18;
    v13[4] = self;
    v13[5] = v7;
    v13[8] = &v14;
    v13[9] = a4;
    v13[10] = v9;
    v13[11] = v10;
    v13[6] = v8;
    v13[7] = a3;
    [(_CRRecentsLibrary *)self performReadTransaction:v13];
    id v12 = (void *)v15[5];
    _Block_object_dispose(&v14, 8);
    return v12;
  }
  return objc_alloc_init((Class)NSArray);
}

- (int)commitTransaction:(id)a3
{
  int v5 = [a3 commitTransaction];
  if (v5) {
    -[_CRRecentsLibrary handleSqliteError:format:](self, "handleSqliteError:format:", [a3 db], @"recents: committing transaction");
  }
  return v5;
}

- (id)bindingForDomain:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006AA0;
  v4[3] = &unk_10002CBF0;
  v4[4] = a3;
  return [v4 copy];
}

- (int)beginTransaction:(id)a3 withType:(int)a4
{
  int v6 = [a3 beginTransactionWithType:*(void *)&a4];
  if (v6) {
    -[_CRRecentsLibrary handleSqliteError:format:](self, "handleSqliteError:format:", [a3 db], @"recents: beginning transaction");
  }
  return v6;
}

- (void)_performTransaction:(id)a3 forWriting:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(_CRRecentsLibrary *)self _connectionForWriting:a4];
  [(_CRRecentsLibrary *)self beginTransaction:v7 withType:v4];
  if ((*((unsigned int (**)(id, id))a3 + 2))(a3, v7)) {
    [(_CRRecentsLibrary *)self commitTransaction:v7];
  }
  else {
    [(_CRRecentsLibrary *)self rollbackTransaction:v7];
  }
  [(_CRRecentsLibrary *)self unlockConnection:v7];
}

+ (id)defaultPath
{
  if (qword_1000344D0 != -1) {
    dispatch_once(&qword_1000344D0, &stru_10002CBA0);
  }
  return (id)qword_1000344C8;
}

+ (id)storeMapping
{
  v3[0] = CRRecentsDomainMail;
  v3[1] = CRRecentsDomainEventKitLocation;
  v4[0] = @"com.apple.mail.recents";
  v4[1] = @"com.apple.eventkit.locations";
  v3[2] = CRRecentsDomainPassbook;
  v4[2] = @"com.apple.passbook.locations";
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

- (_CRRecentsLibrary)init
{
  id v3 = [(id)objc_opt_class() defaultPath];
  return [(_CRRecentsLibrary *)self initWithPath:v3];
}

- (_CRRecentsLibrary)initWithPath:(id)a3
{
  return [(_CRRecentsLibrary *)self initWithPath:a3 accountAdaptor:0];
}

- (_CRRecentsLibrary)initWithPath:(id)a3 accountAdaptor:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_CRRecentsLibrary;
  int v6 = [(_CRRecentsLibrary *)&v13 init];
  if (v6)
  {
    id v7 = [[CRRecentsMigrator alloc] initWithDelegate:v6];
    v6->_migrator = v7;
    [(CRRecentsMigrator *)v7 migrateMailEmbeddedLibraryToPath:a3];
    v6->_storeSyncDelay = 60.0;
    v6->_pluginManager = [[CRPluginManager alloc] initWithPath:+[CRPluginManager defaultPluginPath]];
    v6->_lock = (NSLock *)objc_alloc_init((Class)NSLock);
    v6->_cachedProperties = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, 0);
    v6->_pendingDomainExpunges = objc_alloc_init(CRDelayedWorkQueue);
    v6->_pendingStoreSyncEvents = objc_alloc_init(CRDelayedWorkQueue);
    v6->_path = (NSString *)[a3 copy];
    id v8 = [[CRSQLiteConnectionPool alloc] initWithDelegate:v6 maxConcurrentReaders:3];
    v6->_connectionPool = v8;
    [(CRSQLiteConnectionPool *)v8 setCacheSize:1];
    uint64_t v9 = CRRecentsDomainMaps;
    [(_CRRecentsLibrary *)v6 setMaximumRecentsAgeInDays:60 forRecentsDomain:CRRecentsDomainMaps];
    [(_CRRecentsLibrary *)v6 performExpungeRecentsOverLimitsForDomain:v9 afterDelay:30.0];
    v6->_ubiquitousCoordinator = [[CRUbiquitousCoordinator alloc] initWithDelegate:v6];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009258;
    v12[3] = &unk_10002CBC8;
    v12[4] = v6;
    objc_msgSend(objc_msgSend((id)objc_opt_class(), "storeMapping"), "enumerateKeysAndObjectsUsingBlock:", v12);
    [(_CRRecentsLibrary *)v6 _synchronizeAllStores];
    if (a4) {
      id v10 = (CRAccountAdaptor *)a4;
    }
    else {
      id v10 = [[CRAccountAdaptor alloc] initWithDelegate:v6->_ubiquitousCoordinator];
    }
    v6->_accountAdaptor = v10;
  }
  return v6;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  cachedProperties = self->_cachedProperties;
  if (cachedProperties) {
    CFRelease(cachedProperties);
  }

  [(_CRRecentsLibrary *)self closeDatabaseConnections];
  [(CRSQLiteConnectionPool *)self->_connectionPool setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)_CRRecentsLibrary;
  [(_CRRecentsLibrary *)&v4 dealloc];
}

- (void)closeDatabaseConnections
{
}

- (id)newConnectionForConnectionPool:(id)a3
{
  objc_super v4 = [[CRSQLiteConnection alloc] initWithPath:self->_path databaseName:@"Recents"];
  id v5 = (id)[(CRSQLiteConnection *)v4 open];
  [(_CRRecentsLibrary *)self _handleSQLiteErrorCode:v5];
  if (v5
    || ![(CRRecentsMigrator *)self->_migrator migrateWithSQLiteConnection:v4])
  {
    [(CRSQLiteConnection *)v4 close];

    [(_CRRecentsLibrary *)self _handleCorruptDatabase];
    objc_super v4 = 0;
  }
  if ([(CRRecentsMigrator *)self->_migrator needsRebuild]) {
    [(_CRRecentsLibrary *)self mergeCloudDataOneWayIntoLocalStoreWithReason:0x80000000];
  }
  return v4;
}

- (void)renameOrRemoveDatabaseAndAbort
{
  if ([(NSString *)self->_path isEqualToString:@"/private/var/mobile/Library/Recents"])
  {
    [(_CRRecentsLibrary *)self _removeDatabaseFromPrivateVarMobileAndAbort];
  }
  else if ([(NSString *)self->_path isEqualToString:@"/var/mobile/Library/Recents"])
  {
    [(_CRRecentsLibrary *)self _removeDatabaseFromVarMobileAndAbort];
  }
  else if ([(NSString *)self->_path isEqualToString:@"/Library/Recents"])
  {
    [(_CRRecentsLibrary *)self _removeDatabaseWithEmptyHomePathAndAbort];
  }
  else
  {
    [(_CRRecentsLibrary *)self _removeDatabaseFromUnexpectedLocationAndAbort];
  }
}

- (void)_removeDatabase
{
  v2 = [(NSString *)self->_path stringByAppendingPathComponent:@"Recents"];
  CRRemoveDatabase(v2);
}

- (void)_removeDatabaseFromPrivateVarMobileAndAbort
{
}

- (void)_removeDatabaseFromVarMobileAndAbort
{
}

- (void)_removeDatabaseWithEmptyHomePathAndAbort
{
  id v3 = +[CRLogging log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_super v4 = [(NSString *)self->_path stringByAbbreviatingWithTildeInPath];
    int v5 = 138543362;
    int v6 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Attempting to delete a recents database for a nonsensical path, %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(_CRRecentsLibrary *)self _removeDatabase];
  abort();
}

- (void)_removeDatabaseFromUnexpectedLocationAndAbort
{
  id v3 = +[CRLogging log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_super v4 = [(NSString *)self->_path stringByAbbreviatingWithTildeInPath];
    int v5 = 138543362;
    int v6 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Attempting to delete a recents database for an unusual path, %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(_CRRecentsLibrary *)self _removeDatabase];
  abort();
}

- (void)_handleCorruptDatabase
{
}

- (void)_handleNotADB
{
}

- (void)_handleFullDatabase
{
}

- (void)_handleIOError
{
}

- (void)_handleBusyError
{
}

- (void)_handleSQLiteErrorCode:(int)a3
{
  switch((char)a3)
  {
    case 5:
      [(_CRRecentsLibrary *)self _handleBusyError];
      break;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
      return;
    case 10:
      [(_CRRecentsLibrary *)self _handleIOError];
      break;
    case 11:
      [(_CRRecentsLibrary *)self _handleCorruptDatabase];
      break;
    case 13:
      [(_CRRecentsLibrary *)self _handleFullDatabase];
      break;
    default:
      if (a3 == 26) {
        [(_CRRecentsLibrary *)self _handleNotADB];
      }
      break;
  }
}

- (int)handleSqliteError:(sqlite3 *)a3 format:(id)a4
{
  uint64_t v7 = sqlite3_errcode(a3);
  uint64_t v8 = v7;
  if ((v7 - 100) >= 2 && v7 != 0) {
    CRLogSQLiteError(a3, (uint64_t)a4);
  }
  [(_CRRecentsLibrary *)self _handleSQLiteErrorCode:v8];
  return v8;
}

- (int)rollbackTransaction:(id)a3
{
  int v5 = [a3 rollbackTransaction];
  if (v5) {
    -[_CRRecentsLibrary handleSqliteError:format:](self, "handleSqliteError:format:", [a3 db], @"recents: rolling back transaction");
  }
  return v5;
}

- (void)performWriteTransaction:(id)a3
{
}

- (id)copyRecentContactFromStatement:(sqlite3_stmt *)a3 columnIndexes:(id *)a4 populateMetadata:(BOOL)a5
{
  BOOL v19 = a5;
  uint64_t v7 = +[CRSQLRow rowWithStatement:a3];
  id v24 = objc_msgSend(-[CRSQLRow numberWithIntegerAtIndex:](v7, "numberWithIntegerAtIndex:", a4->var0.var0), "cr_CRRecentIDValue");
  id v20 = objc_msgSend(-[CRSQLRow numberWithIntegerAtIndex:](v7, "numberWithIntegerAtIndex:", a4->var1.var0), "cr_CRContactIDValue");
  id v8 = [(CRSQLRow *)v7 stringAtIndex:a4->var1.var1];
  id v9 = [(CRSQLRow *)v7 stringAtIndex:a4->var1.var4];
  id v23 = [(CRSQLRow *)v7 stringAtIndex:a4->var0.var1];
  id v22 = [(CRSQLRow *)v7 stringAtIndex:a4->var1.var3];
  id v21 = [(CRSQLRow *)v7 stringAtIndex:a4->var0.var3];
  id v10 = [(CRSQLRow *)v7 stringAtIndex:a4->var0.var2];
  id v11 = [(CRSQLRow *)v7 stringAtIndex:a4->var0.var4];
  id v12 = [(CRSQLRow *)v7 stringAtIndex:a4->var0.var5];
  id v13 = [(CRSQLRow *)v7 numberWithDoubleAtIndex:a4->var0.var6];
  id v14 = objc_msgSend(-[CRSQLRow numberWithIntegerAtIndex:](v7, "numberWithIntegerAtIndex:", a4->var0.var7), "cr_CRContactGroupKindValue");
  id v15 = +[NSMutableArray arrayWithCapacity:kCRRecentContactMaxDateEvents];
  uint64_t v16 = +[NSScanner scannerWithString:v10];
  if (![(NSScanner *)v16 isAtEnd])
  {
    do
    {
      uint64_t v27 = 0;
      if ([(NSScanner *)v16 scanLongLong:&v27]) {
        [(NSMutableArray *)v15 addObject:+[NSDate dateWithTimeIntervalSince1970:(double)v27 / 1000.0]];
      }
      [(NSScanner *)v16 scanString:@":" intoString:0];
    }
    while (![(NSScanner *)v16 isAtEnd]);
  }
  id v17 = [objc_alloc((Class)CRRecentContact) initWithContactID:v20];
  [v17 setRecentID:v24];
  [v17 setKind:v8];
  [v17 setRawAddress:v9];
  objc_msgSend(v17, "setAddress:", -[_CRRecentsLibrary externalAddressFromAddress:kind:](self, "externalAddressFromAddress:kind:", v9, v8));
  [v17 setRecentsDomain:v23];
  [v17 setDisplayName:v22];
  [v17 setGroupName:v21];
  [v17 setRecentDates:v15];
  [v17 setLastSendingAddress:v11];
  [v17 setOriginalSource:v12];
  [v17 setWeight:v13];
  [v17 setGroupKind:v14];
  if (v17 && v19)
  {
    v28 = +[NSNumber numberWithLongLong:v24];
    id v29 = v17;
    [(_CRRecentsLibrary *)self populateMetadataForRecents:+[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1]];
  }
  return v17;
}

- (void)populateMetadataForRecents:(id)a3
{
  id v5 = [a3 count];
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100009B84;
    v6[3] = &unk_10002CC68;
    v6[5] = self;
    v6[6] = v5;
    v6[4] = a3;
    [(_CRRecentsLibrary *)self performReadTransaction:v6];
  }
}

- (id)upcomingEventIdentifierForRecentID:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = sub_100009AD8;
  id v10 = sub_100009AE8;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A040;
  v5[3] = &unk_10002CC90;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(_CRRecentsLibrary *)self performReadTransaction:v5];
  id v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)hashForGroupMembers:(id)a3 recentsDomain:(id)a4
{
  id v5 = [(_CRRecentsLibrary *)self hashesForGroupMembers:a3 recentsDomain:a4];
  return [(_CRRecentsLibrary *)self hashForGroupMemberHashes:v5];
}

- (id)hashesForGroupMembers:(id)a3 recentsDomain:(id)a4
{
  uint64_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a3;
  id v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = -[_CRRecentsLibrary recentsHashForExternalAddress:kind:](self, "recentsHashForExternalAddress:kind:", [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKey:@"address"], objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "objectForKey:", @"kind"));
        if (!v12) {
          return 0;
        }
        [(NSMutableArray *)v6 cr_insertObject:v12 usingComparator:&stru_10002D118];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (id)hashForGroupMemberHashes:(id)a3
{
  if ([a3 count] == (id)1)
  {
    return [a3 firstObject];
  }
  else
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "componentsJoinedByString:", &stru_10002D980), "dataUsingEncoding:", 4);
    return objc_msgSend(v5, "cr_md5DigestHexString");
  }
}

- (id)_copyRecentContactForRecordHash:(id)a3 recentsDomain:(id)a4
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_100009AD8;
  uint64_t v11 = sub_100009AE8;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A85C;
  v6[3] = &unk_10002CD30;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  void v6[7] = &v7;
  [(_CRRecentsLibrary *)self performReadTransaction:v6];
  objc_super v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_copyRecentContactForID:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_100009AD8;
  uint64_t v10 = sub_100009AE8;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000AD2C;
  v5[3] = &unk_10002CD58;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(_CRRecentsLibrary *)self performReadTransaction:v5];
  id v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)enumerateRecentsForDomain:(id)a3 usingBlock:(id)a4
{
  if (a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000B008;
    void v4[3] = &unk_10002CD80;
    v4[4] = a3;
    void v4[5] = self;
    v4[6] = a4;
    [(_CRRecentsLibrary *)self performReadTransaction:v4];
  }
}

- (void)removeRecentContactsWithRecentIDs:(id)a3 syncKeys:(id)a4 domain:(id)a5 removeInUbiquitousStore:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = [a3 count];
  if (a5 && v10)
  {
    BOOL v39 = v6;
    v44 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [a3 count]);
    id v40 = a5;
    id v41 = a3;
    if ([a4 count])
    {
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      long long v57 = 0uLL;
      long long v58 = 0uLL;
      id v46 = [a4 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (!v46) {
        goto LABEL_45;
      }
      uint64_t v45 = *(void *)v58;
      uint64_t v11 = CRRecentContactsSyncKeyDictMembersKey;
      uint64_t v12 = CRRecentContactsSyncKeyDictAddressKey;
      uint64_t v13 = CRRecentContactsSyncKeyDictKindKey;
      long long v14 = (void *)CRAddressKindGroup;
      v42 = (void *)CRAddressKindGroup;
      uint64_t v43 = CRRecentContactsSyncKeyDictMembersKey;
      while (1)
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v58 != v45) {
            objc_enumerationMutation(a4);
          }
          long long v16 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v15);
          if (![v16 objectForKeyedSubscript:v11])
          {
            id v26 = [v16 objectForKeyedSubscript:v12];
            id v24 = [v16 objectForKeyedSubscript:v13];
            id v23 = [(_CRRecentsLibrary *)self recentsHashForExternalAddress:v26 kind:v24];
            if (!v23) {
              goto LABEL_22;
            }
LABEL_18:
            if ([v24 isEqualToString:v14]) {
              v25 = @"GP_";
            }
            else {
              v25 = @"MR_";
            }
            [(NSMutableSet *)v44 addObject:[(__CFString *)v25 stringByAppendingString:v23]];
            goto LABEL_22;
          }
          v47 = v15;
          id v17 = +[NSMutableArray array];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v18 = [v16 objectForKeyedSubscript:v11];
          id v19 = [v18 countByEnumeratingWithState:&v53 objects:v64 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v54;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v54 != v21) {
                  objc_enumerationMutation(v18);
                }
                objc_msgSend(v17, "cr_insertObject:usingComparator:", -[_CRRecentsLibrary recentsHashForExternalAddress:kind:](self, "recentsHashForExternalAddress:kind:", objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "objectForKeyedSubscript:", v12), objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "objectForKeyedSubscript:", v13)), &stru_10002D118);
              }
              id v20 = [v18 countByEnumeratingWithState:&v53 objects:v64 count:16];
            }
            while (v20);
          }
          id v23 = objc_msgSend(objc_msgSend(objc_msgSend(v17, "componentsJoinedByString:", &stru_10002D980), "dataUsingEncoding:", 4), "cr_md5DigestHexString");
          long long v14 = v42;
          uint64_t v11 = v43;
          id v24 = v42;
          long long v15 = v47;
          if (v23) {
            goto LABEL_18;
          }
LABEL_22:
          long long v15 = (char *)v15 + 1;
        }
        while (v15 != v46);
        id v27 = [a4 countByEnumeratingWithState:&v57 objects:v65 count:16];
        id v46 = v27;
        if (!v27) {
          goto LABEL_45;
        }
      }
    }
    long long v51 = 0uLL;
    long long v52 = 0uLL;
    long long v49 = 0uLL;
    long long v50 = 0uLL;
    id v28 = [a3 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v50;
      v31 = (void *)CRAddressKindGroup;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v41);
          }
          id v33 = -[_CRRecentsLibrary _copyRecentContactForID:](self, "_copyRecentContactForID:", [*(id *)(*((void *)&v49 + 1) + 8 * (void)j) integerValue]);
          if (v33)
          {
            v34 = v33;
            id v35 = [(_CRRecentsLibrary *)self hashForContact:v33];
            id v36 = v31;
            if (([v34 isGroup] & 1) == 0) {
              id v36 = [v34 kind];
            }

            if (v35)
            {
              if ([v36 isEqualToString:v31]) {
                v37 = @"GP_";
              }
              else {
                v37 = @"MR_";
              }
              [(NSMutableSet *)v44 addObject:[(__CFString *)v37 stringByAppendingString:v35]];
            }
            else
            {
              v38 = +[CRLogging log];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v62 = v34;
                _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "No hash for contact %@", buf, 0xCu);
              }
            }
          }
        }
        id v29 = [v41 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v29);
    }
LABEL_45:
    [(_CRRecentsLibrary *)self _deleteRecentsWithRecentIDs:v41 storeKeys:v44 recentsDomain:v40 deleteInUbiquitousStore:v39];
    [(_CRRecentsLibrary *)self _synchronizeStore:[(_CRRecentsLibrary *)self _storeForRecentsDomain:v40]];
  }
}

- (void)removeAllRecentContactsWithCompletion:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "storeMapping", 0), "allKeys");
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_CRRecentsLibrary *)self removeLocalRecordsForDomain:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) removeInUbiquitousStore:1];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (unint64_t)_databasePropertyValueByKey:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B7CC;
  v5[3] = &unk_10002CDA8;
  v5[5] = self;
  v5[6] = &v6;
  v5[4] = a3;
  [(_CRRecentsLibrary *)self performReadTransaction:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_setDatabasePropertyValue:(unint64_t)a3 forKey:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B944;
  v6[3] = &unk_10002CDD0;
  v6[6] = &v7;
  void v6[7] = a3;
  v6[4] = a4;
  v6[5] = self;
  [(_CRRecentsLibrary *)self performWriteTransaction:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)_propertyValueForKey:(id)a3 defaultValue:(unint64_t)a4
{
  value = 0;
  [(NSLock *)self->_lock lock];
  int ValueIfPresent = CFDictionaryGetValueIfPresent(self->_cachedProperties, a3, (const void **)&value);
  [(NSLock *)self->_lock unlock];
  if (!ValueIfPresent)
  {
    value = (void *)a4;
    uint64_t v8 = [(_CRRecentsLibrary *)self _databasePropertyValueByKey:a3];
    if (v8 != (void *)-1) {
      value = v8;
    }
    [(NSLock *)self->_lock lock];
    CFDictionarySetValue(self->_cachedProperties, a3, value);
    [(NSLock *)self->_lock unlock];
  }
  return (unint64_t)value;
}

- (void)_setPropertyValue:(unint64_t)a3 forKey:(id)a4
{
  if (-[_CRRecentsLibrary _setDatabasePropertyValue:forKey:](self, "_setDatabasePropertyValue:forKey:"))
  {
    [(NSLock *)self->_lock lock];
    CFDictionarySetValue(self->_cachedProperties, a4, (const void *)a3);
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (unint64_t)maximumRecentsForDomain:(id)a3
{
  if (!a3) {
    sub_10001A8E4();
  }
  id v4 = objc_msgSend(@"max-recent:", "stringByAppendingString:");
  return [(_CRRecentsLibrary *)self _propertyValueForKey:v4 defaultValue:500];
}

- (void)setMaximumRecents:(unint64_t)a3 forRecentsDomain:(id)a4
{
  if (!a3) {
    sub_10001A910();
  }
  if (!a4) {
    sub_10001A8E4();
  }
  id v6 = [@"max-recent:" stringByAppendingString:a4];
  [(_CRRecentsLibrary *)self _setPropertyValue:a3 forKey:v6];
}

- (unint64_t)maximumGroupRecentsForDomain:(id)a3
{
  if (!a3) {
    sub_10001A93C();
  }
  id v4 = objc_msgSend(@"max-group-recent:", "stringByAppendingString:");
  return [(_CRRecentsLibrary *)self _propertyValueForKey:v4 defaultValue:250];
}

- (void)setMaximumGroupRecents:(unint64_t)a3 forRecentsDomain:(id)a4
{
  if (!a3) {
    sub_10001A968();
  }
  if (!a4) {
    sub_10001A93C();
  }
  id v6 = [@"max-group-recent:" stringByAppendingString:a4];
  [(_CRRecentsLibrary *)self _setPropertyValue:a3 forKey:v6];
}

- (unint64_t)maximumRecentsAgeInDaysForDomain:(id)a3
{
  if (!a3) {
    sub_10001A994();
  }
  id v4 = objc_msgSend(@"max-recent-age:", "stringByAppendingString:");
  return [(_CRRecentsLibrary *)self _propertyValueForKey:v4 defaultValue:0x7FFFFFFFFFFFFFFFLL];
}

- (void)setMaximumRecentsAgeInDays:(unint64_t)a3 forRecentsDomain:(id)a4
{
  if (!a4) {
    sub_10001A994();
  }
  id v6 = [@"max-recent-age:" stringByAppendingString:a4];
  [(_CRRecentsLibrary *)self _setPropertyValue:a3 forKey:v6];
}

- (void)cancelPerformExpungeRecentsOverLimitsForDomain:(id)a3
{
  id v5 = +[CRLogging log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "canceling any pending expunge for domain %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(CRDelayedWorkQueue *)self->_pendingDomainExpunges cancelWorkForKey:a3];
}

- (void)performExpungeRecentsOverLimitsForDomain:(id)a3 afterDelay:(double)a4
{
  if (-[CRDelayedWorkQueue scheduleWorkForKey:afterDelay:work:](self->_pendingDomainExpunges, "scheduleWorkForKey:afterDelay:work:", a4, _NSConcreteStackBlock, 3221225472, sub_10000BEDC, &unk_10002C9D0, a3, self))
  {
    int v6 = +[CRLogging log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v8 = a4;
      __int16 v9 = 2114;
      id v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "scheduled pending expunge after %.2fs for domain %{public}@", buf, 0x16u);
    }
  }
}

- (id)_nts_expungeRecentsOlderThanDate:(id)a3 domain:(id)a4 storeKeys:(id *)a5 connection:(id)a6
{
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = +[NSMutableArray array];
  if (a3)
  {
    long long v13 = (sqlite3_stmt *)[a6 preparedStatementForPattern:@"        SELECT recents.ROWID, recents.record_hash, recents.count \n        FROM recents \n        WHERE recents.bundle_identifier = :bundle_identifier \n        AND recents.last_date < :expunge_date     "];
    sub_10000AA08(v13, ":bundle_identifier", a4);
    sub_10000C17C(v13, ":expunge_date", a3);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C204;
    v18[3] = &unk_10002CDF8;
    v18[4] = v11;
    v18[5] = v12;
    id v14 = +[CRSQLRow enumerateRowsInStatement:v13 usingBlock:v18];
    if ((v14 - 102) > 0xFFFFFFFD)
    {
      long long v15 = +[CRLogging log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v11 count];
        *(_DWORD *)buf = 134218242;
        id v20 = v16;
        __int16 v21 = 2114;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found %lu recents over age limit for domain %{public}@", buf, 0x16u);
      }
    }
    else
    {
      [(_CRRecentsLibrary *)self _handleSQLiteErrorCode:v14];

      id v12 = 0;
      id v11 = 0;
    }
  }
  if (a5) {
    *a5 = v12;
  }
  return v11;
}

- (id)_nts_expungeIndividualRecentsOverLimit:(unint64_t)a3 domain:(id)a4 storeKeys:(id *)a5 connection:(id)a6
{
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = +[NSMutableArray array];
  long long v13 = (sqlite3_stmt *)[a6 preparedStatementForPattern:@"        SELECT recents.ROWID, recents.record_hash \n        FROM recents \n        WHERE recents.bundle_identifier = :bundle_identifier \n            AND recents.count = 1 \n        ORDER BY recents.last_date DESC \n        LIMIT -1 \n        OFFSET :offset     "];
  sub_10000AA08(v13, ":bundle_identifier", a4);
  sub_10000AEC4(v13, ":offset", a3);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C4E0;
  v18[3] = &unk_10002CDF8;
  v18[4] = v11;
  v18[5] = v12;
  id v14 = +[CRSQLRow enumerateRowsInStatement:v13 usingBlock:v18];
  if ((v14 - 102) > 0xFFFFFFFD)
  {
    long long v15 = +[CRLogging log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v11 count];
      *(_DWORD *)buf = 134218242;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found %lu individual recents over hard limit for domain %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [(_CRRecentsLibrary *)self _handleSQLiteErrorCode:v14];

    id v12 = 0;
    id v11 = 0;
  }
  if (a5) {
    *a5 = v12;
  }
  return v11;
}

- (id)_nts_expungeGroupRecentsOverLimit:(unint64_t)a3 domain:(id)a4 storeKeys:(id *)a5 connection:(id)a6
{
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = +[NSMutableArray array];
  long long v13 = (sqlite3_stmt *)[a6 preparedStatementForPattern:@"        SELECT recents.ROWID, recents.record_hash \n        FROM recents \n        WHERE recents.bundle_identifier = :bundle_identifier \n            AND recents.count != 1 \n        ORDER BY recents.last_date DESC \n        LIMIT -1 \n        OFFSET :offset     "];
  sub_10000AA08(v13, ":bundle_identifier", a4);
  sub_10000AEC4(v13, ":offset", a3);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C790;
  v18[3] = &unk_10002CDF8;
  v18[4] = v11;
  v18[5] = v12;
  id v14 = +[CRSQLRow enumerateRowsInStatement:v13 usingBlock:v18];
  if ((v14 - 102) > 0xFFFFFFFD)
  {
    long long v15 = +[CRLogging log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v11 count];
      *(_DWORD *)buf = 134218242;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found %lu group recents over hard limit for domain %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [(_CRRecentsLibrary *)self _handleSQLiteErrorCode:v14];

    id v12 = 0;
    id v11 = 0;
  }
  if (a5) {
    *a5 = v12;
  }
  return v11;
}

- (BOOL)expungeRecentsOverLimitsForDomain:(id)a3 forcibly:(BOOL)a4 expungedRecentIDs:(id *)a5
{
  -[_CRRecentsLibrary cancelPerformExpungeRecentsOverLimitsForDomain:](self, "cancelPerformExpungeRecentsOverLimitsForDomain:");
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  unint64_t v9 = [(_CRRecentsLibrary *)self maximumRecentsForDomain:a3];
  unint64_t v10 = [(_CRRecentsLibrary *)self maximumGroupRecentsForDomain:a3];
  unint64_t v11 = [(_CRRecentsLibrary *)self maximumRecentsAgeInDaysForDomain:a3];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = 0;
  }
  else
  {
    long long v13 = +[NSDate date];
    id v14 = +[NSCalendar currentCalendar];
    id v15 = objc_alloc_init((Class)NSDateComponents);
    [v15 setDay:-(uint64_t)v11];
    id v12 = [(NSCalendar *)v14 dateByAddingComponents:v15 toDate:v13 options:0];
  }
  id v16 = objc_alloc_init((Class)NSMutableSet);
  id v17 = objc_alloc_init((Class)NSMutableSet);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000CA74;
  v20[3] = &unk_10002CE48;
  v20[4] = v12;
  v20[5] = self;
  v20[6] = a3;
  void v20[7] = v17;
  v20[10] = v10;
  v20[11] = v9;
  v20[8] = v16;
  v20[9] = &v22;
  BOOL v21 = a4;
  [(_CRRecentsLibrary *)self performWriteTransaction:v20];
  if (a5 && *((unsigned char *)v23 + 24)) {
    *a5 = v17;
  }

  char v18 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v18;
}

- (void)_bindRecent:(id)a3 forStatement:(sqlite3_stmt *)a4
{
  if (![a3 countOfRecents]) {
    sub_10001AB7C();
  }
  id v7 = [(_CRRecentsLibrary *)self hashForContact:a3];
  if (v7)
  {
    uint64_t v22 = v7;
    sub_10000AA08(a4, ":display_name", [a3 displayName]);
    sub_10000AA08(a4, ":bundle_identifier", [a3 recentsDomain]);
    sub_10000AA08(a4, ":original_source", [a3 originalSource]);
    sub_10000C17C(a4, ":last_date", [a3 mostRecentDate]);
    id v8 = [a3 weight];
    int v9 = sqlite3_bind_parameter_index(a4, ":weight");
    if (v9 >= 1)
    {
      int v10 = v9;
      if (v8)
      {
        [v8 doubleValue];
        sqlite3_bind_double(a4, v10, v11);
      }
      else
      {
        sqlite3_bind_null(a4, v9);
      }
    }
    id v23 = a4;
    sub_10000AEC4(a4, ":group_kind", (sqlite3_int64)[a3 groupKind]);
    id v13 = +[NSMutableString string];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = a3;
    id v14 = [a3 recentDates];
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v13 length]) {
            CFStringRef v20 = @":";
          }
          else {
            CFStringRef v20 = &stru_10002D980;
          }
          [v19 timeIntervalSinceReferenceDate];
          [v13 appendFormat:@"%@%lld", v20, (uint64_t)((v21 + 978307200.0) * 1000.0)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }
    sub_10000AA08(v23, ":dates", v13);
    sub_10000AA08(v23, ":sending_address", [v24 lastSendingAddress]);
    sub_10000AA08(v23, ":record_hash", v22);
  }
  else
  {
    id v12 = +[CRLogging log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001ABA8(a3, v12);
    }
  }
}

- (void)_bindContact:(id)a3 withRecentID:(int64_t)a4 forStatement:(sqlite3_stmt *)a5
{
  id v9 = [a3 kind];
  id v10 = -[_CRRecentsLibrary addressFromExternalAddress:kind:](self, "addressFromExternalAddress:kind:", [a3 address], v9);
  sub_10000AEC4(a5, ":recent_id", a4);
  sub_10000AA08(a5, ":display_name", [a3 displayName]);
  sub_10000AA08(a5, ":kind", v9);
  sub_10000AA08(a5, ":address", v10);
}

- (void)_insertRecentContacts:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000D304;
  void v3[3] = &unk_10002CE98;
  v3[4] = a3;
  v3[5] = self;
  [(_CRRecentsLibrary *)self performWriteTransaction:v3];
}

- (void)_updateRecentContacts:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000D944;
  void v3[3] = &unk_10002CE98;
  v3[4] = a3;
  v3[5] = self;
  [(_CRRecentsLibrary *)self performWriteTransaction:v3];
}

- (void)restorePreviouslyDeletedRecentContacts:(id)a3 completion:(id)a4
{
  -[_CRRecentsLibrary _saveRecentContacts:](self, "_saveRecentContacts:");
  if (a4)
  {
    int v6 = (void (*)(id, id, void))*((void *)a4 + 2);
    v6(a4, a3, 0);
  }
}

- (void)_saveRecentContacts:(id)a3
{
  id v5 = +[NSMutableArray array];
  id v6 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 recentID] == (id)0x7FFFFFFFFFFFFFFFLL) {
          id v12 = v5;
        }
        else {
          id v12 = v6;
        }
        [v12 addObject:v11];
      }
      id v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000DE50;
  v13[3] = &unk_10002CEC0;
  v13[4] = v5;
  v13[5] = self;
  v13[6] = v6;
  [(_CRRecentsLibrary *)self performWriteTransaction:v13];
}

- (void)_deleteRecentWithRecordHash:(id)a3 kind:(id)a4 recentsDomain:(id)a5
{
  if (!a5) {
    sub_10001AC30();
  }
  uint64_t v9 = +[CRLogging log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = a5;
    __int16 v18 = 2114;
    id v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "deleting contact from '%{public}@' with record hash: [%{public}@]", buf, 0x16u);
  }
  id v10 = [(_CRRecentsLibrary *)self _storeForRecentsDomain:a5];
  if (v10)
  {
    if (a3)
    {
      double v11 = v10;
      if ([a4 isEqualToString:CRAddressKindGroup]) {
        id v12 = @"GP_";
      }
      else {
        id v12 = @"MR_";
      }
      id v13 = [(__CFString *)v12 stringByAppendingString:a3];
      long long v14 = +[CRLogging log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v17 = a5;
        __int16 v18 = 2114;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "deleting recent from remote store for domain '%{public}@' with key %{public}@", buf, 0x16u);
      }
      [v11 removeObjectForKey:v13];
    }
    else if (os_log_type_enabled((os_log_t)+[CRLogging log], OS_LOG_TYPE_ERROR))
    {
      sub_10001AC5C();
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E0A4;
  v15[3] = &unk_10002CE98;
  v15[4] = a3;
  v15[5] = a5;
  [(_CRRecentsLibrary *)self performWriteTransaction:v15];
}

- (void)_deleteRecentsWithRecentIDs:(id)a3 storeKeys:(id)a4 recentsDomain:(id)a5 deleteInUbiquitousStore:(BOOL)a6
{
  if (!a5) {
    sub_10001ACC4();
  }
  BOOL v6 = a6;
  id v10 = objc_msgSend(a3, "cr_map:", sCRSQLite3MPrintTransform);
  double v11 = +[CRLogging log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = a5;
    __int16 v27 = 2114;
    id v28 = [v10 componentsJoinedByString:@", "];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "deleting contacts from '%{public}@' with recent IDs: [%{public}@]", buf, 0x16u);
  }
  if (v6)
  {
    id v12 = [(_CRRecentsLibrary *)self _storeForRecentsDomain:a5];
    if (v12)
    {
      id v13 = v12;
      long long v14 = +[CRLogging log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = a5;
        __int16 v27 = 2114;
        id v28 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "deleting recents from remote store for domain '%{public}@' with keys %{public}@", buf, 0x16u);
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v15 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          __int16 v18 = 0;
          do
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(a4);
            }
            [v13 removeObjectForKey:*(void *)(*((void *)&v20 + 1) + 8 * (void)v18)];
            __int16 v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v16 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v16);
      }
    }
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E374;
  v19[3] = &unk_10002CE98;
  v19[4] = v10;
  v19[5] = a5;
  [(_CRRecentsLibrary *)self performWriteTransaction:v19];
}

- (unint64_t)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6
{
  id v8 = self;
  id v79 = [(_CRRecentsLibrary *)self _storeForRecentsDomain:a4];
  id v93 = [(CRAccountAdaptor *)v8->_accountAdaptor senderEmailAddresses];
  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v131 = sub_10000EEC0;
  v132 = &unk_10002CEE8;
  id v97 = objc_alloc_init((Class)NSMutableDictionary);
  id v133 = v97;
  v134 = v8;
  id v91 = a4;
  id v135 = a4;
  id v88 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id obj = a3;
  id v10 = [a3 countByEnumeratingWithState:&v126 objects:v141 count:16];
  v92 = v8;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v127;
    v95 = (void *)CRAddressKindEmail;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v127 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v126 + 1) + 8 * i);
        unsigned int v15 = objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", @"options"), "unsignedIntegerValue");
        id v16 = [v14 objectForKey:@"members"];
        if ((v15 & 0x100000) != 0
          || (uint64_t v17 = v16, [v16 count] == (id)1)
          && (id v18 = [v17 lastObject],
              objc_msgSend(v95, "isEqualToString:", objc_msgSend(v18, "objectForKeyedSubscript:", @"kind")))&& objc_msgSend(v93, "containsObject:", objc_msgSend(v18, "objectForKeyedSubscript:", @"address")))
        {
          [v88 addObject:v14];
        }
        else
        {
          id v19 = objc_msgSend(objc_msgSend(v14, "objectForKey:", @"timestamp"), "description");
          id v20 = [v9 objectForKey:v19];
          if (v20)
          {
            objc_msgSend(v20, "setObject:forKey:", objc_msgSend(objc_msgSend(v20, "objectForKey:", @"members"), "arrayByAddingObjectsFromArray:", v17), @"members");
          }
          else
          {
            id v21 = [v14 mutableCopy];
            [v9 setObject:v21 forKey:v19];
          }
        }
        id v8 = v92;
      }
      id v11 = [obj countByEnumeratingWithState:&v126 objects:v141 count:16];
    }
    while (v11);
  }
  objc_msgSend(v88, "addObjectsFromArray:", objc_msgSend(v9, "allValues"));

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v22 = [v88 countByEnumeratingWithState:&v122 objects:v140 count:16];
  id v23 = v91;
  if (v22)
  {
    id v24 = v22;
    uint64_t v87 = *(void *)v123;
    do
    {
      long long v25 = 0;
      id v86 = v24;
      do
      {
        if (*(void *)v123 != v87) {
          objc_enumerationMutation(v88);
        }
        id v26 = *(void **)(*((void *)&v122 + 1) + 8 * (void)v25);
        id v28 = [v26 objectForKey:@"members"];
        id v29 = [v26 objectForKey:@"timestamp"];
        id v89 = [v26 objectForKey:@"displayName"];
        id v30 = [v26 objectForKey:@"metadata"];
        id v90 = [v26 objectForKey:@"weight"];
        id v94 = objc_msgSend(objc_msgSend(v26, "objectForKeyedSubscript:", @"options"), "unsignedIntegerValue");
        id v96 = v29;
        if ([v28 count]) {
          BOOL v31 = v29 == 0;
        }
        else {
          BOOL v31 = 1;
        }
        if (!v31)
        {
          id v32 = [(_CRRecentsLibrary *)v8 hashForGroupMembers:v28 recentsDomain:v23];
          if (v32)
          {
            id v82 = v32;
            id v83 = v30;
            uint64_t v33 = (uint64_t)v131((uint64_t)v130, (uint64_t)v32);
            if (v33) {
              BOOL v34 = (v94 & 0x100000) == 0;
            }
            else {
              BOOL v34 = 0;
            }
            if (v34)
            {
              v44 = (void *)v33;
              v112[0] = _NSConcreteStackBlock;
              v112[1] = 3221225472;
              v113 = sub_10000EF1C;
              v114 = &unk_10002CF10;
              uint64_t v115 = v33;
              id v116 = v30;
              id v117 = v90;
              id v118 = v29;
              char v121 = v94 & 1;
              v119 = v8;
              id v120 = v97;
              if ((unint64_t)[v28 count] < 2)
              {
                if ([v28 count])
                {
                  id v70 = objc_msgSend(objc_msgSend(v28, "objectAtIndexedSubscript:", 0), "objectForKey:", @"displayName");
                  v113((uint64_t)v112, v44, v70);
                }
              }
              else
              {
                v113((uint64_t)v112, v44, v89);
                if ((v94 & 2) == 0)
                {
                  long long v110 = 0u;
                  long long v111 = 0u;
                  long long v108 = 0u;
                  long long v109 = 0u;
                  id v45 = [v28 countByEnumeratingWithState:&v108 objects:v139 count:16];
                  if (v45)
                  {
                    id v46 = v45;
                    uint64_t v47 = *(void *)v109;
                    v84 = v27;
                    do
                    {
                      v48 = v25;
                      for (j = 0; j != v46; j = (char *)j + 1)
                      {
                        if (*(void *)v109 != v47) {
                          objc_enumerationMutation(v28);
                        }
                        v138 = *(void **)(*((void *)&v108 + 1) + 8 * (void)j);
                        long long v50 = v138;
                        id v51 = [(_CRRecentsLibrary *)v8 hashForGroupMembers:+[NSArray arrayWithObjects:&v138 count:1] recentsDomain:v23];
                        id v52 = [v50 objectForKey:@"displayName"];
                        uint64_t v53 = (uint64_t)v131((uint64_t)v130, (uint64_t)v51);
                        if (v53) {
                          v113((uint64_t)v112, (void *)v53, v52);
                        }
                      }
                      id v46 = [v28 countByEnumeratingWithState:&v108 objects:v139 count:16];
                      long long v25 = v48;
                      __int16 v27 = v84;
                      id v24 = v86;
                    }
                    while (v46);
                  }
                }
              }
            }
            else
            {
              if ([v28 count] == (id)1)
              {
                id v35 = v27;
                id v36 = [v28 objectAtIndex:0];
                id v37 = objc_alloc((Class)CRRecentContact);
                id v38 = [v36 objectForKey:@"address"];
                id v39 = [v36 objectForKey:@"displayName"];
                id v40 = [v36 objectForKey:@"kind"];
                id v41 = v38;
                id v23 = v91;
                id v42 = [v37 initWithAddress:v41 displayName:v39 kind:v40 recentDate:v29 recentsDomain:v91];
                uint64_t v43 = v42;
                if (a6) {
                  objc_msgSend(v42, "setOriginalSource:");
                }
                id v24 = v86;
                __int16 v27 = v35;
                if (v83) {
                  objc_msgSend(v43, "setMetadata:");
                }
              }
              else
              {
                if ((unint64_t)[v28 count] < 2) {
                  goto LABEL_72;
                }
                v85 = v27;
                v80 = v25;
                long long v54 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v28 count]);
                long long v104 = 0u;
                long long v105 = 0u;
                long long v106 = 0u;
                long long v107 = 0u;
                id v55 = [v28 countByEnumeratingWithState:&v104 objects:v137 count:16];
                if (v55)
                {
                  id v56 = v55;
                  uint64_t v57 = *(void *)v105;
                  do
                  {
                    for (k = 0; k != v56; k = (char *)k + 1)
                    {
                      if (*(void *)v105 != v57) {
                        objc_enumerationMutation(v28);
                      }
                      long long v59 = *(void **)(*((void *)&v104 + 1) + 8 * (void)k);
                      id v60 = -[_CRRecentsLibrary recentsHashForExternalAddress:kind:](v8, "recentsHashForExternalAddress:kind:", [v59 objectForKeyedSubscript:@"address"], objc_msgSend(v59, "objectForKeyedSubscript:", @"kind"));
                      if (![(NSMutableDictionary *)v54 objectForKey:v60])
                      {
                        uint64_t v61 = (uint64_t)v131((uint64_t)v130, (uint64_t)v60);
                        if (v61)
                        {
                          id v62 = (id)v61;
                          if ((v94 & 2) == 0)
                          {
                            id v63 = [v59 objectForKeyedSubscript:@"displayName"];
                            if ([v63 length]) {
                              [v62 setDisplayName:v63];
                            }
                            [v62 recordRecentEventForDate:v96 userInitiated:v94 & 1];
                          }
                        }
                        else
                        {
                          id v64 = objc_alloc((Class)CRRecentContact);
                          id v65 = [v59 objectForKey:@"address"];
                          id v66 = [v59 objectForKey:@"displayName"];
                          id v67 = [v59 objectForKey:@"kind"];
                          id v68 = v66;
                          id v8 = v92;
                          id v62 = [v64 initWithAddress:v65 displayName:v68 kind:v67 recentDate:v96 recentsDomain:v91];
                        }
                        [(NSMutableDictionary *)v54 setObject:v62 forKey:v60];
                        [v97 setObject:v62 forKey:v60];
                      }
                    }
                    id v56 = [v28 countByEnumeratingWithState:&v104 objects:v137 count:16];
                  }
                  while (v56);
                }
                id v23 = v91;
                id v69 = objc_msgSend(objc_alloc((Class)CRRecentContact), "initWithMembers:displayName:recentDate:recentsDomain:", -[NSMutableDictionary allValues](v54, "allValues"), v89, v96, v91);
                uint64_t v43 = v69;
                if (a6) {
                  objc_msgSend(v69, "setOriginalSource:");
                }
                __int16 v27 = v85;
                id v24 = v86;
                if (v83) {
                  objc_msgSend(v43, "setMetadata:");
                }
                long long v25 = v80;
                if ((v94 & 0x100000) != 0) {
                  [v43 setGroupKind:2];
                }
              }
              [v43 applyWeight:v90];
              [v97 setObject:v43 forKey:v82];
            }
          }
        }
LABEL_72:
        long long v25 = (char *)v25 + 1;
      }
      while (v25 != v24);
      id v24 = [v88 countByEnumeratingWithState:&v122 objects:v140 count:16];
    }
    while (v24);
  }
  id v71 = [v97 allValues];
  [v71 makeObjectsPerformSelector:"setLastSendingAddress:" withObject:a5];
  [(_CRRecentsLibrary *)v8 _saveRecentContacts:v71];
  id v103 = 0;
  [(_CRRecentsLibrary *)v8 expungeRecentsOverLimitsForDomain:v23 forcibly:0 expungedRecentIDs:&v103];
  if (v79)
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v72 = [v71 countByEnumeratingWithState:&v99 objects:v136 count:16];
    if (v72)
    {
      id v73 = v72;
      uint64_t v74 = *(void *)v100;
      do
      {
        for (m = 0; m != v73; m = (char *)m + 1)
        {
          if (*(void *)v100 != v74) {
            objc_enumerationMutation(v71);
          }
          v76 = *(void **)(*((void *)&v99 + 1) + 8 * (void)m);
          id v8 = v92;
          if ((objc_msgSend(v103, "containsObject:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v76, "recentID"))) & 1) == 0)-[_CRRecentsLibrary _syncContact:withStore:](v92, "_syncContact:withStore:", v76, v79); {
        }
          }
        id v73 = [v71 countByEnumeratingWithState:&v99 objects:v136 count:16];
      }
      while (v73);
    }
    [(_CRRecentsLibrary *)v8 scheduleSynchronizationForStore:v79];
  }

  return 0;
}

- (void)removeContact:(id)a3
{
  id v5 = [a3 recentsDomain];
  id v6 = [(_CRRecentsLibrary *)self hashForContact:a3];
  id v7 = [a3 kind];
  if (v5 && v6 && v7)
  {
    [(_CRRecentsLibrary *)self _deleteRecentWithRecordHash:v6 kind:v7 recentsDomain:v5];
    id v8 = [(_CRRecentsLibrary *)self _storeForRecentsDomain:v5];
    if (v8)
    {
      [(_CRRecentsLibrary *)self _synchronizeStore:v8];
    }
  }
  else
  {
    id v9 = +[CRLogging log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138544131;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v5;
      __int16 v14 = 2114;
      id v15 = [a3 sanitizedDescription];
      __int16 v16 = 2113;
      id v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempt to remove invalid contact (h=%{public}@, b=%{public}@): %{public}@ %{private}@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (id)addressHandlerForAddressKind:(id)a3
{
  return [(CRPluginManager *)self->_pluginManager addressHandlerForAddressKind:a3];
}

- (id)recentsHashForExternalAddress:(id)a3 kind:(id)a4
{
  id v6 = [(_CRRecentsLibrary *)self addressHandlerForAddressKind:a4];
  id v7 = [v6 addressFromExternalAddress:a3 kind:a4];
  return [v6 syncKeyForAddress:v7 kind:a4];
}

- (id)recentsHashForAddress:(id)a3 kind:(id)a4
{
  id v6 = [(_CRRecentsLibrary *)self addressHandlerForAddressKind:a4];
  return [v6 syncKeyForAddress:a3 kind:a4];
}

- (id)addressFromExternalAddress:(id)a3 kind:(id)a4
{
  id v6 = [(_CRRecentsLibrary *)self addressHandlerForAddressKind:a4];
  return [v6 addressFromExternalAddress:a3 kind:a4];
}

- (id)externalAddressFromAddress:(id)a3 kind:(id)a4
{
  id v6 = [(_CRRecentsLibrary *)self addressHandlerForAddressKind:a4];
  return [v6 externalAddressFromAddress:a3 kind:a4];
}

- (id)hashForContact:(id)a3
{
  if ([a3 isGroup])
  {
    return [(_CRRecentsLibrary *)self hashForGroup:a3];
  }
  else
  {
    id v5 = [a3 address];
    id v6 = [a3 kind];
    return [(_CRRecentsLibrary *)self recentsHashForExternalAddress:v5 kind:v6];
  }
}

- (id)hashForGroup:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F390;
  void v4[3] = &unk_10002CF38;
  v4[4] = self;
  return objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "members"), "cr_map:", v4), "cr_insertionSortedArrayUsingComparator:", &stru_10002D118), "componentsJoinedByString:", &stru_10002D980), "dataUsingEncoding:", 4), "cr_md5DigestHexString");
}

- (id)keyForContact:(id)a3
{
  id result = -[_CRRecentsLibrary hashForContact:](self, "hashForContact:");
  if (result)
  {
    id v5 = result;
    id v6 = [a3 kind];
    if ([v6 isEqualToString:CRAddressKindGroup]) {
      id v7 = @"GP_";
    }
    else {
      id v7 = @"MR_";
    }
    return [(__CFString *)v7 stringByAppendingString:v5];
  }
  return result;
}

- (void)_initializeStoreForRecentsDomain:(id)a3 storeIdentifier:(id)a4
{
  id v7 = +[CRLogging log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = a3;
    __int16 v11 = 2114;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initializing KVS store (%{public}@: %{public}@)", (uint8_t *)&v9, 0x16u);
  }
  if (!self->_cloudStores) {
    self->_cloudStores = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  id v8 = [objc_alloc((Class)NSUbiquitousKeyValueStore) _initWithStoreIdentifier:a4 usingEndToEndEncryption:1];
  [(NSMutableDictionary *)self->_cloudStores setObject:v8 forKey:a3];

  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"_storeChangedExternally:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:v8];
}

- (id)_recentsDomainForStore:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = sub_100009AD8;
  __int16 v11 = sub_100009AE8;
  uint64_t v12 = 0;
  cloudStores = self->_cloudStores;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F684;
  v6[3] = &unk_10002CF60;
  v6[4] = a3;
  v6[5] = &v7;
  [(NSMutableDictionary *)cloudStores enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_storeForRecentsDomain:(id)a3
{
  return [(NSMutableDictionary *)self->_cloudStores objectForKey:a3];
}

- (void)_storeChangedExternally:(id)a3
{
  id v5 = [[CRProcessTransaction alloc] initWithDescription:@"com.apple.corerecents.externalStoreChange"];
  id v6 = [a3 object];
  id v7 = [a3 userInfo];
  CFStringRef v8 = [(_CRRecentsLibrary *)self _recentsDomainForStore:v6];
  if (!v8) {
    sub_10001ACF0();
  }
  CFStringRef v9 = v8;
  uint64_t v10 = (uint64_t)objc_msgSend(objc_msgSend(v7, "objectForKey:", NSUbiquitousKeyValueStoreChangeReasonKey), "integerValue");
  __int16 v11 = +[CRLogging log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 > 2147483645)
    {
      switch(v10)
      {
        case 0x7FFFFFFELL:
          CFStringRef v12 = @"com.apple.corerecents.iCloudSwitch";
          break;
        case 0x7FFFFFFFLL:
          CFStringRef v12 = @"com.apple.corerecents.iCloudSignIn";
          break;
        case 0x80000000:
          CFStringRef v12 = @"com.apple.corerecents.newDatabase";
          break;
        default:
LABEL_14:
          CFStringRef v12 = +[NSString stringWithFormat:@"unknown change reason (%lu)", v10];
          break;
      }
    }
    else
    {
      CFStringRef v12 = @"NSUbiquitousKeyValueStoreServerChange";
      switch(v10)
      {
        case 0:
          break;
        case 1:
          CFStringRef v12 = @"NSUbiquitousKeyValueStoreInitialSyncChange";
          break;
        case 2:
          CFStringRef v12 = @"NSUbiquitousKeyValueStoreQuotaViolationChange";
          break;
        case 3:
          CFStringRef v12 = @"NSUbiquitousKeyValueStoreAccountChange";
          break;
        default:
          goto LABEL_14;
      }
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v50 = v12;
    __int16 v51 = 2114;
    CFStringRef v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "reason:%{public}@ recentsDomain:%{public}@", buf, 0x16u);
  }
  id v13 = [v7 objectForKey:NSUbiquitousKeyValueStoreChangedKeysKey];
  __int16 v14 = +[CRLogging log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 > 2147483645)
    {
      switch(v10)
      {
        case 0x7FFFFFFELL:
          CFStringRef v15 = @"com.apple.corerecents.iCloudSwitch";
          break;
        case 0x7FFFFFFFLL:
          CFStringRef v15 = @"com.apple.corerecents.iCloudSignIn";
          break;
        case 0x80000000:
          CFStringRef v15 = @"com.apple.corerecents.newDatabase";
          break;
        default:
LABEL_28:
          CFStringRef v15 = +[NSString stringWithFormat:@"unknown change reason (%lu)", v10];
          break;
      }
    }
    else
    {
      CFStringRef v15 = @"NSUbiquitousKeyValueStoreServerChange";
      switch(v10)
      {
        case 0:
          break;
        case 1:
          CFStringRef v15 = @"NSUbiquitousKeyValueStoreInitialSyncChange";
          break;
        case 2:
          CFStringRef v15 = @"NSUbiquitousKeyValueStoreQuotaViolationChange";
          break;
        case 3:
          CFStringRef v15 = @"NSUbiquitousKeyValueStoreAccountChange";
          break;
        default:
          goto LABEL_28;
      }
    }
    *(_DWORD *)buf = 138543874;
    CFStringRef v50 = v9;
    __int16 v51 = 2114;
    CFStringRef v52 = v15;
    __int16 v53 = 2114;
    id v54 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received external KVS change event: (%{public}@) %{public}@, changed keys=%{public}@", buf, 0x20u);
  }
  if (v10 == 2)
  {
    __int16 v16 = +[CRLogging log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v50 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "iCloud Key Value Store Over-Quota: %{public}@", buf, 0xCu);
    }
    if ([(_CRRecentsLibrary *)self expungeRecentsOverLimitsForDomain:v9 forcibly:1 expungedRecentIDs:0])
    {
      id v17 = +[CRLogging log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v18 = (const __CFString *)objc_msgSend(objc_msgSend(v6, "dictionaryRepresentation"), "count");
        *(_DWORD *)buf = 134217984;
        CFStringRef v50 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "After expunging, store has %lu entries", buf, 0xCu);
      }
      [(_CRRecentsLibrary *)self _synchronizeStore:v6];
    }
  }
  else
  {
    CFStringRef v19 = (const __CFString *)+[NSMutableDictionary dictionary];
    if (v10 == 3) {
      [(CRUbiquitousCoordinator *)self->_ubiquitousCoordinator ubiquitousStoreForDomainChangedAccount:v9];
    }
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    id v40 = sub_10000FF34;
    id v41 = &unk_10002CF88;
    BOOL v45 = v10 == 3;
    uint64_t v33 = self;
    CFStringRef v42 = v19;
    uint64_t v43 = self;
    CFStringRef v44 = v9;
    if ([v13 count])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v20 = [v13 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v36;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v13);
            }
            uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            long long v25 = (NSNull *)[v6 dictionaryForKey:v24];
            if (!v25) {
              long long v25 = +[NSNull null];
            }
            ((void (*)(void *, uint64_t, NSNull *, void))v40)(v39, v24, v25, 0);
          }
          id v21 = [v13 countByEnumeratingWithState:&v35 objects:v48 count:16];
        }
        while (v21);
      }
    }
    else
    {
      objc_msgSend(objc_msgSend(v6, "dictionaryRepresentation"), "enumerateKeysAndObjectsUsingBlock:", v39);
    }
    id v26 = +[CRLogging log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v10 > 2147483645)
      {
        switch(v10)
        {
          case 0x7FFFFFFELL:
            CFStringRef v27 = @"com.apple.corerecents.iCloudSwitch";
            break;
          case 0x7FFFFFFFLL:
            CFStringRef v27 = @"com.apple.corerecents.iCloudSignIn";
            break;
          case 0x80000000:
            CFStringRef v27 = @"com.apple.corerecents.newDatabase";
            break;
          default:
LABEL_63:
            CFStringRef v27 = +[NSString stringWithFormat:@"unknown change reason (%lu)", v10];
            break;
        }
      }
      else
      {
        CFStringRef v27 = @"NSUbiquitousKeyValueStoreServerChange";
        switch(v10)
        {
          case 0:
            break;
          case 1:
            CFStringRef v27 = @"NSUbiquitousKeyValueStoreInitialSyncChange";
            break;
          case 2:
            CFStringRef v27 = @"NSUbiquitousKeyValueStoreQuotaViolationChange";
            break;
          case 3:
            CFStringRef v27 = @"NSUbiquitousKeyValueStoreAccountChange";
            break;
          default:
            goto LABEL_63;
        }
      }
      *(_DWORD *)buf = 138543619;
      CFStringRef v50 = v27;
      __int16 v51 = 2113;
      CFStringRef v52 = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Acting on change %{public}@: %{private}@", buf, 0x16u);
    }
    unsigned int v28 = [(_CRRecentsLibrary *)v33 _mergeRemoteChanges:v19 fromStore:v6 forRecentsDomain:v9];
    unsigned int v29 = [(_CRRecentsLibrary *)v33 expungeRecentsOverLimitsForDomain:v9 forcibly:0 expungedRecentIDs:0];
    if (v10 == 1)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100010094;
      v34[3] = &unk_10002CFB0;
      v34[4] = v33;
      v34[5] = v19;
      v34[6] = v6;
      [(_CRRecentsLibrary *)v33 enumerateRecentsForDomain:v9 usingBlock:v34];
    }
    if (![v6 dictionaryForKey:@"MAX_RECENTS"])
    {
      v46[0] = @"v";
      v46[1] = @"m";
      v47[0] = &off_10002F4C0;
      v47[1] = +[NSNumber numberWithUnsignedInteger:500];
      objc_msgSend(v6, "setDictionary:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2), @"MAX_RECENTS");
    }
    if (v10 == 1) {
      int v30 = 1;
    }
    else {
      int v30 = v29;
    }
    if ((v30 | v28) == 1)
    {
      BOOL v31 = +[CRLogging log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Syncing back local changes", buf, 2u);
      }
      [(_CRRecentsLibrary *)v33 _synchronizeStore:v6];
    }
    id v32 = +[CRLogging log];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Finished handling cloud store change", buf, 2u);
    }
  }
}

- (BOOL)_mergeRemoteChanges:(id)a3 fromStore:(id)a4 forRecentsDomain:(id)a5
{
  CFStringRef v9 = +[CRLogging log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v13 = [a3 count];
    __int16 v14 = 2114;
    id v15 = a4;
    __int16 v16 = 2114;
    id v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "numChanges:%lu store:%{public}@ recentsDomain:%{public}@", buf, 0x20u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100010238;
  v11[3] = &unk_10002D018;
  v11[4] = self;
  v11[5] = a5;
  v11[6] = a4;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  return 0;
}

- (void)_syncContact:(id)a3 withStore:(id)a4
{
  id v7 = [a3 lastSendingAddress];
  if ([(CRAccountAdaptor *)self->_accountAdaptor isSyncingDisabledForAccountWithAddress:v7])
  {
    CFStringRef v8 = +[CRLogging log];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138543875;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = [a3 sanitizedDescription];
    *(_WORD *)&buf[22] = 2113;
    CFStringRef v82 = (const __CFString *)a3;
    CFStringRef v9 = "Account with address %{public}@ is denying sync of contacts, skipping %{public}@ %{private}@";
LABEL_4:
    uint64_t v10 = v8;
    uint32_t v11 = 32;
LABEL_72:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    return;
  }
  id v12 = [a3 kind];
  uint64_t v13 = CRAddressKindEmail;
  v80[0] = CRAddressKindEmail;
  v80[1] = CRAddressKindPhoneNumber;
  *(void *)buf = @"e";
  *(void *)&buf[8] = @"p";
  v80[2] = CRAddressKindInstantMessage;
  v80[3] = CRAddressKindMapLocation;
  *(void *)&buf[16] = @"i";
  CFStringRef v82 = @"m";
  __int16 v14 = (void *)CRAddressKindGroup;
  v80[4] = CRAddressKindURL;
  v80[5] = CRAddressKindGroup;
  *(void *)&long long v83 = @"u";
  *((void *)&v83 + 1) = @"gr";
  id v15 = [+[NSDictionary dictionaryWithObjects:buf forKeys:v80 count:6] objectForKey:v12];
  if (!v15)
  {
    unsigned int v28 = +[CRLogging log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10001AD1C(a3, (uint64_t)v12, v28);
    }
    return;
  }
  id v16 = v15;
  id v66 = [(_CRRecentsLibrary *)self keyForContact:a3];
  if (!v66)
  {
    unsigned int v29 = +[CRLogging log];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v30 = [a3 sanitizedDescription];
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = v30;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = a3;
    CFStringRef v9 = "SYNC: Skipped syncing contact because we could not calculate sync key: %{public}@ %{private}@";
    goto LABEL_71;
  }
  if (([v14 isEqualToString:v12] & 1) == 0
    && ![(_CRRecentsLibrary *)self addressHandlerForAddressKind:v12])
  {
    CFStringRef v8 = +[CRLogging log];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v61 = [a3 sanitizedDescription];
    *(_DWORD *)buf = 138543875;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v61;
    *(_WORD *)&buf[22] = 2113;
    CFStringRef v82 = (const __CFString *)a3;
    CFStringRef v9 = "SYNC: Skipped syncing contact because there's not a sync transformer registered for address kind '%{public}@': "
         "%{public}@ %{private}@";
    goto LABEL_4;
  }
  id v17 = (__CFString *)[a4 dictionaryForKey:v66];
  CFStringRef v18 = +[NSMutableDictionary dictionaryWithDictionary:v17];
  [(NSMutableDictionary *)v18 setObject:&off_10002F4C0 forKey:@"v"];
  CFStringRef v19 = &CFArrayGetValueAtIndex_ptr;
  id v64 = a4;
  id v65 = v18;
  CFStringRef v63 = v17;
  if ([(NSMutableDictionary *)v18 objectForKey:@"a"]
    && [(NSMutableDictionary *)v18 objectForKey:@"mrs"])
  {
    goto LABEL_33;
  }
  if (![a3 isGroup])
  {
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", [a3 address], @"a");
LABEL_29:
    if (([v12 isEqualToString:v13] & 1) == 0) {
      [(NSMutableDictionary *)v18 setObject:v16 forKey:@"k"];
    }
    id v31 = [a3 originalSource];
    if (v31) {
      [(NSMutableDictionary *)v18 setObject:v31 forKey:@"S"];
    }
LABEL_33:
    id v32 = objc_msgSend(objc_msgSend(-[__CFString objectForKey:](v17, "objectForKey:", @"t"), "_cn_filter:", &stru_10002D158), "sortedArrayUsingComparator:", &stru_10002D198);
    id v33 = [a3 recentDates];
    id v34 = [objc_alloc((Class)v19[267]) initWithCapacity:5];
    id obja = v32;
    long long v35 = (char *)[v32 count];
    id v68 = v33;
    long long v36 = (char *)[v33 count];
    if ((unint64_t)[v34 count] > 4)
    {
LABEL_56:
      if ([v34 count])
      {
        long long v49 = v65;
        [(NSMutableDictionary *)v65 setObject:v34 forKey:@"t"];
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        id v72 = sub_1000116E8;
        id v73 = &unk_10002D040;
        uint64_t v74 = v65;
        if (objc_msgSend(objc_msgSend(a3, "address"), "isEqualToString:", objc_msgSend(a3, "displayName")))
        {
          CFStringRef v50 = +[CRLogging log];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            id v51 = [a3 sanitizedDescription];
            id v52 = [a3 displayName];
            *(_DWORD *)buf = 138543619;
            *(void *)&uint8_t buf[4] = v51;
            long long v49 = v65;
            *(_WORD *)&buf[12] = 2113;
            *(void *)&buf[14] = v52;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "SYNC: Skipping display name for %{public}@ %{private}@", buf, 0x16u);
          }
        }
        else
        {
          v72((id *)v71, (uint64_t)[a3 displayName], @"n");
        }
        id v55 = [a3 lastSendingAddress];
        v72((id *)v71, (uint64_t)v55, @"s");
        id v56 = [a3 metadata];
        v72((id *)v71, (uint64_t)v56, @"m");
        objc_msgSend(a3, "applyWeight:", -[NSMutableDictionary objectForKey:](v49, "objectForKey:", @"w"));
        id v57 = [a3 weight];
        v72((id *)v71, (uint64_t)v57, @"w");
        id v58 = [(NSMutableDictionary *)v49 objectForKey:@"gK"];
        objc_msgSend(a3, "setGroupKind:", objc_msgSend(v58, "unsignedIntegerValue"));
        v72((id *)v71, (uint64_t)v58, @"gK");
        long long v59 = +[CRLogging log];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          id v60 = [a3 sanitizedDescription];
          *(_DWORD *)buf = 138544131;
          *(void *)&uint8_t buf[4] = v60;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = a3;
          *(_WORD *)&buf[22] = 2113;
          CFStringRef v82 = v63;
          LOWORD(v83) = 2113;
          *(void *)((char *)&v83 + 2) = v65;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "SYNC: Merged local changes from %{public}@ %{private}@: remote=%{private}@\nmerge=%{private}@", buf, 0x2Au);
        }
        [v64 setObject:v65 forKey:v66];
      }
      else
      {
        __int16 v53 = +[CRLogging log];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          id v54 = [a3 sanitizedDescription];
          *(_DWORD *)buf = 138543619;
          *(void *)&uint8_t buf[4] = v54;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = a3;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "SYNC: Skipped syncing contact because we had no dates: %{public}@ %{private}@", buf, 0x16u);
        }
      }

      return;
    }
    long long v37 = 0;
    long long v38 = 0;
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v37 == v35 && v38 == v36) {
        goto LABEL_56;
      }
      if (v37 >= v35) {
        id v40 = +[NSDate distantPast];
      }
      else {
        id v40 = (NSDate *)[obja objectAtIndex:v37];
      }
      id v41 = v40;
      if (v38 >= v36) {
        CFStringRef v42 = +[NSDate distantPast];
      }
      else {
        CFStringRef v42 = (NSDate *)[v68 objectAtIndex:v38];
      }
      uint64_t v43 = v42;
      [(NSDate *)v41 timeIntervalSinceDate:v42];
      double v45 = v44;
      [(NSDate *)v41 timeIntervalSinceNow];
      BOOL v47 = v46 >= 172800.0;
      [(NSDate *)v43 timeIntervalSinceNow];
      if (v48 >= 172800.0) {
        BOOL v47 = 0;
      }
      if (fabs(v45) <= 1.0)
      {
        [v34 addObject:v41];
        ++v37;
      }
      else
      {
        if (v45 > 0.0)
        {
          [v34 addObject:v41];
          if (v47) {
            uint64_t v39 = (uint64_t)v37;
          }
          ++v37;
          goto LABEL_55;
        }
        if (v39 != 0x7FFFFFFFFFFFFFFFLL) {
          [v34 removeObjectAtIndex:v39];
        }
        [v34 addObject:v43];
      }
      ++v38;
      uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_55:
      if ((unint64_t)[v34 count] >= 5) {
        goto LABEL_56;
      }
    }
  }
  id v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(objc_msgSend(a3, "members"), "count"));
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = [a3 members];
  id v21 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (!v21) {
    goto LABEL_23;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v76;
  uint64_t v67 = v13;
LABEL_14:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v76 != v23) {
      objc_enumerationMutation(obj);
    }
    long long v25 = *(void **)(*((void *)&v75 + 1) + 8 * v24);
    if (![v25 address] || !objc_msgSend(v25, "kind")) {
      break;
    }
    id v26 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", [v25 address], @"a", objc_msgSend(v25, "kind"), @"k", 0);
    if ([v25 displayName]) {
      -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", [v25 displayName], @"n");
    }
    [(NSMutableArray *)v20 addObject:v26];
    if (v22 == (id)++v24)
    {
      id v22 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      uint64_t v13 = v67;
      CFStringRef v19 = &CFArrayGetValueAtIndex_ptr;
      if (!v22)
      {
LABEL_23:
        CFStringRef v27 = v20;
        CFStringRef v18 = v65;
        [(NSMutableDictionary *)v65 setObject:v27 forKey:@"mrs"];
        -[NSMutableDictionary setObject:forKey:](v65, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 groupKind]), @"gK");
        id v17 = (__CFString *)v63;
        goto LABEL_29;
      }
      goto LABEL_14;
    }
  }
  unsigned int v29 = +[CRLogging log];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v62 = [a3 sanitizedDescription];
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = v62;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = a3;
    CFStringRef v9 = "SYNC: skipped syncing contact because not all members have an address or kind: %{public}@ %{private}@";
LABEL_71:
    uint64_t v10 = v29;
    uint32_t v11 = 22;
    goto LABEL_72;
  }
}

- (void)synchronize
{
}

- (void)scheduleSynchronizationForStore:(id)a3
{
  id v5 = -[_CRRecentsLibrary _recentsDomainForStore:](self, "_recentsDomainForStore:");
  pendingStoreSyncEvents = self->_pendingStoreSyncEvents;
  double storeSyncDelay = self->_storeSyncDelay;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001183C;
  v10[3] = &unk_10002C9D0;
  v10[4] = self;
  v10[5] = a3;
  if ([(CRDelayedWorkQueue *)pendingStoreSyncEvents scheduleWorkForKey:v5 afterDelay:v10 work:storeSyncDelay])
  {
    CFStringRef v8 = +[CRLogging log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = self->_storeSyncDelay;
      *(_DWORD *)buf = 138543874;
      id v12 = v5;
      __int16 v13 = 2114;
      id v14 = a3;
      __int16 v15 = 2048;
      double v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scheduled synchronization with iCloud store (%{public}@) %{public}@ after %.2fs", buf, 0x20u);
    }
  }
}

- (BOOL)_synchronizeStore:(id)a3
{
  id v5 = -[_CRRecentsLibrary _recentsDomainForStore:](self, "_recentsDomainForStore:");
  [(CRDelayedWorkQueue *)self->_pendingStoreSyncEvents cancelWorkForKey:v5];
  unsigned int v6 = [a3 synchronize];
  id v7 = +[CRLogging log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"failed";
    int v10 = 138543874;
    id v11 = v5;
    __int16 v12 = 2114;
    if (v6) {
      CFStringRef v8 = @"succeeded";
    }
    CFStringRef v13 = v8;
    __int16 v14 = 2114;
    id v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Synchronizing with iCloud store (%{public}@) %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  return v6;
}

- (BOOL)_synchronizeAllStores
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  [(CRDelayedWorkQueue *)self->_pendingStoreSyncEvents cancel];
  cloudStores = self->_cloudStores;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011AB8;
  v8[3] = &unk_10002D068;
  v8[4] = self;
  v8[5] = &v9;
  [(NSMutableDictionary *)cloudStores enumerateKeysAndObjectsUsingBlock:v8];
  id v4 = +[CRLogging log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v10 + 24)) {
      CFStringRef v5 = @"succeeded";
    }
    else {
      CFStringRef v5 = @"failed";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Synchronizing with iCloud stores %{public}@", buf, 0xCu);
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)removeLocalRecordsForDomain:(id)a3 removeInUbiquitousStore:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[CRLogging log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing local records for domain %{public}@", buf, 0xCu);
  }
  id v8 = objc_alloc_init((Class)CRSearchQuery);
  id v13 = a3;
  objc_msgSend(v8, "setDomains:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  [v8 setImplicitGroupThreshold:1];
  id v9 = [(_CRRecentsLibrary *)self copyRecentsForQuery:v8 error:0];
  id v10 = objc_msgSend(v9, "cr_map:", &stru_10002D0A8);
  [(_CRRecentsLibrary *)self removeRecentContactsWithRecentIDs:v10 syncKeys:0 domain:a3 removeInUbiquitousStore:v4];
  uint64_t v11 = +[CRLogging log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    id v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removed %lu record(s)", buf, 0xCu);
  }
}

- (void)mergeCloudDataOneWayIntoLocalStoreWithReason:(unint64_t)a3
{
  if ((uint64_t)a3 > 2147483645)
  {
    switch(a3)
    {
      case 0x7FFFFFFEuLL:
        CFStringRef v5 = @"com.apple.corerecents.iCloudSwitch";
        break;
      case 0x7FFFFFFFuLL:
        CFStringRef v5 = @"com.apple.corerecents.iCloudSignIn";
        break;
      case 0x80000000uLL:
        CFStringRef v5 = @"com.apple.corerecents.newDatabase";
        break;
      default:
LABEL_12:
        CFStringRef v5 = +[NSString stringWithFormat:@"unknown change reason (%lu)", a3];
        break;
    }
  }
  else
  {
    CFStringRef v5 = @"NSUbiquitousKeyValueStoreServerChange";
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        CFStringRef v5 = @"NSUbiquitousKeyValueStoreInitialSyncChange";
        break;
      case 2uLL:
        CFStringRef v5 = @"NSUbiquitousKeyValueStoreQuotaViolationChange";
        break;
      case 3uLL:
        CFStringRef v5 = @"NSUbiquitousKeyValueStoreAccountChange";
        break;
      default:
        goto LABEL_12;
    }
  }
  char v6 = [[CRProcessTransaction alloc] initWithDescription:v5];
  id v7 = +[CRLogging log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Merge cloud data one-way into local with reason: %{public}@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011EE0;
  block[3] = &unk_10002D0F8;
  block[5] = v6;
  block[6] = a3;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)storeSyncDelay
{
  return self->_storeSyncDelay;
}

- (void)setStoreSyncDelay:(double)a3
{
  self->_double storeSyncDelay = a3;
}

- (NSMutableDictionary)cloudStores
{
  return self->_cloudStores;
}

- (void)setCloudStores:(id)a3
{
}

- (CRUbiquitousCoordinator)ubiquitousCoordinator
{
  return self->_ubiquitousCoordinator;
}

- (void)setUbiquitousCoordinator:(id)a3
{
}

@end