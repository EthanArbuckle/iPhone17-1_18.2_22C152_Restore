@interface PLAnalysisStateCleanupMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLAnalysisStateCleanupMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v4 = [(PLMaintenanceTask *)self libraryBundle];
  v5 = [v4 libraryURL];
  id v11 = 0;
  unsigned __int8 v6 = +[PLAssetAnalysisState cleanupInvalidIgnoreUntilDatesInLibraryAtURL:v5 error:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    v8 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error cleaning up invalid ignoreUntilDate values: %@", buf, 0xCu);
    }
  }
  v9 = [(PLMaintenanceTask *)self photoLibrary];
  +[PLAssetAnalysisState removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode:1 library:v9];

  return 1;
}

@end