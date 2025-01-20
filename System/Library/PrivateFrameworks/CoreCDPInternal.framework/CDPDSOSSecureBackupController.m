@interface CDPDSOSSecureBackupController
+ (id)_sanitizedInfoDictionary:(id)a3;
- (BOOL)_shouldUseSBDCacheWithSecureBackupContext:(id)a3 fallbackState:(unint64_t)a4;
- (BOOL)fakeNearlyDepletedRecords;
- (CDPContext)context;
- (CDPDSOSSecureBackupController)initWithContext:(id)a3 uiProvider:(id)a4 delegate:(id)a5;
- (CDPDSecureBackupConfiguration)configuration;
- (CDPDSecureBackupDelegate)delegate;
- (CDPDSecureBackupProxy)secureBackupProxy;
- (CDPStateUIProviderInternal)uiProvider;
- (NSDictionary)cachedAccountInfo;
- (id)_clientMetadataWithSecretType:(unint64_t)a3 length:(unint64_t)a4;
- (id)_dateWithSecureBackupDateString:(id)a3;
- (id)_recoverBackupDictionaryWithContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5;
- (id)_recoveryInfoDictionaryFromContext:(id)a3 usePreviouslyCachedSecret:(BOOL)a4;
- (void)_accountInfoWithCompletion:(id)a3;
- (void)_getBackupRecordDevicesIncludingUnrecoverableRecords:(BOOL)a3 completion:(id)a4;
- (void)accountInfoWithCompletion:(id)a3;
- (void)backupRecordsArePresentWithCompletion:(id)a3;
- (void)checkForExistingRecord:(id)a3;
- (void)checkForExistingRecordMatchingPredicate:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)checkForExistingRecordWithPeerId:(id)a3 completion:(id)a4;
- (void)clearAccountInfoCache;
- (void)getBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)isEligibleForCDPWithCompletion:(id)a3;
- (void)recoverSecureBackupWithContext:(id)a3 completion:(id)a4;
- (void)setCachedAccountInfo:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFakeNearlyDepletedRecords:(BOOL)a3;
- (void)setSecureBackupProxy:(id)a3;
- (void)synchronizeKeyValueStoreWithCompletion:(id)a3;
@end

@implementation CDPDSOSSecureBackupController

- (CDPDSOSSecureBackupController)initWithContext:(id)a3 uiProvider:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CDPDSOSSecureBackupController;
  v12 = [(CDPDSOSSecureBackupController *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_uiProvider, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = [[CDPDSecureBackupProxyImpl alloc] initWithContext:v9];
    secureBackupProxy = v13->_secureBackupProxy;
    v13->_secureBackupProxy = (CDPDSecureBackupProxy *)v14;

    uint64_t v16 = +[CDPDSecureBackupConfiguration configurationWithContext:v9];
    configuration = v13->_configuration;
    v13->_configuration = (CDPDSecureBackupConfiguration *)v16;
  }
  return v13;
}

- (void)synchronizeKeyValueStoreWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CDPDSOSSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke;
  v6[3] = &unk_26432F1E0;
  id v7 = v4;
  id v5 = v4;
  [(CDPDSOSSecureBackupController *)self accountInfoWithCompletion:v6];
}

uint64_t __72__CDPDSOSSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)accountInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  if (self->_cachedAccountInfo)
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSOSSecureBackupController accountInfoWithCompletion:]();
    }

    if (v5) {
      ((void (**)(void, NSDictionary *, void))v5)[2](v5, self->_cachedAccountInfo, 0);
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke;
    v7[3] = &unk_26432EE88;
    v7[4] = self;
    id v8 = v4;
    [(CDPDSOSSecureBackupController *)self _accountInfoWithCompletion:v7];
  }
}

void __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1();
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, *(void *)(*(void *)(a1 + 32) + 40), v7);
  }
}

- (void)clearAccountInfoCache
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_218640000, v3, OS_LOG_TYPE_DEFAULT, "Clearing account cache...", v5, 2u);
  }

  cachedAccountInfo = self->_cachedAccountInfo;
  self->_cachedAccountInfo = 0;
}

