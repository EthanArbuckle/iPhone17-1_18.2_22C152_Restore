@interface CDPDSecureBackupProxyImpl
- (BOOL)_createAndRegisterBackupPublicKeyInSOS:(id)a3 error:(id *)a4;
- (BOOL)disableWithInfo:(id)a3 error:(id *)a4;
- (BOOL)enableWithInfo:(id)a3 error:(id *)a4;
- (BOOL)isRecoveryKeySet:(id *)a3;
- (BOOL)removeRecoveryKeyFromSOS:(id *)a3;
- (BOOL)setRecoveryKeyInSOS:(id)a3 error:(id *)a4;
- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4;
- (CDPContext)cdpContext;
- (CDPDSecureBackupProxyImpl)initWithContext:(id)a3;
- (id)accountInfoWithInfo:(id)a3 error:(id *)a4;
- (id)activityTypeString;
- (id)recoverWithInfo:(id)a3 error:(id *)a4;
- (id)secureBackupContext;
- (id)secureBackupContextWithInfo:(id)a3;
- (void)_cleanUpPostEscrowCreationStates;
- (void)accountInfoWithInfo:(id)a3 completion:(id)a4;
- (void)cacheRecoveryKey:(id)a3 completionBlock:(id)a4;
- (void)enableWithInfo:(id)a3 completionBlock:(id)a4;
- (void)setCdpContext:(id)a3;
- (void)uncacheAllSecrets;
@end

@implementation CDPDSecureBackupProxyImpl

- (CDPDSecureBackupProxyImpl)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPDSecureBackupProxyImpl;
  v6 = [(CDPDSecureBackupProxyImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cdpContext, a3);
  }

  return v7;
}

- (id)secureBackupContext
{
  return [(CDPDSecureBackupProxyImpl *)self secureBackupContextWithInfo:MEMORY[0x263EFFA78]];
}

