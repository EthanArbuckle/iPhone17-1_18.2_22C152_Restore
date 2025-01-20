@interface SHMediaLibraryDataStore
- (BOOL)commitChangesWithError:(id *)a3;
- (NSFetchedResultsController)groupsFetchedResultsController;
- (NSFetchedResultsController)tracksFetchedResultsController;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentContainer)persistentContainer;
- (SHMediaLibraryDataStore)initWithStoreType:(int64_t)a3;
- (SHMediaLibraryDataStoreDelegate)delegate;
- (id)createMetadataWithData:(id)a3 track:(id)a4 group:(id)a5 context:(id)a6;
- (id)fetchAllUploadableGroupsMissingLibrarySyncMetadata;
- (id)fetchAllUploadableTracksMissingLibrarySyncMetadata;
- (id)fetchLibraryGroupsWithParameters:(id)a3;
- (id)fetchLibraryTracksWithParameters:(id)a3;
- (id)fetchManagedObjectForRequest:(id)a3 withPredicate:(id)a4 context:(id)a5;
- (id)libraryItemFromManagedObject:(id)a3;
- (id)persistentContainerForStoreType:(int64_t)a3 error:(id *)a4;
- (id)updateReportForLibraryGroups:(id)a3;
- (id)updateReportForLibraryTrack:(id)a3;
- (int64_t)libraryChangeTypeForFetchedResultsChangeType:(unint64_t)a3;
- (void)associateTrack:(id)a3 toGroupWithIdentifier:(id)a4 context:(id)a5;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)deleteAllItems;
- (void)deleteAllItemsWithFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)deleteAllSyncMetadataItems;
- (void)deleteItemsByIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchLibraryItemsWithParameters:(id)a3 completionHandler:(id)a4;
- (void)initializeGroupsFetchedResultsControllerWithContext:(id)a3;
- (void)initializeTracksFetchedResultsControllerWithContext:(id)a3;
- (void)persistLibraryGroups:(id)a3 completionHandler:(id)a4;
- (void)persistUpdatedTracks:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setGroupsFetchedResultsController:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setTracksFetchedResultsController:(id)a3;
- (void)updateManagedTrack:(id)a3 withUpdatedTrack:(id)a4;
@end

@implementation SHMediaLibraryDataStore

- (SHMediaLibraryDataStore)initWithStoreType:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SHMediaLibraryDataStore;
  v4 = [(SHMediaLibraryDataStore *)&v20 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  id v19 = 0;
  uint64_t v6 = [(SHMediaLibraryDataStore *)v4 persistentContainerForStoreType:a3 error:&v19];
  id v7 = v19;
  persistentContainer = v5->_persistentContainer;
  v5->_persistentContainer = (NSPersistentContainer *)v6;

  if (!v7)
  {
    v11 = [(NSPersistentContainer *)v5->_persistentContainer newBackgroundContext];
    v12 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
    [(NSManagedObjectContext *)v11 setMergePolicy:v12];

    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = +[NSString stringWithFormat:@"%@ context", v14];
    [(NSManagedObjectContext *)v11 setName:v15];

    managedObjectContext = v5->_managedObjectContext;
    v5->_managedObjectContext = v11;
    v17 = v11;

    [(SHMediaLibraryDataStore *)v5 initializeTracksFetchedResultsControllerWithContext:v17];
    [(SHMediaLibraryDataStore *)v5 initializeGroupsFetchedResultsControllerWithContext:v17];

LABEL_7:
    v10 = v5;
    goto LABEL_8;
  }
  v9 = sh_log_object();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to load persistent container %@", buf, 0xCu);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (id)persistentContainerForStoreType:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = NSSQLiteStoreType;
  if (!a3)
  {
    id v7 = NSInMemoryStoreType;

    uint64_t v6 = v7;
  }
  id v8 = objc_alloc((Class)NSManagedObjectModel);
  v9 = +[SHMediaLibraryPersistentConfiguration managedObjectModelURL];
  id v10 = [v8 initWithContentsOfURL:v9];

  id v11 = [objc_alloc((Class)NSPersistentContainer) initWithName:@"ShazamLibrary" managedObjectModel:v10];
  v12 = +[SHMediaLibraryPersistentConfiguration persistentStoreDescriptionForStoreType:v6];
  id v22 = v12;
  v13 = +[NSArray arrayWithObjects:&v22 count:1];
  [v11 setPersistentStoreDescriptions:v13];

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10001B684;
  objc_super v20 = sub_10001B694;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001B69C;
  v15[3] = &unk_100075380;
  v15[4] = &v16;
  [v11 loadPersistentStoresWithCompletionHandler:v15];
  if (a4) {
    *a4 = (id) v17[5];
  }
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)fetchLibraryItemsWithParameters:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void *, void *, void))a4;
  if ([v9 filterOptions])
  {
    id v7 = [(SHMediaLibraryDataStore *)self fetchLibraryTracksWithParameters:v9];
  }
  else
  {
    id v7 = 0;
  }
  if (([v9 filterOptions] & 2) != 0)
  {
    id v8 = [(SHMediaLibraryDataStore *)self fetchLibraryGroupsWithParameters:v9];
  }
  else
  {
    id v8 = 0;
  }
  v6[2](v6, v7, v8, 0);
}