- (void)_accountInfoWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_218640000, "cdp: Fetching Account Info", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  id v6 = [(CDPDSecureBackupConfiguration *)self->_configuration accountInfoFetchSetupDictionary];
  id v7 = (void *)[v6 mutableCopy];

  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F32AB0]];
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = +[CDPDSOSSecureBackupController _sanitizedInfoDictionary:v7];
    [(CDPDSOSSecureBackupController *)v9 _accountInfoWithCompletion:v8];
  }

  [(CDPDSecureBackupProxy *)self->_secureBackupProxy accountInfoWithInfo:v7 completion:v4];
  os_activity_scope_leave(&v10);
}

- (void)isEligibleForCDPWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void *))a3;
  if (v3)
  {
    id v7 = v3;
    id v4 = [MEMORY[0x263F343A8] sharedInstance];
    uint64_t v5 = [v4 hasLocalSecret];

    if (v5)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = _CDPStateError();
    }
    v7[2](v7, v5, v6);

    v3 = v7;
  }
}

- (void)backupRecordsArePresentWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke;
  v6[3] = &unk_26432F1E0;
  id v7 = v4;
  id v5 = v4;
  [(CDPDSOSSecureBackupController *)self accountInfoWithCompletion:v6];
}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_3();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      os_activity_scope_state_s v10 = *(void (**)(void))(v9 + 16);
LABEL_12:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_2();
    }

    id v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F32A68]];
    uint64_t v12 = [v11 count];

    v13 = [v5 objectForKeyedSubscript:*MEMORY[0x263F32B08]];
    uint64_t v14 = [v13 count];

    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_1(v12 != 0, v14 != 0, v15);
    }

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16)
    {
      os_activity_scope_state_s v10 = *(void (**)(void))(v16 + 16);
      goto LABEL_12;
    }
  }
}

- (void)getBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
}

- (void)_getBackupRecordDevicesIncludingUnrecoverableRecords:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "getBackupRecordDevicesWithCompletion: called, fetching account info from SecureBackup", buf, 2u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke;
  v8[3] = &unk_26432EE88;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(CDPDSOSSecureBackupController *)self accountInfoWithCompletion:v8];
}

void __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke_cold_1();
    }
  }
  v49 = objc_msgSend(MEMORY[0x263EFF980], "array", v5);
  int v7 = [*(id *)(*(void *)(a1 + 32) + 16) desiresAllRecords];
  id v8 = (void *)MEMORY[0x263F329B8];
  if (!v7) {
    id v8 = (void *)MEMORY[0x263F32B08];
  }
  v48 = v4;
  [v4 objectForKeyedSubscript:*v8];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (!v9)
  {
    id v11 = 0;
    goto LABEL_41;
  }
  uint64_t v10 = v9;
  id v11 = 0;
  uint64_t v51 = *(void *)v55;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v55 != v51) {
        objc_enumerationMutation(obj);
      }
      uint64_t v53 = v12;
      v13 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F34368]) initWithSecureBackupRecordInfo:v13];
      v15 = v14;
      if ([*(id *)(a1 + 32) fakeNearlyDepletedRecords])
      {
        uint64_t v16 = _CDPLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = (uint64_t)v15;
          _os_log_debug_impl(&dword_218640000, v16, OS_LOG_TYPE_DEBUG, "**** DEBUG **** Setting fake remaining attempts value of 1 for %@", buf, 0xCu);
        }

        uint64_t v14 = v15;
        [v15 setRemainingAttempts:1];
      }
      if (v14)
      {
        if ([v14 remainingAttempts])
        {
          [v49 addObject:v14];
        }
        else if (![v14 remainingAttempts])
        {
          v17 = _CDPLogSystem();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [v15 remainingAttempts];
            *(_DWORD *)buf = 138412546;
            uint64_t v59 = (uint64_t)v15;
            __int16 v60 = 2048;
            uint64_t v61 = v18;
            _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Disqualified device %@ because the remaining attempts is %lu", buf, 0x16u);
          }
        }
      }
      objc_super v19 = [v13 objectForKeyedSubscript:@"metadata"];
      v20 = [v19 objectForKeyedSubscript:@"ClientMetadata"];
      v21 = [v20 objectForKeyedSubscript:@"SecureBackupMetadataTimestamp"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = v21;
        id v23 = [*(id *)(a1 + 32) _dateWithSecureBackupDateString:v21];
LABEL_27:
        v24 = v23;
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = v21;
        id v23 = v21;
        goto LABEL_27;
      }
      v22 = v21;
      v24 = 0;
