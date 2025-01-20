@interface BRCAutoBugCaptureReporter
+ (id)sharedABCReporter;
- (BOOL)_shouldIgnoreReportForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5;
- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5;
- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5 underlyingError:(id)a6;
- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5 underlyingError:(id)a6 waitForCompletion:(BOOL)a7;
- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 withContext:(id)a5;
- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 withContext:(id)a5 waitForCompletion:(BOOL)a6;
@end

@implementation BRCAutoBugCaptureReporter

+ (id)sharedABCReporter
{
  if (sharedABCReporter_onceToken != -1) {
    dispatch_once(&sharedABCReporter_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedABCReporter_reporter;
  return v2;
}

void __46__BRCAutoBugCaptureReporter_sharedABCReporter__block_invoke()
{
  v0 = objc_alloc_init(BRCAutoBugCaptureReporter);
  v1 = (void *)sharedABCReporter_reporter;
  sharedABCReporter_reporter = (uint64_t)v0;
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 withContext:(id)a5 waitForCompletion:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__onceToken != -1) {
    dispatch_once(&captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__onceToken, &__block_literal_global_2);
  }
  v12 = [NSString stringWithFormat:@"%@.%@", v9, v10];
  id v13 = (id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle;
  objc_sync_enter(v13);
  v14 = [(id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle objectForKeyedSubscript:v12];
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 longLongValue];
    uint64_t v17 = brc_interval_to_nsec();
    if (v17 + v16 < brc_current_date_nsec())
    {
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        id v29 = v9;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        id v33 = v11;
        __int16 v34 = 2112;
        v35 = v15;
        __int16 v36 = 2112;
        v37 = v18;
        _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Not sending recently rejected ABC report with signature: type = %@, subtype = %@, subtype context = %@, rejected time = %@%@", buf, 0x34u);
      }

      objc_sync_exit(v13);
      goto LABEL_14;
    }
    [(id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle removeObjectForKey:v12];
  }

  objc_sync_exit(v13);
  v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    v35 = v20;
    _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Sending ABC report with signature: type = %@, subtype = %@, subtype context = %@%@", buf, 0x2Au);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
  v22 = [v13 signatureWithDomain:@"iCloudDrive" type:v9 subType:v10 subtypeContext:v11 detectedProcess:@"bird" triggerThresholdValues:0];
  v23 = dispatch_group_create();
  dispatch_group_enter(v23);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_14;
  v25[3] = &unk_1E69953A8;
  id v26 = v12;
  v24 = v23;
  v27 = v24;
  [v13 snapshotWithSignature:v22 duration:0 events:0 payload:0 actions:v25 reply:15.0];
  if (v6) {
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  }

LABEL_14:
}

void __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke()
{
  v0 = +[BRCUserDefaults defaultsForMangledID:0];
  [v0 autoBugCaptureReporterThrottlePeriod];
  captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottlePeriod = v1;

  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v3 = [v2 autoBugCaptureReporterThrottleCapacity];

  v4 = [[BRCLRUDictionary alloc] initWithMaximumCapacity:v3];
  v5 = (void *)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle;
  captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle = (uint64_t)v4;
}

void __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_14_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    BOOL v6 = [NSNumber numberWithLongLong:brc_current_date_nsec()];
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA8C58]];
      id v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA8C60]];
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138413314;
      v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      v20 = v6;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ABC report got rejected - error code = %@, description = %@ adding throttle (%@, %@)%@", (uint8_t *)&v13, 0x34u);
    }
    v7 = (id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle;
    objc_sync_enter(v7);
    [(id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
    objc_sync_exit(v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 withContext:(id)a5
{
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5
{
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5 underlyingError:(id)a6
{
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5 underlyingError:(id)a6 waitForCompletion:(BOOL)a7
{
  BOOL v7 = a7;
  id v20 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = objc_msgSend(a5, "brc_telemetryReportableErrorWithRecordName:", 0);
  if (![(BRCAutoBugCaptureReporter *)self _shouldIgnoreReportForOperationType:v20 ofSubtype:v12 forError:v14])
  {
    __int16 v15 = NSString;
    uint64_t v16 = [v14 domain];
    __int16 v17 = [v15 stringWithFormat:@"%@.%ld", v16, objc_msgSend(v14, "code")];

    if (v13)
    {
      uint64_t v18 = [v13 domain];
      uint64_t v19 = [v17 stringByAppendingFormat:@".%@.%ld", v18, objc_msgSend(v13, "code")];

      __int16 v17 = (void *)v19;
    }
    [(BRCAutoBugCaptureReporter *)self captureLogsForOperationType:v20 ofSubtype:v12 withContext:v17 waitForCompletion:v7];
  }
}

- (BOOL)_shouldIgnoreReportForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v7 isEqualToString:@"SyncHealth"]
    || ([v8 isEqualToString:@"SyncUp"] & 1) == 0
    && ![v8 isEqualToString:@"SyncDown"]
    || ([v9 domain],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqualToString:*MEMORY[0x1E4F19C40]],
        v10,
        !v11))
  {
LABEL_9:
    if ([v7 isEqualToString:@"SyncHealth"]
      && [v8 isEqualToString:@"SyncDown"]
      && objc_msgSend(v9, "brc_isCloudKitErrorZoneMigrated"))
    {
      id v12 = +[BRCUserDefaults defaultsForMangledID:0];
      if ([v12 ignoreCKCZMigrationAlreadyDoneErrorForABC])
      {
        uint64_t v16 = brc_bread_crumbs();
        __int16 v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRCAutoBugCaptureReporter _shouldIgnoreReportForOperationType:ofSubtype:forError:](v9);
        }
        goto LABEL_22;
      }
    }
    if ([v7 isEqualToString:@"SyncHealth"]
      && [v8 isEqualToString:@"Upload"]
      && objc_msgSend(v9, "brc_isCloudKitMMCSItemNotAvailable"))
    {
      id v12 = +[BRCUserDefaults defaultsForMangledID:0];
      if ([v12 ignoreCKMMCSItemNotAvailableErrorForABC])
      {
        uint64_t v16 = brc_bread_crumbs();
        __int16 v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRCAutoBugCaptureReporter _shouldIgnoreReportForOperationType:ofSubtype:forError:](v9);
        }
        goto LABEL_22;
      }
    }
    BOOL v18 = 0;
    goto LABEL_25;
  }
  id v12 = +[BRCUserDefaults defaultsForMangledID:0];
  id v13 = [v12 ignoredCKErrorsForABC];
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "code"));
  int v15 = [v13 containsObject:v14];

  if (!v15)
  {

    goto LABEL_9;
  }
  uint64_t v16 = brc_bread_crumbs();
  __int16 v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[BRCAutoBugCaptureReporter _shouldIgnoreReportForOperationType:ofSubtype:forError:](v9);
  }
LABEL_22:

  BOOL v18 = 1;
LABEL_25:

  return v18;
}

void __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_14_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Sent ABC report successfully%@", (uint8_t *)&v2, 0xCu);
}

- (void)_shouldIgnoreReportForOperationType:(void *)a1 ofSubtype:forError:.cold.1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Ignoring expected CK error %ld%@", v3, v4, v5, v6, v7);
}

- (void)_shouldIgnoreReportForOperationType:(void *)a1 ofSubtype:forError:.cold.2(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Ignoring expected CK 'cross-zone migration already done' error %ld%@", v3, v4, v5, v6, v7);
}

- (void)_shouldIgnoreReportForOperationType:(void *)a1 ofSubtype:forError:.cold.3(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Ignoring CloudKit open error (Operation not permitted) protected class error %ld%@", v3, v4, v5, v6, v7);
}

@end