- (id)fetchLibraryTracksWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10001B684;
  id v19 = sub_10001B694;
  id v20 = +[NSMutableArray array];
  v5 = [(SHMediaLibraryDataStore *)self tracksFetchedResultsController];
  uint64_t v6 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001B900;
  v11[3] = &unk_1000753A8;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  v14 = &v15;
  [v6 performBlockAndWait:v11];

  id v9 = [(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)fetchAllUploadableTracksMissingLibrarySyncMetadata
{
  v3 = NSStringFromSelector("date");
  id v4 = +[NSString stringWithFormat:@"%@ != nil", v3];
  v5 = +[NSPredicate predicateWithFormat:v4];

  uint64_t v6 = NSStringFromSelector("metadata");
  id v7 = +[NSString stringWithFormat:@"%@ == nil", v6];
  id v8 = +[NSPredicate predicateWithFormat:v7];

  v26[0] = v5;
  v26[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v26 count:2];
  id v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  id v11 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  id v12 = +[SHTrackMO fetchRequest];
  id v13 = [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v12 withPredicate:v10 context:v11];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10001B684;
  v24 = sub_10001B694;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001BE44;
  v17[3] = &unk_1000753D0;
  id v14 = v13;
  id v18 = v14;
  id v19 = &v20;
  [v11 performBlockAndWait:v17];
  id v15 = [(id)v21[5] copy];

  _Block_object_dispose(&v20, 8);

  return v15;
}

- (id)fetchAllUploadableGroupsMissingLibrarySyncMetadata
{
  v3 = NSStringFromSelector("metadata");
  id v4 = +[NSString stringWithFormat:@"%@ == nil", v3];
  v5 = +[NSPredicate predicateWithFormat:v4];

  v23 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v23 count:1];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  id v8 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  id v9 = +[SHGroupMO fetchRequest];
  id v10 = [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v9 withPredicate:v7 context:v8];

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10001B684;
  id v21 = sub_10001B694;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001C1E0;
  v14[3] = &unk_1000753D0;
  id v11 = v10;
  id v15 = v11;
  uint64_t v16 = &v17;
  [v8 performBlockAndWait:v14];
  id v12 = [(id)v18[5] copy];

  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)fetchLibraryGroupsWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10001B684;
  uint64_t v19 = sub_10001B694;
  id v20 = +[NSMutableArray array];
  v5 = [(SHMediaLibraryDataStore *)self groupsFetchedResultsController];
  uint64_t v6 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C484;
  v11[3] = &unk_1000753A8;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  id v14 = &v15;
  [v6 performBlockAndWait:v11];

  id v9 = [(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)persistUpdatedTracks:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SHMediaLibraryDataStore *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C6E4;
  v11[3] = &unk_1000753F8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlockAndWait:v11];
}

- (id)updateReportForLibraryTrack:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SHMediaLibraryUpdateReport);
  id v6 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  id v7 = NSStringFromSelector("identifier");
  id v8 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", v7];
  id v9 = [v4 valueForKeyPath:v8];

  id v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"syncID", v9];
  id v11 = +[SHTrackMO fetchRequest];
  id v12 = [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v11 withPredicate:v10 context:v6];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001CE00;
  v19[3] = &unk_100074F98;
  id v20 = v4;
  id v21 = v12;
  id v13 = v5;
  id v22 = v13;
  id v14 = v12;
  id v15 = v4;
  [v6 performBlockAndWait:v19];
  uint64_t v16 = v22;
  uint64_t v17 = v13;

  return v17;
}