LABEL_29:
      [v15 setRecordDate:v24];
      v25 = _CDPLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        uint64_t v59 = (uint64_t)v15;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v24;
        __int16 v62 = 2112;
        v63 = v26;
        id v27 = v26;
        _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "Backup record found for device %@ with date %@ (%@)", buf, 0x20u);
      }
      if (!v11
        || v24
        && ([v11 laterDate:v24],
            v28 = objc_claimAutoreleasedReturnValue(),
            v28,
            v28 == v24))
      {
        v29 = _CDPLogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v59 = (uint64_t)v24;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v11;
          __int16 v62 = 2112;
          v63 = v15;
          _os_log_impl(&dword_218640000, v29, OS_LOG_TYPE_DEFAULT, "Backup record date %@ is later than the previously known newest record (%@), promoting %@ as newest device record", buf, 0x20u);
        }

        id v30 = v24;
        id v11 = v30;
      }

      uint64_t v12 = v53 + 1;
    }
    while (v10 != v53 + 1);
    uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  }
  while (v10);
LABEL_41:

  v31 = _CDPLogSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v59 = (uint64_t)v11;
    _os_log_impl(&dword_218640000, v31, OS_LOG_TYPE_DEFAULT, "Finished parsing multiple-iCSC records and found the newest record to be %@", buf, 0xCu);
  }

  v32 = v49;
  v33 = v47;
  v34 = v48;
  if ([v49 count])
  {
    BOOL v35 = 1;
  }
  else
  {
    uint64_t v36 = *MEMORY[0x263F32A68];
    v37 = [v48 objectForKeyedSubscript:*MEMORY[0x263F32A68]];
    BOOL v35 = v37 == 0;
    if (v37)
    {
      v38 = [v48 objectForKeyedSubscript:v36];
      v39 = _CDPLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = (uint64_t)v38;
        _os_log_impl(&dword_218640000, v39, OS_LOG_TYPE_DEFAULT, "Found a single-iCSC metadata record. Returning that as a faux-device using %@", buf, 0xCu);
      }

      v40 = (void *)[objc_alloc(MEMORY[0x263F34368]) initWithSecureBackupMetadataInfo:v38];
      v41 = [v48 objectForKeyedSubscript:*MEMORY[0x263F32AF8]];
      objc_msgSend(v40, "setHasRandomSecret:", objc_msgSend(v41, "BOOLValue"));

      v34 = v48;
      [v49 removeAllObjects];
      [v49 addObject:v40];

      v33 = v47;
    }
    else
    {
      v38 = _CDPLogSystem();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v38, OS_LOG_TYPE_DEFAULT, "No single-iCSC metadata record is present", buf, 2u);
      }
    }

    v32 = v49;
  }
  v42 = _CDPLogSystem();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = [v32 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v59 = v43;
    __int16 v60 = 1024;
    LODWORD(v61) = v35;
    _os_log_impl(&dword_218640000, v42, OS_LOG_TYPE_DEFAULT, "Finished parsing backup records, returning %lu devices and isUsingMultipleICSC=%i", buf, 0x12u);
  }

  if (*(void *)(a1 + 40))
  {
    v44 = [v32 sortedArrayUsingComparator:&__block_literal_global_0];
    uint64_t v45 = *(void *)(a1 + 40);
    v46 = (void *)[v44 copy];
    (*(void (**)(uint64_t, BOOL, void *, void *))(v45 + 16))(v45, v35, v46, v33);

    v32 = v49;
  }
}

uint64_t __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 recordDate];
  id v6 = [v4 recordDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_dateWithSecureBackupDateString:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  [v4 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
  id v6 = [v4 dateFromString:v3];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [v4 setTimeZone:v9];

    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v8 = [v4 dateFromString:v3];
  }
  uint64_t v10 = v8;

  return v10;
}

- (void)checkForExistingRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPDSOSSecureBackupController *)self delegate];
  id v6 = [v5 circlePeerIDForSecureBackupController:self];

  [(CDPDSOSSecureBackupController *)self checkForExistingRecordWithPeerId:v6 completion:v4];
}

- (void)checkForExistingRecordWithPeerId:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Checking if the peer has a secure backup: %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__CDPDSOSSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke;
  v12[3] = &unk_26432F228;
  id v13 = v6;
  id v10 = v6;
  id v11 = [v9 predicateWithBlock:v12];
  [(CDPDSOSSecureBackupController *)self checkForExistingRecordMatchingPredicate:v11 forceFetch:1 completion:v7];
}