- (id)activityTypeString
{
  v3 = NSString;
  [(CDPContext *)self->_cdpContext type];
  v4 = CDPContextTypeAnalyticsString();
  int v5 = [(CDPContext *)self->_cdpContext endpoint];
  v6 = @"Unknown";
  if (v5 <= 266770438)
  {
    if (v5 > -754113827)
    {
      if (v5 > -344522787)
      {
        if (v5 > -61689622)
        {
          if (v5 == -61689621)
          {
            v6 = @"RecoverAndSynchronizeSquirrel";
          }
          else if (v5 == -45788238)
          {
            v6 = @"FinishOfflineLocalSecretChange";
          }
        }
        else if (v5 == -344522786)
        {
          v6 = @"AttemptToEscrowPreRecord";
        }
        else if (v5 == -275221680)
        {
          v6 = @"GenerateRandomRecoveryKey";
        }
      }
      else if (v5 > -569191000)
      {
        if (v5 == -569190999)
        {
          v6 = @"ClearFollowUp";
        }
        else if (v5 == -428461448)
        {
          v6 = @"RemoveNonViewAwarePeersFromCircle";
        }
      }
      else if (v5 == -754113826)
      {
        v6 = @"WalrusStatus";
      }
      else if (v5 == -617686711)
      {
        v6 = @"SaveTermsAcceptance";
      }
    }
    else if (v5 > -1249140061)
    {
      if (v5 > -993238036)
      {
        if (v5 == -993238035)
        {
          v6 = @"GenerateNewRecoveryKey";
        }
        else if (v5 == -936527855)
        {
          v6 = @"IsUserVisibleKeychainSyncEnabled";
        }
      }
      else if (v5 == -1249140060)
      {
        v6 = @"PostFollowUp";
      }
      else if (v5 == -1152544766)
      {
        v6 = @"HandleCloudDataProtectionState";
      }
    }
    else if (v5 > -1589433122)
    {
      if (v5 == -1589433121)
      {
        v6 = @"PerformRecovery";
      }
      else if (v5 == -1280150785)
      {
        v6 = @"IsICDPEnabledForDSID";
      }
    }
    else if (v5 == -1748609038)
    {
      v6 = @"BroadcastWalrusStateChange";
    }
    else if (v5 == -1737446029)
    {
      v6 = @"UpdateWebAccessStatus";
    }
  }
  else if (v5 <= 1512741305)
  {
    if (v5 > 819347452)
    {
      if (v5 > 1288689616)
      {
        if (v5 == 1288689617)
        {
          v6 = @"FetchEscrowRecordDevices";
        }
        else if (v5 == 1504201822)
        {
          v6 = @"WebAccessStatus";
        }
      }
      else if (v5 == 819347453)
      {
        v6 = @"FetchTermsAcceptanceForAccount";
      }
      else if (v5 == 844041777)
      {
        v6 = @"RepairCloudDataProtectionState";
      }
    }
    else if (v5 > 546710379)
    {
      if (v5 == 546710380)
      {
        v6 = @"ShouldPerformRepairForContext";
      }
      else if (v5 == 581976373)
      {
        v6 = @"SetUserVisibleKeychainSyncEnabled";
      }
    }
    else if (v5 == 266770439)
    {
      v6 = @"IsRecoveryKeyAvailable";
    }
    else if (v5 == 540884795)
    {
      v6 = @"HasLocalSecret";
    }
  }
  else if (v5 <= 1956379799)
  {
    if (v5 > 1660047999)
    {
      if (v5 == 1660048000)
      {
        v6 = @"VerifyRecoveryKey";
      }
      else if (v5 == 1888483151)
      {
        v6 = @"DeviceEscrowRecordRecoverable";
      }
    }
    else if (v5 == 1512741306)
    {
      v6 = @"DeleteRecoveryKey";
    }
    else if (v5 == 1547867365)
    {
      v6 = @"UpdateWalrusStatus";
    }
  }
  else if (v5 <= 1996176789)
  {
    if (v5 == 1956379800)
    {
      v6 = @"PcsKeysForServices";
    }
    else if (v5 == 1979543336)
    {
      v6 = @"FinishCyrusFlowAfterTermsAgreement";
    }
  }
  else
  {
    switch(v5)
    {
      case 1996176790:
        v6 = @"LocalSecretChangedTo";
        break;
      case 2013313151:
        v6 = @"RecoverSquirrel";
        break;
      case 2121843186:
        v6 = @"StartCircleApplicationApprovalServer";
        break;
    }
  }
  int v7 = [(CDPContext *)self->_cdpContext backupActivity];
  v8 = @"Unknown";
  if (v7 <= -189876308)
  {
    if (v7 <= -1236246174)
    {
      if (v7 > -1686228710)
      {
        if (v7 == -1686228709)
        {
          v8 = @"CheckAndRemoveExistingThenEnableSecureBackupRecord";
        }
        else if (v7 == -1385651654)
        {
          v8 = @"IsEligibleForCDP";
        }
      }
      else if (v7 == -2145163342)
      {
        v8 = @"PerformEscrowRecoveryWithRecoveryContext";
      }
      else if (v7 == -2040123582)
      {
        v8 = @"BackupRecordsArePresent";
      }
    }
    else if (v7 <= -486826559)
    {
      if (v7 == -1236246173)
      {
        v8 = @"DisableRecoveryKey";
      }
      else if (v7 == -671128312)
      {
        v8 = @"SupportsRecoveryKey";
      }
    }
    else
    {
      switch(v7)
      {
        case -486826558:
          v8 = @"EnableSecureBackup";
          break;
        case -475716065:
          v8 = @"ClearAccountInfoCache";
          break;
        case -417863379:
          v8 = @"RecoverSecureBackup";
          break;
      }
    }
  }
  else if (v7 > 1142884429)
  {
    if (v7 <= 1412515334)
    {
      if (v7 == 1142884430)
      {
        v8 = @"DisableSecureBackup";
      }
      else if (v7 == 1401497941)
      {
        v8 = @"EnableSecureBackupWithRecoveryKey";
      }
    }
    else
    {
      switch(v7)
      {
        case 1412515335:
          v8 = @"CheckForExistingRecordWithPeerId";
          break;
        case 1808484763:
          v8 = @"UncacheAllSecrets";
          break;
        case 1846835407:
          v8 = @"CheckForExistingRecordMatchingPredicate";
          break;
      }
    }
  }
  else if (v7 <= -61353304)
  {
    if (v7 == -189876307)
    {
      v8 = @"UpgradeICSCRecordsThenEnableSecureBackup";
    }
    else if (v7 == -186675152)
    {
      v8 = @"DeleteAllBackupRecords";
    }
  }
  else
  {
    switch(v7)
    {
      case -61353303:
        v8 = @"SynchronizeKeyValueStore";
        break;
      case 407282594:
        v8 = @"CheckForExistingRecord";
        break;
      case 707469235:
        v8 = @"GetBackupRecordDevicesWithOptionForceFetch";
        break;
    }
  }
  objc_super v9 = [v3 stringWithFormat:@"type=%@ endpoint=%@; backupActivity=%@", v4, v6, v8];;

  return v9;
}

