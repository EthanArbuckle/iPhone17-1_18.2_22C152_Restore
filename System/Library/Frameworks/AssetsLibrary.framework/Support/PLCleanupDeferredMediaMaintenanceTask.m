@interface PLCleanupDeferredMediaMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCleanupDeferredMediaMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(PLMaintenanceTask *)self libraryServicesManager];
  unsigned int v6 = [v5 isSystemPhotoLibrary];

  if (v6)
  {
    v7 = [(PLMaintenanceTask *)self photoLibrary];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000CA08;
    v11[3] = &unk_10002D400;
    id v12 = v4;
    [v7 deleteUnknownDeferredIntermediatesWithCompletionHandler:v11];

    if (PLHasInternalDiagnostics())
    {
      v8 = [(PLMaintenanceTask *)self photoLibrary];
      [v8 deleteTTRDeferredIntermediates];
    }
    v9 = [(PLMaintenanceTask *)self photoLibrary];
    [v9 deleteUnusedCameraMetadataPaths];
  }
  return 1;
}

@end