uint64_t __77__CDPDSOSSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)checkForExistingRecordMatchingPredicate:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSOSSecureBackupController checkForExistingRecordMatchingPredicate:forceFetch:completion:]();
  }

  if (v9)
  {
    if (v8)
    {
      if (v6) {
        [(CDPDSOSSecureBackupController *)self clearAccountInfoCache];
      }
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke;
      v11[3] = &unk_26432F130;
      id v12 = v8;
      id v13 = v9;
      [(CDPDSOSSecureBackupController *)self _getBackupRecordDevicesIncludingUnrecoverableRecords:0 completion:v11];
    }
    else
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_cold_1();
    }
  }
  else
  {
    id v7 = [a3 filteredArrayUsingPredicate:*(void *)(a1 + 32)];
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v7, "count"));
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Found %@ matching devices", (uint8_t *)&v11, 0xCu);
    }
    if ([v7 count])
    {
      id v8 = [v7 objectAtIndexedSubscript:0];
      goto LABEL_9;
    }
  }
  id v8 = 0;
LABEL_9:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_clientMetadataWithSecretType:(unint64_t)a3 length:(unint64_t)a4
{
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [NSNumber numberWithInt:a3 == 3];
  [v6 setObject:v7 forKey:*MEMORY[0x263F32AE0]];

  id v8 = [NSNumber numberWithInt:a3 == 2];
  [v6 setObject:v8 forKey:*MEMORY[0x263F32AF0]];

  if (a3 == 2)
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a4];
    [v6 setObject:v9 forKey:*MEMORY[0x263F32A78]];
  }
  [v6 setObject:&unk_26C9D2FC8 forKeyedSubscript:@"device_platform"];
  id v10 = (void *)MGCopyAnswer();
  if (v10) {
    [v6 setObject:v10 forKeyedSubscript:@"device_name"];
  }
  int v11 = (void *)MGCopyAnswer();
  if (v11) {
    [v6 setObject:v11 forKeyedSubscript:@"device_model"];
  }
  id v12 = (void *)MGCopyAnswer();
  if (v12) {
    [v6 setObject:v12 forKeyedSubscript:@"device_model_version"];
  }
  uint64_t v13 = [MEMORY[0x263F343A8] sharedInstance];
  uint64_t v14 = [v13 deviceClass];

  if (v14) {
    [v6 setObject:v14 forKeyedSubscript:@"device_model_class"];
  }
  id v15 = (void *)MGCopyAnswer();
  if (v15) {
    [v6 setObject:v15 forKeyedSubscript:@"device_color"];
  }
  uint64_t v16 = (void *)MGCopyAnswer();
  if (v16) {
    [v6 setObject:v16 forKeyedSubscript:@"device_enclosure_color"];
  }
  v17 = (void *)[v6 copy];

  return v17;
}

- (void)recoverSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v28 = 0;
    v29 = (id *)&v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    id v33 = 0;
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0;
    id obj = 0;
    uint64_t v8 = [(CDPDSOSSecureBackupController *)self _recoverBackupDictionaryWithContext:v6 fallbackState:0 error:&obj];
    objc_storeStrong(&v33, obj);
    id v9 = (void *)v23[5];
    v23[5] = v8;

    if ([v29[5] indicatesRecoveryCanBeRetried])
    {
      id v10 = v29[5];
      v29[5] = 0;

      int v11 = v29;
      id v20 = v29[5];
      uint64_t v12 = [(CDPDSOSSecureBackupController *)self _recoverBackupDictionaryWithContext:v6 fallbackState:1 error:&v20];
      objc_storeStrong(v11 + 5, v20);
      uint64_t v13 = (void *)v23[5];
      v23[5] = v12;
    }
    if ([v29[5] isAuthenticationError])
    {
      context = self->_context;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __75__CDPDSOSSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke;
      v15[3] = &unk_26432F250;
      uint64_t v18 = &v28;
      objc_super v19 = &v22;
      v15[4] = self;
      id v16 = v6;
      id v17 = v7;
      [(CDPContext *)context reauthenticateUserWithCompletion:v15];
    }
    else
    {
      (*((void (**)(id, uint64_t, id))v7 + 2))(v7, v23[5], v29[5]);
    }
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
}

