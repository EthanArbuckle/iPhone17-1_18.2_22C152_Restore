@interface PLWatchPlatformLibraryServicesDelegate
- (id)commonBuiltInOperations;
- (id)systemLibraryBuiltInOperations;
@end

@implementation PLWatchPlatformLibraryServicesDelegate

- (id)commonBuiltInOperations
{
  uint64_t v3 = PLWatchPlatformLibraryServicesOperationNameWaitForFirstUnlock;
  v4 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  v5 = [v4 preRunningProgress];
  v6 = +[PLLibraryServicesOperation operationWithName:v3 requiredState:2 parentProgress:v5 execution:&stru_10002CD90];
  v25[0] = v6;
  uint64_t v7 = PLWatchPlatformLibraryServicesOperationNameMigrateOrRebuild;
  v8 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
  v9 = [v8 preRunningProgress];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000A6BC;
  v24[3] = &unk_10002D400;
  v24[4] = self;
  v10 = +[PLLibraryServicesOperation operationWithName:v7 requiredState:4 parentProgress:v9 execution:v24];
  v25[1] = v10;
  v11 = +[NSArray arrayWithObjects:v25 count:2];

  if (PLPlatformCloudPhotosPrimarySyncSupported())
  {
    uint64_t v12 = PLWatchPlatformLibraryServicesOperationNameInitCPLManager;
    v13 = [(PLPlatformLibraryServicesDelegate *)self libraryServicesManager];
    v14 = [v13 preRunningProgress];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000A914;
    v23[3] = &unk_10002D400;
    v23[4] = self;
    v15 = +[PLLibraryServicesOperation operationWithName:v12 requiredState:5 parentProgress:v14 execution:v23];
    uint64_t v16 = [v11 arrayByAddingObject:v15];

    v11 = (void *)v16;
  }
  if (PLIsChinaSKU())
  {
    v17 = [(PLPlatformLibraryServicesDelegate *)self operationForGreenTeaContactsAuthorizationCheck];
    uint64_t v18 = [v11 arrayByAddingObject:v17];

    v11 = (void *)v18;
  }
  v22.receiver = self;
  v22.super_class = (Class)PLWatchPlatformLibraryServicesDelegate;
  v19 = [(PLPlatformLibraryServicesDelegate *)&v22 commonBuiltInOperations];
  v20 = [v19 arrayByAddingObjectsFromArray:v11];

  return v20;
}

- (id)systemLibraryBuiltInOperations
{
  return &__NSArray0__struct;
}

@end