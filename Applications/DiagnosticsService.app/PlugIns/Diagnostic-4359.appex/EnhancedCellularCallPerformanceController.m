@interface EnhancedCellularCallPerformanceController
- (BOOL)copyForSyncing;
- (id)_extractFilePaths:(id)a3;
- (void)setCopyForSyncing:(BOOL)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation EnhancedCellularCallPerformanceController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
  Boolean keyExistsAndHasValidFormat = 0;
  [(EnhancedCellularCallPerformanceController *)self setCopyForSyncing:CFPreferencesGetAppBooleanValue(@"Diagnostic-4359.CopyForSyncing", @"com.apple.Diagnostics", &keyExistsAndHasValidFormat) != 0];
  if (!keyExistsAndHasValidFormat) {
    [(EnhancedCellularCallPerformanceController *)self setCopyForSyncing:0];
  }
  v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(EnhancedCellularCallPerformanceController *)self copyForSyncing];
    *(_DWORD *)buf = 67109376;
    unsigned int v9 = v6;
    __int16 v10 = 1024;
    int v11 = keyExistsAndHasValidFormat;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Copying for syncing: %d, exists: %d", buf, 0xEu);
  }
}

- (void)start
{
  v2 = [(EnhancedCellularCallPerformanceController *)self result];
  [v2 setStatusCode:&off_100004240];

  WISServerConsolidateDeviceDiagnostics();
}

- (id)_extractFilePaths:(id)a3
{
  id v4 = a3;
  id v43 = +[NSMutableArray array];
  v5 = [v4 objectForKeyedSubscript:kWisDiagnosticsFileArray];
  if (!v5)
  {
    v15 = [(EnhancedCellularCallPerformanceController *)self result];
    [v15 setStatusCode:&off_100004288];

    v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100003418(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [(EnhancedCellularCallPerformanceController *)self result];
    [v24 setStatusCode:&off_1000042A0];

    v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100003488(v16, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_24;
  }
  if (![v5 count])
  {
    v32 = [(EnhancedCellularCallPerformanceController *)self result];
    [v32 setStatusCode:&off_1000042B8];

    v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100003450(v16, v33, v34, v35, v36, v37, v38, v39);
    }
LABEL_24:

    id v6 = v43;
    id v43 = 0;
    goto LABEL_25;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v7)
  {
    id v8 = v7;
    v41 = v5;
    id v42 = v4;
    uint64_t v9 = *(void *)v45;
    char v10 = 1;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = +[NSURL fileURLWithPath:v12];
          [v43 addObject:v13];
        }
        else
        {
          v14 = [(EnhancedCellularCallPerformanceController *)self result];
          [v14 setStatusCode:&off_1000042D0];

          v13 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v49 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ERROR item in array is not an NSString: %@", buf, 0xCu);
          }
          char v10 = 0;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v8);

    if (v10)
    {
      v5 = v41;
      id v4 = v42;
      goto LABEL_26;
    }
    id v6 = v43;
    id v43 = 0;
    v5 = v41;
    id v4 = v42;
  }
LABEL_25:

LABEL_26:

  return v43;
}

- (BOOL)copyForSyncing
{
  return self->_copyForSyncing;
}

- (void)setCopyForSyncing:(BOOL)a3
{
  self->_copyForSyncing = a3;
}

@end