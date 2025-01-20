@interface HDAutoBugCaptureReporter
+ (void)reportNotFinalSeriesSampleWithClass:(Class)a3 count:(int64_t)a4 datumCount:(int64_t)a5 reason:(id)a6;
- (HDAutoBugCaptureReporter)initWithDaemon:(id)a3;
- (HDDaemon)daemon;
- (id)unitTesting_didReportHandler;
- (void)_reportSnapshotWithType:(void *)a3 subType:(void *)a4 context:(void *)a5 processIdentifier:(void *)a6 thresholdValues:;
- (void)reportApplyDataFailure:(Class)a3 duringSyncFromStore:(id)a4 error:(id)a5;
- (void)reportCorruptionForDatabase:(id)a3 resultCode:(int)a4;
- (void)reportDataCollectionSeriesProblem:(id)a3 quantityType:(id)a4;
- (void)reportDatabaseMigrationFailureWithContext:(id)a3;
- (void)reportJournalFailureWithErrorDescription:(id)a3 provenance:(id)a4 error:(id)a5;
- (void)reportMissingSource:(id)a3 duringSyncFromStore:(id)a4;
- (void)reportQueryDurationWithServer:(id)a3 dataCount:(int64_t)a4 duration:(double)a5;
- (void)reportSummarySharingInvitationFailureForOperation:(id)a3 error:(id)a4;
- (void)setUnitTesting_didReportHandler:(id)a3;
@end

@implementation HDAutoBugCaptureReporter

- (HDAutoBugCaptureReporter)initWithDaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDAutoBugCaptureReporter;
  v5 = [(HDAutoBugCaptureReporter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_daemon, v4);
  }

  return v6;
}

- (void)reportQueryDurationWithServer:(id)a3 dataCount:(int64_t)a4 duration:(double)a5
{
  objc_super v8 = NSString;
  id v9 = a3;
  objc_msgSend(v8, "stringWithFormat:", @"%lld,%lf", a4, *(void *)&a5);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v9 client];

  v13 = [v12 process];
  v14 = [v13 applicationIdentifier];
  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, @"HKQuery", @"Duration", v11, v14, v15);
}

- (void)_reportSnapshotWithType:(void *)a3 subType:(void *)a4 context:(void *)a5 processIdentifier:(void *)a6 thresholdValues:
{
  id v19 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    id v15 = _Block_copy(*(const void **)(a1 + 16));
    v16 = v15;
    if (v15)
    {
      (*((void (**)(void *, uint64_t, id, id, id, id, id))v15 + 2))(v15, a1, v19, v11, v12, v13, v14);
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
      v18 = [v17 signatureWithDomain:@"HealthKit" type:v19 subType:v11 subtypeContext:v12 detectedProcess:v13 triggerThresholdValues:v14];
      [v17 snapshotWithSignature:v18 duration:0 event:0 payload:&__block_literal_global_186 reply:0.0];
    }
  }
}

- (void)reportDatabaseMigrationFailureWithContext:(id)a3
{
}

- (void)reportCorruptionForDatabase:(id)a3 resultCode:(int)a4
{
  id v5 = [NSString stringWithFormat:@"%@-%d", a3, *(void *)&a4];
  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, @"HKDatabase", @"Corruption", v5, (void *)*MEMORY[0x1E4F2BE48], 0);
}

- (void)reportDataCollectionSeriesProblem:(id)a3 quantityType:(id)a4
{
  v6 = NSString;
  id v7 = a3;
  objc_super v8 = [a4 identifier];
  id v9 = [v6 stringWithFormat:@"%@-%@", v7, v8];

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, @"HKDataCollection", @"Series", v9, (void *)*MEMORY[0x1E4F2BE48], 0);
}

+ (void)reportNotFinalSeriesSampleWithClass:(Class)a3 count:(int64_t)a4 datumCount:(int64_t)a5 reason:(id)a6
{
  id v9 = a6;
  id v14 = objc_alloc_init(HDAutoBugCaptureReporter);
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld,%ld", a4, a5);
  id v11 = NSString;
  id v12 = NSStringFromClass(a3);
  id v13 = [v11 stringWithFormat:@"%@-%@", v12, v9];

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)v14, @"HKDatabase", @"Series", v13, (void *)*MEMORY[0x1E4F2BE48], v10);
}

- (void)reportSummarySharingInvitationFailureForOperation:(id)a3 error:(id)a4
{
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 domain];
  v10 = NSNumber;
  uint64_t v11 = [v7 code];

  id v12 = [v10 numberWithInteger:v11];
  id v13 = [v6 stringWithFormat:@"%@-%@-%@", v8, v9, v12];

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, @"HKSummarySharing", @"Invitation", v13, (void *)*MEMORY[0x1E4F2BE48], 0);
}