uint64_t __75__CDPDSOSSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke(void *a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1[7] + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    id v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = *(void *)(a1[7] + 8);
    id obj = *(id *)(v7 + 40);
    uint64_t v8 = [v5 _recoverBackupDictionaryWithContext:v6 fallbackState:0 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    uint64_t v9 = *(void *)(a1[8] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if ([*(id *)(*(void *)(a1[7] + 8) + 40) indicatesRecoveryCanBeRetried])
    {
      uint64_t v11 = *(void *)(a1[7] + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;

      uint64_t v13 = (void *)a1[4];
      uint64_t v14 = a1[5];
      uint64_t v15 = *(void *)(a1[7] + 8);
      id v21 = *(id *)(v15 + 40);
      uint64_t v16 = [v13 _recoverBackupDictionaryWithContext:v14 fallbackState:1 error:&v21];
      objc_storeStrong((id *)(v15 + 40), v21);
      uint64_t v17 = *(void *)(a1[8] + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v20 = *(uint64_t (**)(void))(a1[6] + 16);
    return v20();
  }
}

- (BOOL)_shouldUseSBDCacheWithSecureBackupContext:(id)a3 fallbackState:(unint64_t)a4
{
  id v6 = a3;
  if (CFPreferencesGetAppBooleanValue(@"ForceUseCachedSecret", @"com.apple.corecdp", 0))
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSOSSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:]();
    }
  }
  else
  {
    if (a4 == 2
      || ![MEMORY[0x263F34400] useCDPContextSecretInsteadOfSBDSecretFeatureEnabled])
    {
      char v8 = [v6 usePreviouslyCachedSecret];
      goto LABEL_11;
    }
    if (a4 != 1)
    {
      char v8 = [(CDPContext *)self->_context type] == 10;
      goto LABEL_11;
    }
  }
  char v8 = 1;
LABEL_11:

  return v8;
}

- (id)_recoverBackupDictionaryWithContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = _os_activity_create(&dword_218640000, "cdp: Recovery Backup", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = [(CDPDSOSSecureBackupController *)self _recoveryInfoDictionaryFromContext:v8 usePreviouslyCachedSecret:[(CDPDSOSSecureBackupController *)self _shouldUseSBDCacheWithSecureBackupContext:v8 fallbackState:a4]];
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F32AB0]];
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v8 device];
    uint64_t v13 = +[CDPDSOSSecureBackupController _sanitizedInfoDictionary:v10];
    -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.4(v12, v13, buf, v11);
  }

  if ([v8 silentRecovery])
  {
    uint64_t v14 = (void *)MEMORY[0x263F34780];
  }
  else
  {
    uint64_t v15 = [v8 recoveryKey];

    uint64_t v14 = (void *)MEMORY[0x263F346C0];
    if (!v15) {
      uint64_t v14 = (void *)MEMORY[0x263F34728];
    }
  }
  uint64_t v16 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:*v14 category:*MEMORY[0x263F34830]];
  uint64_t v17 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  secureBackupProxy = self->_secureBackupProxy;
  id v28 = 0;
  objc_super v19 = [(CDPDSecureBackupProxy *)secureBackupProxy recoverWithInfo:v10 error:&v28];
  id v20 = v28;
  if (v20)
  {
    id v21 = v20;
    if (v19)
    {
      uint64_t v22 = _CDPLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:]();
      }

      uint64_t v23 = [v21 errorByExtendingUserInfoWithDictionary:v19];

      uint64_t v17 = 0;
      id v21 = (void *)v23;
    }
    uint64_t v24 = _CDPLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:]();
    }

    [v16 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
    [v16 populateUnderlyingErrorsStartingWithRootError:v21];
  }
  else
  {
    [(CDPDRemoteSecretValidationResult *)v17 setRecoveredInfo:v19];
    v25 = _CDPLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:]();
    }

    [v16 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34558]];
    id v21 = 0;
  }
  v26 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v26 sendEvent:v16];

  if (a5) {
    *a5 = v21;
  }

  os_activity_scope_leave(&state);
  return v17;
}