- (void)persistLibraryGroups:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SHMediaLibraryDataStore *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D150;
  v11[3] = &unk_1000753F8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlockAndWait:v11];
}

- (id)updateReportForLibraryGroups:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SHMediaLibraryUpdateReport);
  id v6 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  id v7 = NSStringFromSelector("identifier");
  id v8 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", v7];
  id v9 = [v4 valueForKeyPath:v8];

  id v10 = NSStringFromSelector("syncID");
  id v11 = +[NSPredicate predicateWithFormat:@"%K IN %@", v10, v9];

  id v12 = +[SHGroupMO fetchRequest];
  id v13 = [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v12 withPredicate:v11 context:v6];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001D8C8;
  v20[3] = &unk_100074F98;
  id v21 = v4;
  id v22 = v13;
  id v14 = v5;
  v23 = v14;
  id v15 = v13;
  id v16 = v4;
  [v6 performBlockAndWait:v20];
  uint64_t v17 = v23;
  id v18 = v14;

  return v18;
}

- (void)deleteItemsByIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  id v9 = NSStringFromSelector("syncID");
  id v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", v9, v7];

  id v11 = +[SHGroupMO fetchRequest];
  id v12 = [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v11 withPredicate:v10 context:v8];

  id v13 = +[SHTrackMO fetchRequest];
  id v14 = [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v13 withPredicate:v10 context:v8];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001DCE0;
  v19[3] = &unk_1000753F8;
  id v20 = v12;
  id v21 = v8;
  id v22 = v14;
  id v23 = v6;
  id v15 = v6;
  id v16 = v14;
  id v17 = v8;
  id v18 = v12;
  [v17 performBlockAndWait:v19];
}

- (void)deleteAllItemsWithFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHMediaLibraryDataStore *)self managedObjectContext];
  id v9 = [(SHMediaLibraryDataStore *)self persistentContainer];
  id v10 = [v9 persistentStoreDescriptions];
  id v11 = [v10 firstObject];

  id v12 = [v11 type];
  LODWORD(v10) = [v12 isEqualToString:NSInMemoryStoreType];

  if (v10)
  {
    [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v6 withPredicate:0 context:v8];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001E150;
    v29[3] = &unk_100075470;
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    id v31 = v8;
    id v32 = v7;
    id v13 = v30;
    [v31 performBlockAndWait:v29];

    id v14 = v30;
  }
  else
  {
    id v15 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v6];
    id v16 = [(SHMediaLibraryDataStore *)self persistentContainer];
    id v17 = [v16 persistentStoreCoordinator];

    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = sub_10001B684;
    v27 = sub_10001B694;
    id v28 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001E258;
    v18[3] = &unk_100075498;
    id v14 = v17;
    id v19 = v14;
    id v13 = v15;
    id v20 = v13;
    id v21 = v8;
    id v22 = &v23;
    [v21 performBlockAndWait:v18];
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v24[5]);

    _Block_object_dispose(&v23, 8);
  }
}

- (void)deleteAllItems
{
  v3 = +[SHGroupMO fetchRequest];
  [(SHMediaLibraryDataStore *)self deleteAllItemsWithFetchRequest:v3 completionHandler:&stru_1000754D8];

  id v4 = +[SHTrackMO fetchRequest];
  [(SHMediaLibraryDataStore *)self deleteAllItemsWithFetchRequest:v4 completionHandler:&stru_1000754F8];

  [(SHMediaLibraryDataStore *)self reset];
}

- (void)deleteAllSyncMetadataItems
{
  v3 = +[SHMetadataMO fetchRequest];
  [(SHMediaLibraryDataStore *)self deleteAllItemsWithFetchRequest:v3 completionHandler:&stru_100075518];

  [(SHMediaLibraryDataStore *)self reset];
}

- (BOOL)commitChangesWithError:(id *)a3
{
  [(SHMediaLibraryDataStore *)self managedObjectContext];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10001B684;
  uint64_t v25 = sub_10001B694;
  id v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10001E7B4;
  id v13 = &unk_100075540;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v4;
  id v15 = &v17;
  id v16 = &v21;
  [v4 performBlockAndWait:&v10];
  int v5 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((unsigned char *)v18 + 24))
  {
    uint64_t v6 = v22[5];
    if (v6)
    {
      NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
      uint64_t v28 = v6;
      id v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v10, v11, v12, v13);
    }
    else
    {
      id v7 = 0;
    }
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SHErrorDomain, 400, v7, v10, v11, v12, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    int v5 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v8 = v5 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

