@interface ANNotificationStore
+ (id)sharedStore;
- (ANNotificationStore)init;
- (BOOL)_unsafe_commitChangesInManagedObjectContext;
- (BOOL)limitPendingNotificationsForAccountTypeID:(id)a3 toMaximumCount:(unint64_t)a4;
- (BOOL)removeAllNotificationsForAccountTypeID:(id)a3;
- (BOOL)removeNotificationWithIdentifier:(id)a3;
- (BOOL)saveNotification:(id)a3;
- (id)_copyPersistentStoreFilePath;
- (id)_managedObjectModel;
- (id)_notificationsMatchingPredicate:(id)a3;
- (id)_notificationsMatchingPredicate:(id)a3 limit:(unint64_t)a4;
- (id)notificationWithIdentifier:(id)a3;
- (id)pendingNotificationsForAccountsWithTypeID:(id)a3;
- (id)pendingNotificationsWithEventID:(id)a3;
- (id)typeIdentifiersOfAccountsWithPendingNotifications;
- (void)_createManagedObjectContext;
@end

@implementation ANNotificationStore

+ (id)sharedStore
{
  if (qword_100011658 != -1) {
    dispatch_once(&qword_100011658, &stru_10000C2F8);
  }
  v2 = (void *)qword_100011650;
  return v2;
}

- (ANNotificationStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)ANNotificationStore;
  v2 = [(ANNotificationStore *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ANNotificationStore *)v2 _createManagedObjectContext];
  }
  return v3;
}

- (id)pendingNotificationsForAccountsWithTypeID:(id)a3
{
  v4 = +[NSPredicate predicateWithFormat:@"accountTypeID = %@", a3];
  objc_super v5 = [(ANNotificationStore *)self _notificationsMatchingPredicate:v4];

  return v5;
}

- (id)notificationWithIdentifier:(id)a3
{
  v4 = +[NSPredicate predicateWithFormat:@"identifier = %@", a3];
  objc_super v5 = [(ANNotificationStore *)self _notificationsMatchingPredicate:v4 limit:1];
  v6 = [v5 firstObject];

  return v6;
}

- (id)pendingNotificationsWithEventID:(id)a3
{
  v4 = +[NSPredicate predicateWithFormat:@"eventID = %@", a3];
  objc_super v5 = [(ANNotificationStore *)self _notificationsMatchingPredicate:v4];

  return v5;
}

- (id)typeIdentifiersOfAccountsWithPendingNotifications
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10000361C;
  v15 = sub_10000362C;
  id v16 = objc_alloc_init((Class)NSMutableArray);
  v3 = +[NSFetchRequest fetchRequestWithEntityName:@"AccountNotification"];
  [v3 setPropertiesToFetch:&off_10000C7F0];
  [v3 setReturnsDistinctResults:1];
  [v3 setResultType:2];
  managedObjectContext = self->_managedObjectContext;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003634;
  v8[3] = &unk_10000C320;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_notificationsMatchingPredicate:(id)a3
{
  return [(ANNotificationStore *)self _notificationsMatchingPredicate:a3 limit:0];
}

- (id)_notificationsMatchingPredicate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10000361C;
  v19 = sub_10000362C;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  v7 = +[NSFetchRequest fetchRequestWithEntityName:@"AccountNotification"];
  [v7 setPredicate:v6];
  [v7 setReturnsObjectsAsFaults:0];
  if (a4) {
    [v7 setFetchLimit:a4];
  }
  managedObjectContext = self->_managedObjectContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003950;
  v12[3] = &unk_10000C320;
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  v14 = &v15;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)saveNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (v5
    && (id v6 = (void *)v5,
        [v4 accountTypeID],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    managedObjectContext = self->_managedObjectContext;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003C30;
    v12[3] = &unk_10000C320;
    id v13 = v4;
    v14 = self;
    uint64_t v15 = &v16;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v12];
    BOOL v9 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v10 = _ANLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000742C();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)limitPendingNotificationsForAccountTypeID:(id)a3 toMaximumCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = _ANLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[ANNotificationStore limitPendingNotificationsForAccountTypeID:toMaximumCount:]";
    __int16 v40 = 1024;
    int v41 = 195;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v8 = +[NSFetchRequest fetchRequestWithEntityName:@"AccountNotification"];
  BOOL v9 = +[NSPredicate predicateWithFormat:@"accountTypeID = %@", v6];
  [v8 setPredicate:v9];

  managedObjectContext = self->_managedObjectContext;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000042EC;
  v26[3] = &unk_10000C348;
  v28 = &v29;
  v26[4] = self;
  id v11 = v8;
  id v27 = v11;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v26];
  unint64_t v12 = v30[3];
  BOOL v13 = v12 >= a4;
  unint64_t v14 = v12 - a4;
  if (v13)
  {
    uint64_t v17 = _ANLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = +[NSNumber numberWithUnsignedInteger:v14];
      *(_DWORD *)buf = 136315906;
      v39 = "-[ANNotificationStore limitPendingNotificationsForAccountTypeID:toMaximumCount:]";
      __int16 v40 = 1024;
      int v41 = 215;
      __int16 v42 = 2112;
      id v43 = v18;
      __int16 v44 = 2112;
      id v45 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s (%d) \"We need to remove %@ pending notifications for type %@\"", buf, 0x26u);
    }
    char v19 = +[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:1];
    v37 = v19;
    id v20 = +[NSArray arrayWithObjects:&v37 count:1];
    [v11 setSortDescriptors:v20];

    [v11 setFetchLimit:v14];
    [v11 setReturnsObjectsAsFaults:1];
    v21 = self->_managedObjectContext;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100004380;
    v23[3] = &unk_10000C320;
    v23[4] = self;
    id v24 = v11;
    v25 = &v33;
    [(NSManagedObjectContext *)v21 performBlockAndWait:v23];

    BOOL v16 = *((unsigned char *)v34 + 24) != 0;
  }
  else
  {
    uint64_t v15 = _ANLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "-[ANNotificationStore limitPendingNotificationsForAccountTypeID:toMaximumCount:]";
      __int16 v40 = 1024;
      int v41 = 211;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s (%d) \"No need to limit pending notifications of type %@\"", buf, 0x1Cu);
    }

    BOOL v16 = 1;
    *((unsigned char *)v34 + 24) = 1;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v16;
}

