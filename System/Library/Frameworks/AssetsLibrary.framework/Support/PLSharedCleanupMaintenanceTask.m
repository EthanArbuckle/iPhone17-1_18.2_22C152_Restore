@interface PLSharedCleanupMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLSharedCleanupMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(PLMaintenanceTask *)self photoLibrary];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1000082F8;
  v18 = &unk_10002D4B0;
  v19 = self;
  id v6 = v4;
  id v20 = v6;
  [v5 performTransaction:&v15 withPriority:0];

  v7 = [(PLMaintenanceTask *)self libraryServicesManager];
  unsigned int v8 = [v7 isSystemPhotoLibrary];

  if (v8)
  {
    v9 = [(PLMaintenanceTask *)self photoLibrary];
    +[PLPhotoSharingHelper pruneCloudSharingContentIfNecessaryInLibrary:v9];

    v10 = [(PLMaintenanceTask *)self photoLibrary];
    v11 = [v10 pathManager];
    v12 = [v11 libraryURL];
    unsigned int v13 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:v12];

    if (v13) {
      +[PLPhotoSharingHelper pollForAlbumListUpdatesIfNecessary];
    }
  }

  return 1;
}

@end