- (id)_recoveryInfoDictionaryFromContext:(id)a3 usePreviouslyCachedSecret:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [v6 device];
  uint64_t v9 = [(CDPDSecureBackupConfiguration *)self->_configuration escrowAuthInfoForCreateEscrowRecordFlow:0];
  [v7 addEntriesFromDictionary:v9];

  id v10 = [v6 recoverySecret];

  if (v10)
  {
    uint64_t v11 = [v6 recoverySecret];
    [v7 setObject:v11 forKey:*MEMORY[0x263F32A80]];
  }
  else
  {
    uint64_t v12 = [v6 recoveryKey];

    if (v12)
    {
      uint64_t v13 = [v6 recoveryKey];
      [v7 setObject:v13 forKey:*MEMORY[0x263F32A98]];

      [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F329F8]];
    }
  }
  if (v4) {
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AD8]];
  }
  if (([v8 isUsingMultipleiCSC] & 1) != 0 || objc_msgSend(v6, "silentRecovery"))
  {
    uint64_t v14 = MEMORY[0x263EFFA88];
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AE8]];
    [v7 setObject:v14 forKey:*MEMORY[0x263F329F8]];
  }
  uint64_t v15 = [v8 recordID];

  if (v15)
  {
    uint64_t v16 = [v8 recordID];
    [v7 setObject:v16 forKey:*MEMORY[0x263F32A90]];
  }
  if ([v6 silentRecovery]) {
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AB8]];
  }

  return v7;
}

+ (id)_sanitizedInfoDictionary:(id)a3
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = *MEMORY[0x263F32A80];
  id v5 = [v3 objectForKey:*MEMORY[0x263F32A80]];

  if (v5) {
    [v3 setObject:@"< REDACTED >" forKey:v4];
  }
  uint64_t v6 = *MEMORY[0x263F329E0];
  uint64_t v7 = [v3 objectForKey:*MEMORY[0x263F329E0]];

  if (v7) {
    [v3 setObject:@"< REDACTED >" forKey:v6];
  }
  uint64_t v8 = *MEMORY[0x263F329C8];
  uint64_t v9 = [v3 objectForKey:*MEMORY[0x263F329C8]];

  if (v9) {
    [v3 setObject:@"< REDACTED >" forKey:v8];
  }
  uint64_t v10 = *MEMORY[0x263F32A98];
  uint64_t v11 = [v3 objectForKey:*MEMORY[0x263F32A98]];

  if (v11) {
    [v3 setObject:@"< REDACTED >" forKey:v10];
  }
  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (CDPDSecureBackupProxy)secureBackupProxy
{
  return self->_secureBackupProxy;
}

- (void)setSecureBackupProxy:(id)a3
{
}

- (BOOL)fakeNearlyDepletedRecords
{
  return self->fakeNearlyDepletedRecords;
}

- (void)setFakeNearlyDepletedRecords:(BOOL)a3
{
  self->fakeNearlyDepletedRecords = a3;
}

- (NSDictionary)cachedAccountInfo
{
  return self->_cachedAccountInfo;
}

- (void)setCachedAccountInfo:(id)a3
{
}

- (CDPDSecureBackupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CDPDSecureBackupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CDPDSecureBackupConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedAccountInfo, 0);
  objc_storeStrong((id *)&self->_secureBackupProxy, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)accountInfoWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Using cache account info", v2, v3, v4, v5, v6);
}

void __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Non-cached SecureBackup account info fetched", v2, v3, v4, v5, v6);
}

- (void)_accountInfoWithCompletion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Fetching account info with %@", buf, 0xCu);
}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_1(char a1, char a2, os_log_t log)
{
  uint64_t v3 = @"NO";
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  if (a2) {
    uint64_t v3 = @"YES";
  }
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Secure backup hasSingleICSCBackup=%@ hasMultipleICSCBackups=%@", (uint8_t *)&v5, 0x16u);
}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "backupRecordsArePresentWithCompletion got account info %@", v1, 0xCu);
}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to check for secure backup records: %@", v2, v3, v4, v5, v6);
}

void __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SecureBackup returned error %@", v2, v3, v4, v5, v6);
}

- (void)checkForExistingRecordMatchingPredicate:forceFetch:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Checking if the peer has a secure backup: %@", v1, 0xCu);
}

void __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Check for existing backup failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_shouldUseSBDCacheWithSecureBackupContext:fallbackState:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Forcing use of cached secret by preference (com.apple.corecdp: ForceUseCachedSecret)", v2, v3, v4, v5, v6);
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Recovered SecureBackup", v2, v3, v4, v5, v6);
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to recover SecureBackup with error %@", v2, v3, v4, v5, v6);
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Recovery error had additional info: %@", v2, v3, v4, v5, v6);
}

- (void)_recoverBackupDictionaryWithContext:(uint8_t *)buf fallbackState:(os_log_t)log error:.cold.4(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Attempting to recover SecureBackup secret from device %@ using info %@", buf, 0x16u);
}

@end