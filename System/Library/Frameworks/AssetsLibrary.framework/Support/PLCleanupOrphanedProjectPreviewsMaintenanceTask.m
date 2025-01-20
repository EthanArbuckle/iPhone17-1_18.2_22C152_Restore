@interface PLCleanupOrphanedProjectPreviewsMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCleanupOrphanedProjectPreviewsMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(PLMaintenanceTask *)self photoLibrary];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008018;
  v8[3] = &unk_10002D4B0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 performTransaction:v8];

  return 1;
}

@end