- (id)secureBackupContextWithInfo:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F32998];
  id v5 = a3;
  id v6 = [v4 alloc];
  int v7 = [(CDPDSecureBackupProxyImpl *)self activityTypeString];
  v8 = (void *)[v6 initWithUserActivityLabel:v7];

  [v8 populateWithInfo:v5];
  return v8;
}

- (void)accountInfoWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = _CDPSignpostCreate();
  uint64_t v11 = v10;

  v12 = _CDPSignpostLogSystem();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AccountInfoWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v24 = v9;
    _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AccountInfoWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  v15 = [(CDPDSecureBackupProxyImpl *)self secureBackupContextWithInfo:v7];

  v16 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  cdpContext = self->_cdpContext;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke;
  v19[3] = &unk_26432F810;
  os_signpost_id_t v21 = v9;
  uint64_t v22 = v11;
  id v20 = v6;
  id v18 = v6;
  [(CDPExponentialRetryScheduler *)v16 retryFetchAccountInfo:v15 cdpContext:cdpContext completionHandler:v19];
}

void __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_2();
  }

  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  os_signpost_id_t v9 = _CDPSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v20 = 67240192;
    LODWORD(v21) = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_218640000, v10, OS_SIGNPOST_INTERVAL_END, v11, "AccountInfoWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v20, 8u);
  }

  v12 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = [v6 code];
    int v20 = 134218496;
    uint64_t v21 = v14;
    __int16 v22 = 2048;
    double v23 = v13;
    __int16 v24 = 1026;
    int v25 = v15;
    _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountInfoWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  if (!v5 || v6)
  {
    id v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_1();
    }

    uint64_t v19 = *(void *)(a1 + 32);
    if (v19)
    {
      v17 = *(void (**)(void))(v19 + 16);
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16)
    {
      v17 = *(void (**)(void))(v16 + 16);
LABEL_16:
      v17();
    }
  }
}

- (id)accountInfoWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate();

  os_signpost_id_t v9 = _CDPSignpostLogSystem();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AccountInfoWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v24 = v8;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AccountInfoWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  v12 = [(CDPDSecureBackupProxyImpl *)self secureBackupContextWithInfo:v6];

  id v22 = 0;
  double v13 = [v12 getAccountInfoWithError:&v22];
  id v14 = v22;

  if (a4) {
    *a4 = v14;
  }
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  uint64_t v16 = _CDPSignpostLogSystem();
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v18 = [v14 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v24) = v18;
    _os_signpost_emit_with_name_impl(&dword_218640000, v17, OS_SIGNPOST_INTERVAL_END, v8, "AccountInfoWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", buf, 8u);
  }

  uint64_t v19 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [v14 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v24 = v8;
    __int16 v25 = 2048;
    double v26 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v27 = 1026;
    int v28 = v20;
    _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountInfoWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", buf, 0x1Cu);
  }

  return v13;
}

- (void)enableWithInfo:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = _CDPSignpostLogSystem();
  os_signpost_id_t v9 = _CDPSignpostCreate();
  uint64_t v11 = v10;

  v12 = _CDPSignpostLogSystem();
  double v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnableBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  id v14 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v27 = v9;
    _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EnableBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  int v20 = __60__CDPDSecureBackupProxyImpl_enableWithInfo_completionBlock___block_invoke;
  uint64_t v21 = &unk_26432F838;
  os_signpost_id_t v24 = v9;
  uint64_t v25 = v11;
  id v22 = self;
  id v23 = v6;
  id v15 = v6;
  uint64_t v16 = _Block_copy(&v18);
  v17 = -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", v7, v18, v19, v20, v21, v22);

  [v17 enableWithCompletionBlock:v16];
}