- (void)reset
{
  [(SHMediaLibraryDataStore *)self managedObjectContext];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001E8CC;
  v3[3] = &unk_100074C30;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = v4;
  [v2 performBlockAndWait:v3];
}

- (id)fetchManagedObjectForRequest:(id)a3 withPredicate:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 setPredicate:v8];
  uint64_t v26 = 0;
  NSErrorUserInfoKey v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10001B684;
  id v30 = sub_10001B694;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10001B684;
  v24 = sub_10001B694;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001EB2C;
  v15[3] = &unk_100075568;
  id v18 = &v20;
  id v10 = v9;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  uint64_t v19 = &v26;
  [v10 performBlockAndWait:v15];
  if (v27[5])
  {
    id v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to fetch request %{public}@", buf, 0xCu);
    }
  }
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)createMetadataWithData:(id)a3 track:(id)a4 group:(id)a5 context:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  id v15 = +[NSEntityDescription insertNewObjectForEntityForName:v14 inManagedObjectContext:v9];

  [v15 setData:v12];
  [v15 setTrack:v11];

  [v15 setGroup:v10];

  return v15;
}

- (void)associateTrack:(id)a3 toGroupWithIdentifier:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector("syncID");
  id v12 = +[NSPredicate predicateWithFormat:@"%K == %@", v11, v9];

  id v13 = +[SHGroupMO fetchRequest];
  id v14 = [(SHMediaLibraryDataStore *)self fetchManagedObjectForRequest:v13 withPredicate:v12 context:v10];
  id v15 = [v14 firstObject];

  if (v15)
  {
    [v8 setGroup:v15];
  }
  else
  {
    id v16 = sh_log_object();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Persisting a Track with an associated Group ID, but there is no group saved locally. Will fallback to creation.", buf, 2u);
    }

    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    uint64_t v19 = +[NSEntityDescription insertNewObjectForEntityForName:v18 inManagedObjectContext:v10];

    [v19 setSyncID:v9];
    [v8 setGroup:v19];
  }
}

- (void)updateManagedTrack:(id)a3 withUpdatedTrack:(id)a4
{
  id v54 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 identifier];
  [v54 setSyncID:v6];

  id v7 = [v5 creationDate];
  [v54 setDate:v7];

  id v8 = [v5 location];
  if (v8)
  {
    id v9 = [v5 location];
    [v9 coordinate];
    objc_msgSend(v54, "setLatitude:");
  }
  else
  {
    [v54 setLatitude:kCLLocationCoordinate2DInvalid.latitude];
  }

  id v10 = [v5 location];
  if (v10)
  {
    id v11 = [v5 location];
    [v11 coordinate];
    [v54 setLongitude:v12];
  }
  else
  {
    [v54 setLongitude:kCLLocationCoordinate2DInvalid.longitude];
  }

  if ([v5 explicitContent]) {
    objc_msgSend(v54, "setExplicit:", objc_msgSend(v5, "explicitContent"));
  }
  if ([v5 shazamCount]) {
    objc_msgSend(v54, "setShazamCount:", objc_msgSend(v5, "shazamCount"));
  }
  id v13 = [v5 shazamKey];

  if (v13)
  {
    id v14 = [v5 shazamKey];
    id v15 = [v14 validatedKey];
    [v54 setShazamKey:v15];
  }
  id v16 = [v5 recognitionIdentifier];

  if (v16)
  {
    id v17 = [v5 recognitionIdentifier];
    [v54 setRecognitionID:v17];
  }
  id v18 = [v5 title];

  if (v18)
  {
    uint64_t v19 = [v5 title];
    [v54 setTitle:v19];
  }
  uint64_t v20 = [v5 subtitle];

  if (v20)
  {
    uint64_t v21 = [v5 subtitle];
    [v54 setSubtitle:v21];
  }
  uint64_t v22 = [v5 providerIdentifier];

  if (v22)
  {
    uint64_t v23 = [v5 providerIdentifier];
    [v54 setProviderID:v23];
  }
  v24 = [v5 providerName];

  if (v24)
  {
    id v25 = [v5 providerName];
    [v54 setProviderName:v25];
  }
  uint64_t v26 = [v5 artworkURL];

  if (v26)
  {
    NSErrorUserInfoKey v27 = [v5 artworkURL];
    [v54 setArtworkURL:v27];
  }
  uint64_t v28 = [v5 shazamURL];

  if (v28)
  {
    v29 = [v5 shazamURL];
    [v54 setShazamURL:v29];
  }
  id v30 = [v5 albumName];

  if (v30)
  {
    id v31 = [v5 albumName];
    [v54 setAlbumName:v31];
  }
  id v32 = [v5 appleMusicID];

  if (v32)
  {
    id v33 = [v5 appleMusicID];
    [v54 setAppleMusicID:v33];
  }
  v34 = [v5 appleMusicURL];

  if (v34)
  {
    v35 = [v5 appleMusicURL];
    [v54 setAppleMusicURL:v35];
  }
  v36 = [v5 genres];

  if (v36)
  {
    v37 = [v5 genres];
    [v54 setGenres:v37];
  }
  v38 = [v5 isrc];

  if (v38)
  {
    v39 = [v5 isrc];
    [v54 setIsrc:v39];
  }
  v40 = [v5 rawSongResponse];

  if (v40)
  {
    v41 = [v5 rawSongResponse];
    [v54 setRawSongResponse:v41];
  }
  v42 = [v5 releaseDate];

  if (v42)
  {
    v43 = [v5 releaseDate];
    [v54 setReleaseDate:v43];
  }
  v44 = [v5 videoURL];

  if (v44)
  {
    v45 = [v5 videoURL];
    [v54 setVideoURL:v45];
  }
  v46 = [v5 lastUpdatedDate];

  if (v46)
  {
    v47 = [v5 lastUpdatedDate];
    [v54 setModifiedDate:v47];
  }
  v48 = NSStringFromSelector("name");
  v49 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", v48];

  v50 = [v5 labels];
  v51 = [v50 valueForKeyPath:v49];
  v52 = [v51 allObjects];

  id v53 = [v52 copy];
  [v54 setLabels:v53];
}