- (BOOL)removeAllNotificationsForAccountTypeID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ANNotificationStore removeAllNotificationsForAccountTypeID:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 242;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v16 = 0;
  id v6 = +[NSFetchRequest fetchRequestWithEntityName:@"AccountNotification"];
  v7 = +[NSPredicate predicateWithFormat:@"accountTypeID = %@", v4];
  [v6 setPredicate:v7];

  [v6 setReturnsObjectsAsFaults:1];
  managedObjectContext = self->_managedObjectContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000046E8;
  v12[3] = &unk_10000C320;
  void v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  unint64_t v14 = buf;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v12];
  BOOL v10 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v10;
}

- (BOOL)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ANNotificationStore removeNotificationWithIdentifier:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 269;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v18 = 0;
  id v6 = +[NSFetchRequest fetchRequestWithEntityName:@"AccountNotification"];
  v7 = +[NSPredicate predicateWithFormat:@"identifier = %@", v4];
  [v6 setPredicate:v7];

  [v6 setReturnsObjectsAsFaults:1];
  [v6 setFetchLimit:1];
  managedObjectContext = self->_managedObjectContext;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004A6C;
  v13[3] = &unk_10000C370;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v4;
  id v15 = v10;
  char v16 = buf;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v13];
  BOOL v11 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v11;
}

- (BOOL)_unsafe_commitChangesInManagedObjectContext
{
  managedObjectContext = self->_managedObjectContext;
  id v8 = 0;
  unsigned __int8 v3 = [(NSManagedObjectContext *)managedObjectContext save:&v8];
  id v4 = v8;
  uint64_t v5 = _ANLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000077D0();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_100007744();
  }

  return v3;
}

- (void)_createManagedObjectContext
{
  id v3 = objc_alloc((Class)NSPersistentStoreCoordinator);
  id v4 = [(ANNotificationStore *)self _managedObjectModel];
  uint64_t v5 = (NSPersistentStoreCoordinator *)[v3 initWithManagedObjectModel:v4];
  storeCoordinator = self->_storeCoordinator;
  self->_storeCoordinator = v5;

  if (self->_storeCoordinator)
  {
    id v7 = [(ANNotificationStore *)self _copyPersistentStoreFilePath];
    id v8 = +[NSURL fileURLWithPath:v7];

    v19[0] = NSInferMappingModelAutomaticallyOption;
    v19[1] = NSMigratePersistentStoresAutomaticallyOption;
    v20[0] = &__kCFBooleanTrue;
    v20[1] = &__kCFBooleanTrue;
    id v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v10 = self->_storeCoordinator;
    id v18 = 0;
    id v11 = [(NSPersistentStoreCoordinator *)v10 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v8 options:v9 error:&v18];
    id v12 = v18;
    if (v12)
    {
      id v13 = _ANLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000078D8();
      }
    }
    else
    {
      id v14 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
      managedObjectContext = self->_managedObjectContext;
      self->_managedObjectContext = v14;

      char v16 = self->_managedObjectContext;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100004EA8;
      v17[3] = &unk_10000C398;
      v17[4] = self;
      [(NSManagedObjectContext *)v16 performBlockAndWait:v17];
    }
  }
  else
  {
    id v8 = _ANLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000784C();
    }
  }
}

- (id)_managedObjectModel
{
  if (qword_100011668 != -1) {
    dispatch_once(&qword_100011668, &stru_10000C3B8);
  }
  v2 = (void *)qword_100011660;
  return v2;
}

- (id)_copyPersistentStoreFilePath
{
  CFURLRef v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v2)
  {
    CFURLRef v3 = v2;
    id v4 = (__CFString *)CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
    id v5 = [(__CFString *)v4 mutableCopy];
    [v5 appendString:@"/Library/AccountNotifications/"];
    CPFileBuildDirectoriesToPath();
    CFRelease(v3);
  }
  else
  {
    id v5 = 0;
  }
  [v5 appendString:@"AccountNotificationStore.sqlite"];
  id v6 = [v5 copy];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end