void __60__CDPDSecureBackupProxyImpl_enableWithInfo_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3) {
    [*(id *)(a1 + 32) _cleanUpPostEscrowCreationStates];
  }
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  id v5 = _CDPSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v12 = 67240192;
    LODWORD(v13) = [v3 code];
    _os_signpost_emit_with_name_impl(&dword_218640000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EnableBackupWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v12, 8u);
  }

  os_signpost_id_t v8 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = [v3 code];
    int v12 = 134218496;
    uint64_t v13 = v10;
    __int16 v14 = 2048;
    double v15 = v9;
    __int16 v16 = 1026;
    int v17 = v11;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EnableBackupWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)enableWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_signpost_id_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F32A80]];
  if (v7)
  {

    uint64_t v8 = *MEMORY[0x263F32AD8];
    goto LABEL_4;
  }
  uint64_t v8 = *MEMORY[0x263F32AD8];
  double v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F32AD8]];

  if (v9)
  {
LABEL_4:
    uint64_t v10 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34608] category:*MEMORY[0x263F34830]];
    int v11 = [v6 objectForKeyedSubscript:v8];

    if (v11) {
      [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34510]];
    }
    goto LABEL_6;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F32A98]];

  if (v10)
  {
    uint64_t v10 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F346A8] category:*MEMORY[0x263F34830]];
  }
LABEL_6:
  int v12 = _CDPSignpostLogSystem();
  os_signpost_id_t v13 = _CDPSignpostCreate();

  __int16 v14 = _CDPSignpostLogSystem();
  double v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EnableBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  __int16 v16 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v33 = v13;
    _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EnableBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  int v17 = [(CDPDSecureBackupProxyImpl *)self secureBackupContextWithInfo:v6];
  id v31 = 0;
  uint64_t v18 = [v17 enableWithError:&v31];
  id v19 = v31;

  if (a4) {
    *a4 = v19;
  }
  int v20 = _CDPLogSystem();
  uint64_t v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupProxyImpl enableWithInfo:error:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, "SecureBackup enabled", buf, 2u);
    }

    [(CDPDSecureBackupProxyImpl *)self _cleanUpPostEscrowCreationStates];
  }
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  id v23 = _CDPSignpostLogSystem();
  os_signpost_id_t v24 = v23;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    int v25 = [v19 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v33) = v25;
    _os_signpost_emit_with_name_impl(&dword_218640000, v24, OS_SIGNPOST_INTERVAL_END, v13, "EnableBackupWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", buf, 8u);
  }

  double v26 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = [v19 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v33 = v13;
    __int16 v34 = 2048;
    double v35 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v36 = 1026;
    int v37 = v27;
    _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EnableBackupWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", buf, 0x1Cu);
  }

  uint64_t v28 = [NSNumber numberWithBool:v18];
  [v10 setObject:v28 forKeyedSubscript:*MEMORY[0x263F34558]];

  if (v19) {
    [v10 populateUnderlyingErrorsStartingWithRootError:v19];
  }
  uint64_t v29 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v29 sendEvent:v10];

  return v18;
}

- (id)recoverWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_signpost_id_t v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate();

  double v9 = _CDPSignpostLogSystem();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecoverBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  int v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v24 = v8;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  int v12 = [(CDPDSecureBackupProxyImpl *)self secureBackupContextWithInfo:v6];

  id v22 = 0;
  os_signpost_id_t v13 = [v12 recoverWithError:&v22];
  id v14 = v22;

  if (a4) {
    *a4 = v14;
  }
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  __int16 v16 = _CDPSignpostLogSystem();
  int v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v18 = [v14 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v24) = v18;
    _os_signpost_emit_with_name_impl(&dword_218640000, v17, OS_SIGNPOST_INTERVAL_END, v8, "RecoverBackupWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", buf, 8u);
  }

  id v19 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [v14 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v24 = v8;
    __int16 v25 = 2048;
    double v26 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v27 = 1026;
    int v28 = v20;
    _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverBackupWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", buf, 0x1Cu);
  }

  return v13;
}