- (void)initializeTracksFetchedResultsControllerWithContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F490;
  v4[3] = &unk_100074FC0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (void)initializeGroupsFetchedResultsControllerWithContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F64C;
  v4[3] = &unk_100074FC0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 != 3)
  {
    id v14 = [(SHMediaLibraryDataStore *)self libraryItemFromManagedObject:v11];
    if (!v14)
    {
      id v17 = sh_log_object();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = objc_opt_class();
        id v19 = v18;
        int v23 = 138412546;
        v24 = v18;
        __int16 v25 = 2112;
        id v26 = (id)objc_opt_class();
        id v20 = v26;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to convert %@ to %@", (uint8_t *)&v23, 0x16u);
      }
      goto LABEL_13;
    }
    id v15 = v13;
    if (a6 != 1)
    {
      if (a6 != 4 && a6 != 2)
      {
        id v16 = 0;
        goto LABEL_12;
      }
      id v15 = v12;
    }
    id v16 = v15;
LABEL_12:
    id v21 = objc_msgSend(objc_alloc((Class)SHMediaLibraryChange), "initWithLibraryItem:changeType:indexPath:", v14, -[SHMediaLibraryDataStore libraryChangeTypeForFetchedResultsChangeType:](self, "libraryChangeTypeForFetchedResultsChangeType:", a6), v16);
    uint64_t v22 = [(SHMediaLibraryDataStore *)self delegate];
    [v22 libraryDataStore:self didUpdateWithChange:v21];

LABEL_13:
  }
}

- (id)libraryItemFromManagedObject:(id)a3
{
  id v4 = a3;
  [(SHMediaLibraryDataStore *)self managedObjectContext];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10001B684;
  id v17 = sub_10001B694;
  id v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001FA9C;
  v9[3] = &unk_1000753A8;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [v5 performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (int64_t)libraryChangeTypeForFetchedResultsChangeType:(unint64_t)a3
{
  if (a3 == 2) {
    return 3;
  }
  else {
    return 1;
  }
}

- (SHMediaLibraryDataStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMediaLibraryDataStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSFetchedResultsController)tracksFetchedResultsController
{
  return self->_tracksFetchedResultsController;
}

- (void)setTracksFetchedResultsController:(id)a3
{
}

- (NSFetchedResultsController)groupsFetchedResultsController
{
  return self->_groupsFetchedResultsController;
}

- (void)setGroupsFetchedResultsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_tracksFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end