- (void)reportMissingSource:(id)a3 duringSyncFromStore:(id)a4
{
  id v11 = a4;
  v6 = NSString;
  id v7 = a3;
  if (v11) {
    [v6 stringWithFormat:@"%ld-%ld-%@", objc_msgSend(v11, "syncStoreType"), (int)objc_msgSend(v11, "protocolVersion"), v7];
  }
  else {
  id v8 = [v6 stringWithFormat:@"NoStore-%@", v7, v9, v10];
  }

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, @"HKSync", @"MissingSource", v8, (void *)*MEMORY[0x1E4F2BE48], 0);
}

- (void)reportApplyDataFailure:(Class)a3 duringSyncFromStore:(id)a4 error:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 domain];
  if ((![v9 isEqualToString:*MEMORY[0x1E4F65CA8]] || objc_msgSend(v8, "code") != 2)
    && (objc_msgSend(v8, "hk_isDuplicateObjectError") & 1) == 0
    && (objc_msgSend(v8, "hk_isTransactionInterruptedError") & 1) == 0
    && (objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 123) & 1) == 0)
  {
    char v10 = objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 100);

    if (v10) {
      goto LABEL_9;
    }
    id v11 = NSString;
    uint64_t v12 = [v17 syncStoreType];
    uint64_t v13 = (int)[v17 protocolVersion];
    id v14 = NSStringFromClass(a3);
    id v15 = [v8 domain];
    v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
    uint64_t v9 = [v11 stringWithFormat:@"%ld-%ld-%@ error: %@-%@", v12, v13, v14, v15, v16];

    -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, @"HKSync", @"ApplyDataFailure", v9, (void *)*MEMORY[0x1E4F2BE48], 0);
  }

LABEL_9:
}

- (void)reportJournalFailureWithErrorDescription:(id)a3 provenance:(id)a4 error:(id)a5
{
  id v17 = a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  char v10 = [v9 domain];
  if ((![v10 isEqualToString:*MEMORY[0x1E4F65CA8]] || objc_msgSend(v9, "code") != 2)
    && (objc_msgSend(v9, "hk_isTransactionInterruptedError") & 1) == 0)
  {
    char v11 = objc_msgSend(v9, "hk_isHealthKitErrorWithCode:", 123);

    if (v11) {
      goto LABEL_9;
    }
    uint64_t v12 = NSString;
    uint64_t v13 = [v9 domain];
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "code"));
    id v15 = (void *)v14;
    v16 = &stru_1F1728D60;
    if (v8) {
      v16 = v8;
    }
    char v10 = [v12 stringWithFormat:@"%@-%@-%@-%@", v17, v13, v14, v16];

    -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, @"HKDatabase", @"ApplyDataFailure", v10, (void *)*MEMORY[0x1E4F2BE48], 0);
  }

LABEL_9:
}

void __102__HDAutoBugCaptureReporter__reportSnapshotWithType_subType_context_processIdentifier_thresholdValues___block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v22[5] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C68]];
    _HKInitializeLogging();
    v6 = HKLogAnalytics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      *(void *)v22 = v5;
      id v7 = "Diagnostic reporter snapshot accepted with sessionID %@";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_17:
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v21, v9);
    }
  }
  else
  {
    char v10 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C58]];
    int v11 = [v10 intValue];

    id v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C60]];
    int v12 = *MEMORY[0x1E4FA8B68];
    int v13 = *MEMORY[0x1E4FA8B70];
    int v14 = *MEMORY[0x1E4FA8B60];
    int v15 = *MEMORY[0x1E4FA8B88];
    _HKInitializeLogging();
    v16 = HKLogAnalytics();
    v6 = v16;
    if (v12 == v11 || v13 == v11 || v14 == v11 || v15 == v11)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 67109378;
        v22[0] = v11;
        LOWORD(v22[1]) = 2112;
        *(void *)((char *)&v22[1] + 2) = v5;
        id v7 = "Diagnostic reporter snapshot rejected with expected reason %d (%@)";
        id v8 = v6;
        uint32_t v9 = 18;
        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 67109378;
      v22[0] = v11;
      LOWORD(v22[1]) = 2112;
      *(void *)((char *)&v22[1] + 2) = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Diagnostic reporter snapshot rejected with unexpected reason %d (%@)", (uint8_t *)&v21, 0x12u);
    }
  }
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (id)unitTesting_didReportHandler
{
  return self->_unitTesting_didReportHandler;
}

- (void)setUnitTesting_didReportHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didReportHandler, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end