- (BOOL)disableWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_signpost_id_t v7 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34618] category:*MEMORY[0x263F34830]];
  os_signpost_id_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F32B10]];

  if (v8) {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34620]];
  }
  double v9 = (void *)[v6 mutableCopy];
  uint64_t v10 = [(CDPContext *)self->_cdpContext telemetryFlowID];

  if (v10)
  {
    int v11 = [(CDPContext *)self->_cdpContext telemetryFlowID];
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F32A48]];
  }
  int v12 = [(CDPContext *)self->_cdpContext telemetryDeviceSessionID];

  if (v12)
  {
    os_signpost_id_t v13 = [(CDPContext *)self->_cdpContext telemetryDeviceSessionID];
    [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x263F32A08]];
  }
  id v14 = _CDPSignpostLogSystem();
  os_signpost_id_t v15 = _CDPSignpostCreate();

  __int16 v16 = _CDPSignpostLogSystem();
  int v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "DisableBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  int v18 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v35 = v15;
    _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisableBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  id v19 = [(CDPDSecureBackupProxyImpl *)self secureBackupContextWithInfo:v9];
  id v33 = 0;
  uint64_t v20 = [v19 disableWithError:&v33];
  id v21 = v33;

  if (a4) {
    *a4 = v21;
  }
  id v22 = _CDPLogSystem();
  id v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupProxyImpl disableWithInfo:error:]();
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[CDPDSecureBackupProxyImpl disableWithInfo:error:]();
  }

  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  __int16 v25 = _CDPSignpostLogSystem();
  double v26 = v25;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    int v27 = [v21 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v35) = v27;
    _os_signpost_emit_with_name_impl(&dword_218640000, v26, OS_SIGNPOST_INTERVAL_END, v15, "DisableBackupWithInfo", " enableError=%{public,signpost.telemetry:number1,name=enableError}d ", buf, 8u);
  }

  int v28 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = [v21 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v35 = v15;
    __int16 v36 = 2048;
    double v37 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v38 = 1026;
    int v39 = v29;
    _os_log_impl(&dword_218640000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisableBackupWithInfo  enableError=%{public,signpost.telemetry:number1,name=enableError}d ", buf, 0x1Cu);
  }

  v30 = [NSNumber numberWithBool:v20];
  [v7 setObject:v30 forKeyedSubscript:*MEMORY[0x263F34558]];

  if (v21) {
    [v7 populateUnderlyingErrorsStartingWithRootError:v21];
  }
  id v31 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v31 sendEvent:v7];

  return v20;
}

- (void)cacheRecoveryKey:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupProxyImpl cacheRecoveryKey:completionBlock:]();
  }

  uint64_t v14 = 0;
  os_signpost_id_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__3;
  int v18 = __Block_byref_object_dispose__3;
  id v19 = [(CDPDSecureBackupProxyImpl *)self secureBackupContext];
  [(id)v15[5] setRecoveryKey:v6];
  double v9 = (void *)v15[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke;
  v11[3] = &unk_26432F860;
  id v10 = v7;
  id v12 = v10;
  os_signpost_id_t v13 = &v14;
  [v9 cacheRecoveryKeyWithCompletionBlock:v11];

  _Block_object_dispose(&v14, 8);
}

void __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _CDPLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_1();
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)uncacheAllSecrets
{
  id v2 = [(CDPDSecureBackupProxyImpl *)self secureBackupContext];
  [v2 uncachePassphrase];
}

- (void)_cleanUpPostEscrowCreationStates
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Saving account failed with error: %@", v2, v3, v4, v5, v6);
}

- (BOOL)isRecoveryKeySet:(id *)a3
{
  uint64_t v4 = [(CDPContext *)self->_cdpContext cliqueConfiguration];
  id v9 = 0;
  char v5 = [MEMORY[0x263F16D30] isRecoveryKeySetInSOS:v4 error:&v9];
  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupProxyImpl isRecoveryKeySet:]();
    }

    char v5 = 0;
    if (a3) {
      *a3 = v6;
    }
  }

  return v5;
}

- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CDPDSecureBackupProxyImpl *)self secureBackupContext];
  id v12 = 0;
  char v8 = [v7 verifyRecoveryKey:v6 error:&v12];

  id v9 = v12;
  if (v9)
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupProxyImpl verifyRecoveryKey:error:]();
    }

    char v8 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

- (BOOL)setRecoveryKeyInSOS:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v29 = 0;
  uint64_t v7 = SOSCCCopyMyPeerInfo();
  if (!v7)
  {
    uint64_t v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:]();
    }

    if (a4)
    {
      BOOL v11 = 0;
      *a4 = v29;
      goto LABEL_40;
    }
    goto LABEL_37;
  }
  char v8 = (const void *)v7;
  id v9 = (const void *)SOSPeerInfoCopyBackupKey();
  if (!v9)
  {
    id v28 = 0;
    os_signpost_id_t v15 = SecPasswordGenerate();
    if (v15)
    {
      id v10 = v15;
      uint64_t v16 = [v15 dataUsingEncoding:4];
      id v27 = 0;
      int v17 = (const void *)SOSCCCopyMyPeerWithNewDeviceRecoverySecret();
      int v18 = _CDPLogSystem();
      id v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.6();
        }

        CFRelease(v17);
        goto LABEL_5;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:]();
      }

      if (a4) {
        *a4 = v27;
      }
      if (v27) {
        CFRelease(v27);
      }
    }
    else
    {
      os_signpost_id_t v24 = _CDPLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:]();
      }

      if (a4) {
        *a4 = v28;
      }
    }
LABEL_37:
    BOOL v11 = 0;
    goto LABEL_40;
  }
  CFRelease(v9);
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.7();
  }
LABEL_5:

  CFRelease(v8);
  id v26 = 0;
  BOOL v11 = [(CDPDSecureBackupProxyImpl *)self _createAndRegisterBackupPublicKeyInSOS:v6 error:&v26];
  id v12 = v26;
  os_signpost_id_t v13 = v12;
  if (v12)
  {
    BOOL v11 = 0;
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    uint64_t v20 = [(CDPDSecureBackupProxyImpl *)self secureBackupContext];
    id v21 = [v20 backupForRecoveryKeyWithInfo:0];

    id v22 = _CDPLogSystem();
    id v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.5();
      }

      BOOL v11 = 0;
      if (a4) {
        *a4 = v21;
      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.4();
      }
    }
  }

LABEL_40:
  return v11;
}

- (BOOL)_createAndRegisterBackupPublicKeyInSOS:(id)a3 error:(id *)a4
{
  char v5 = SecRKCreateRecoveryKeyWithError();
  id v6 = 0;
  if (v6)
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupProxyImpl _createAndRegisterBackupPublicKeyInSOS:error:]();
    }

    char v8 = 0;
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    char v8 = SecRKRegisterBackupPublicKey();
  }

  return v8;
}

- (BOOL)removeRecoveryKeyFromSOS:(id *)a3
{
  return SOSCCRegisterRecoveryPublicKey();
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void)setCdpContext:(id)a3
{
}

- (void).cxx_destruct
{
}

void __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Fetched account info error: %@", v2, v3, v4, v5, v6);
}

void __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Fetched account info: %@", v1, 0xCu);
}

- (void)enableWithInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to enable SecureBackup: %@", v2, v3, v4, v5, v6);
}

- (void)disableWithInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Disabled SecureBackup!", v2, v3, v4, v5, v6);
}

- (void)disableWithInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to disable SecureBackup with error %@", v2, v3, v4, v5, v6);
}

- (void)cacheRecoveryKey:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Attempting to update recovery key cache...", v2, v3, v4, v5, v6);
}

void __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Recovery key cache updated", v2, v3, v4, v5, v6);
}

void __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to cache recovery key with error: %@", v2, v3, v4, v5, v6);
}

- (void)isRecoveryKeySet:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Received error while checking if RK is set in SOS: %{public}@", v2, v3, v4, v5, v6);
}

- (void)verifyRecoveryKey:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to verify recovery key with error %@", v2, v3, v4, v5, v6);
}

- (void)setRecoveryKeyInSOS:error:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SOSCCCopyMyPeerInfo() failed: %@", v2, v3, v4, v5, v6);
}

- (void)setRecoveryKeyInSOS:error:.cold.2()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SecPasswordGenerate() failed: %@", v2, v3, v4, v5, v6);
}

- (void)setRecoveryKeyInSOS:error:.cold.3()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed: %@", v2, v3, v4, v5, v6);
}

- (void)setRecoveryKeyInSOS:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "successfully created a backup for recovery key", v2, v3, v4, v5, v6);
}

- (void)setRecoveryKeyInSOS:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "failed to perform backup: %@", v2, v3, v4, v5, v6);
}

- (void)setRecoveryKeyInSOS:error:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "registered backup key", v2, v3, v4, v5, v6);
}

- (void)setRecoveryKeyInSOS:error:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "backup key already registered", v2, v3, v4, v5, v6);
}

- (void)_createAndRegisterBackupPublicKeyInSOS:error:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to register RK into SOS: %@", v2, v3, v4, v5, v6);
}

- (void)_createAndRegisterBackupPublicKeyInSOS:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to create SOS RK for copying RK into SOS with error %@", v2, v3, v4, v5, v6);
}

- (void)removeRecoveryKeyFromSOS:.cold.1()
{
  OUTLINED_FUNCTION_5_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to remove RK from SOS: %@", v2, v3, v4, v5, v6);
}

@end