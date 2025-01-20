@interface CDPDSecureBackupController
+ (id)_dateWithSecureBackupDateString:(id)a3;
+ (id)_printableAccountInfo:(id)a3;
+ (id)_sanitizedInfoDictionary:(id)a3;
- (BOOL)_disableSecureBackup:(id *)a3;
- (BOOL)_disableSecureBackupWithEnableInfo:(id)a3 error:(id *)a4;
- (BOOL)_disableThenEnableWithInfo:(id)a3 error:(id *)a4;
- (BOOL)_isInSOSCircle;
- (BOOL)_isRecoveryKeySetInOctagonWithConfig:(id)a3;
- (BOOL)_isRecoveryKeySetInSOSWithConfig:(id)a3;
- (BOOL)_isSOSEnabled;
- (BOOL)_shouldUseSBDCacheWithSecureBackupContext:(id)a3 fallbackState:(unint64_t)a4;
- (BOOL)_validateOctagonRecoveryKeyWithConfig:(id)a3 recoveryKey:(id)a4;
- (BOOL)_validateSOSRecoveryKey:(id)a3 config:(id)a4;
- (BOOL)authenticatedEnableSecureBackupWithRecoveryKey:(id)a3 error:(id *)a4;
- (BOOL)disableRecoveryKey:(id *)a3;
- (BOOL)fakeNearlyDepletedRecords;
- (BOOL)isSimulateNonViableEscrowRecordEnabled;
- (BOOL)recordIsEmpty:(id)a3;
- (BOOL)simulateEPThrottle;
- (BOOL)supportsRecoveryKeyWithError:(id *)a3;
- (BOOL)supportsWalrusRecoveryKeyWithError:(id *)a3;
- (CDPContext)context;
- (CDPDOctagonTrustProxy)octagonTrustProxy;
- (CDPDSecureBackupConfiguration)configuration;
- (CDPDSecureBackupController)initWithContext:(id)a3 secureBackupProxy:(id)a4 octagonTrustProxy:(id)a5;
- (CDPDSecureBackupController)initWithContext:(id)a3 uiProvider:(id)a4 delegate:(id)a5;
- (CDPDSecureBackupDelegate)delegate;
- (CDPDSecureBackupProxy)secureBackupProxy;
- (CDPStateUIProviderInternal)uiProvider;
- (NSDictionary)cachedAccountInfo;
- (id)_clientMetadataWithSecretType:(unint64_t)a3 length:(unint64_t)a4;
- (id)_currentAnisetteData;
- (id)_makeRecoveryKeyVerifyEventWithError:(id)a3 result:(BOOL)a4;
- (id)_performEscrowRecoveryWithRecoveryContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5;
- (id)_recoverBackupDictionaryWithContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5;
- (id)_recoveryInfoDictionaryFromContext:(id)a3 usePreviouslyCachedSecret:(BOOL)a4;
- (id)handleCDPDevices:(id)a3;
- (id)performEscrowRecoveryWithData:(id)a3 error:(id *)a4;
- (id)performEscrowRecoveryWithRecoveryContext:(id)a3 error:(id *)a4;
- (id)performSilentEscrowRecoveryWithCDPContext:(id)a3 error:(id *)a4;
- (int64_t)icscRepairRetryDelay;
- (int64_t)icscRepairTotalRetries;
- (void)_accountInfoWithCompletion:(id)a3;
- (void)_authenticatedEnableSecureBackupIncludingFallbackWithContext:(id)a3 completion:(id)a4;
- (void)_authenticatedEnableSecureBackupWithContext:(id)a3 fallbackState:(unint64_t)a4 completion:(id)a5;
- (void)_deleteAllBackupRecordsWithCompletion:(id)a3;
- (void)_deleteSingleICSCBackupWithCompletion:(id)a3;
- (void)_disableRecoveryKeyFromSOS:(id *)a3;
- (void)_enableSecureBackupWithContext:(id)a3 completion:(id)a4;
- (void)_getBackupRecordDevicesIncludingUnrecoverableRecords:(id)a3;
- (void)_getOctagonEscrowBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)_handleSecureBackupEnablementError:(id)a3 fallbackState:(unint64_t)a4 context:(id)a5 delegate:(id)a6 completion:(id)a7;
- (void)_postICSCCreationFailedEventWithError:(id)a3;
- (void)_retryRepairWithContext:(id)a3 retryCount:(int64_t)a4 completion:(id)a5;
- (void)_setRecoveryKeyInIDMSWithContext:(id)a3 circleProxy:(id)a4 authProvider:(id)a5 completion:(id)a6;
- (void)_setRecoveryKeyInOctagonIfRequiredWithConfig:(id)a3 recoveryKey:(id)a4 error:(id *)a5;
- (void)_setRecoveryKeyInSOSIfRequiredWithConfig:(id)a3 recoveryKey:(id)a4 error:(id *)a5;
- (void)_updateContext:(id)a3 withDevices:(id)a4;
- (void)_validateRecoveryKeyInIDMSWithContext:(id)a3 authProvider:(id)a4 completion:(id)a5;
- (void)accountInfoWithCompletion:(id)a3;
- (void)backupRecordsArePresentWithCompletion:(id)a3;
- (void)checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:(id)a3 completion:(id)a4;
- (void)checkForAnyOctagonRecord:(id)a3;
- (void)checkForExistingRecord:(id)a3;
- (void)checkForExistingRecordMatchingPredicate:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)checkForExistingRecordWithPeerId:(id)a3 completion:(id)a4;
- (void)clearAccountInfoCache;
- (void)deleteAllBackupRecordsWithCompletion:(id)a3;
- (void)deleteSingleICSCBackupWithCompletion:(id)a3;
- (void)disableRecoveryKeyFromAllSystemsWithCompletion:(id)a3;
- (void)disableRecoveryKeyWithCompletion:(id)a3;
- (void)disableSecureBackupWithCompletion:(id)a3;
- (void)enableSecureBackupWithContext:(id)a3 completion:(id)a4;
- (void)enableSecureBackupWithRecoveryKey:(id)a3 completion:(id)a4;
- (void)fetchAllEscrowRecordsWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)fetchEscrowRecordsWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)getBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4;
- (void)isEligibleForCDPWithCompletion:(id)a3;
- (void)performEscrowRecoveryWithRecoveryContext:(id)a3 completion:(id)a4;
- (void)recoverSecureBackupWithContext:(id)a3 completion:(id)a4;
- (void)setCachedAccountInfo:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFakeNearlyDepletedRecords:(BOOL)a3;
- (void)setIcscRepairRetryDelay:(int64_t)a3;
- (void)setIcscRepairTotalRetries:(int64_t)a3;
- (void)setIsSimulateNonViableEscrowRecordEnabled:(BOOL)a3;
- (void)setOctagonTrustProxy:(id)a3;
- (void)setSecureBackupProxy:(id)a3;
- (void)setSimulateEPThrottle:(BOOL)a3;
- (void)synchronizeKeyValueStoreWithCompletion:(id)a3;
- (void)upgradeICSCRecordsThenEnableSecureBackupWithContext:(id)a3 completion:(id)a4;
- (void)validateAndRepairRecoveryKeyMismatchWithContext:(id)a3 authProvider:(id)a4 circleProxy:(id)a5 completion:(id)a6;
- (void)validateRecoveryKeyWithContext:(id)a3 completion:(id)a4;
@end

@implementation CDPDSecureBackupController

- (CDPDSecureBackupController)initWithContext:(id)a3 secureBackupProxy:(id)a4 octagonTrustProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CDPDSecureBackupController;
  v12 = [(CDPDSecureBackupController *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_secureBackupProxy, a4);
    objc_storeStrong((id *)&v13->_octagonTrustProxy, a5);
    objc_storeStrong((id *)&v13->_context, a3);
    uint64_t v14 = +[CDPDSecureBackupConfiguration configurationWithContext:v9];
    configuration = v13->_configuration;
    v13->_configuration = (CDPDSecureBackupConfiguration *)v14;

    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"RetryCount", @"com.apple.corecdp", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      v13->_icscRepairTotalRetries = AppIntegerValue;
    }
    else if ([(CDPContext *)v13->_context type])
    {
      v13->_icscRepairTotalRetries = 1;
    }
    else
    {
      v13->_icscRepairTotalRetries = 0;
    }
    v13->_icscRepairRetryDelay = CFPreferencesGetAppIntegerValue(@"RetryDelay", @"com.apple.corecdp", 0);
    if (CFPreferencesGetAppBooleanValue(@"SimulateNonViableEscrowRecord", @"com.apple.corecdp", 0))
    {
      v17 = _CDPLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSecureBackupController initWithContext:secureBackupProxy:octagonTrustProxy:]();
      }

      v13->_isSimulateNonViableEscrowRecordEnabled = 1;
    }
    if (CFPreferencesGetAppBooleanValue(@"SimulateEPThrottle", @"com.apple.corecdp", 0))
    {
      v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSecureBackupController initWithContext:secureBackupProxy:octagonTrustProxy:]();
      }

      v13->_simulateEPThrottle = 1;
    }
  }

  return v13;
}

- (CDPDSecureBackupController)initWithContext:(id)a3 uiProvider:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [[CDPDSecureBackupProxyImpl alloc] initWithContext:v11];
  v13 = [[CDPDOctagonTrustProxyImpl alloc] initWithContext:v11];
  uint64_t v14 = [(CDPDSecureBackupController *)self initWithContext:v11 secureBackupProxy:v12 octagonTrustProxy:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_uiProvider, a4);
    objc_storeWeak((id *)&v14->_delegate, v10);
  }

  return v14;
}

- (void)synchronizeKeyValueStoreWithCompletion:(id)a3
{
  v5 = self->_context;
  id v6 = a3;
  unsigned int v7 = [(CDPContext *)v5 backupActivity];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 4233613993;
  }
  [(CDPContext *)v5 setBackupActivity:v8];
  id v9 = _Block_copy(v6);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke;
  aBlock[3] = &unk_26432ED48;
  v17 = v5;
  id v18 = v9;
  id v10 = v5;
  id v11 = v9;
  v12 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke_2;
  v14[3] = &unk_26432F1E0;
  id v15 = v12;
  id v13 = v12;
  [(CDPDSecureBackupController *)self accountInfoWithCompletion:v14];
}

uint64_t __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

uint64_t __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)fetchEscrowRecordsWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(CDPDSecureBackupConfiguration *)self->_configuration accountInfoFetchSetupDictionary];
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController fetchEscrowRecordsWithOptionForceFetch:completion:]();
  }

  octagonTrustProxy = self->_octagonTrustProxy;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke;
  v11[3] = &unk_2643302D8;
  id v12 = v6;
  id v10 = v6;
  [(CDPDOctagonTrustProxy *)octagonTrustProxy fetchEscrowRecords:v7 forceFetch:v4 completion:v11];
}

void __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2();
  }

  if (!v5 || v6)
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      id v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_11:
      v9();
    }
  }
}

- (void)fetchAllEscrowRecordsWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(CDPDSecureBackupConfiguration *)self->_configuration accountInfoFetchSetupDictionary];
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController fetchAllEscrowRecordsWithOptionForceFetch:completion:]();
  }

  octagonTrustProxy = self->_octagonTrustProxy;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke;
  v11[3] = &unk_2643302D8;
  id v12 = v6;
  id v10 = v6;
  [(CDPDOctagonTrustProxy *)octagonTrustProxy fetchAllEscrowRecords:v7 forceFetch:v4 completion:v11];
}

void __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2();
  }

  if (!v5 || v6)
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      id v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_11:
      v9();
    }
  }
}

- (void)accountInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  if (self->_cachedAccountInfo)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController accountInfoWithCompletion:]((uint64_t)self, &self->_cachedAccountInfo);
    }

    ((void (**)(void, NSDictionary *, void))v5)[2](v5, self->_cachedAccountInfo, 0);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke;
    v7[3] = &unk_26432EE88;
    v7[4] = self;
    id v8 = v4;
    [(CDPDSecureBackupController *)self _accountInfoWithCompletion:v7];
  }
}

void __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1(a1);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, *(void *)(*(void *)(a1 + 32) + 48), v7);
  }
}

- (void)clearAccountInfoCache
{
  v3 = self->_context;
  unsigned int v4 = [(CDPContext *)v3 backupActivity];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 3819251231;
  }
  [(CDPContext *)v3 setBackupActivity:v5];
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Clearing SecureBackup account info cache...", v8, 2u);
  }

  cachedAccountInfo = self->_cachedAccountInfo;
  self->_cachedAccountInfo = 0;

  [(CDPContext *)v3 setBackupActivity:0];
}

- (void)_accountInfoWithCompletion:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  id v6 = [(CDPDSecureBackupConfiguration *)configuration accountInfoFetchSetupDictionary];
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _accountInfoWithCompletion:]();
  }

  [(CDPDSecureBackupProxy *)self->_secureBackupProxy accountInfoWithInfo:v6 completion:v5];
}

- (void)isEligibleForCDPWithCompletion:(id)a3
{
  unsigned int v4 = self->_context;
  id v5 = a3;
  unsigned int v6 = [(CDPContext *)v4 backupActivity];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 2909315642;
  }
  [(CDPContext *)v4 setBackupActivity:v7];
  id v8 = _Block_copy(v5);

  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __61__CDPDSecureBackupController_isEligibleForCDPWithCompletion___block_invoke;
  id v18 = &unk_26432ED48;
  id v9 = v8;
  v19 = v4;
  id v20 = v9;
  id v10 = v4;
  uint64_t v11 = (void (**)(void *, uint64_t, void *))_Block_copy(&v15);
  if (v11)
  {
    id v12 = objc_msgSend(MEMORY[0x263F343A8], "sharedInstance", v15, v16, v17, v18, v19, v20);
    uint64_t v13 = [v12 hasLocalSecret];

    if (v13)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = _CDPStateError();
    }
    v11[2](v11, v13, v14);
  }
}

uint64_t __61__CDPDSecureBackupController_isEligibleForCDPWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

- (void)backupRecordsArePresentWithCompletion:(id)a3
{
  id v5 = self->_context;
  id v6 = a3;
  unsigned int v7 = [(CDPContext *)v5 backupActivity];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 2254843714;
  }
  [(CDPContext *)v5 setBackupActivity:v8];
  id v9 = _Block_copy(v6);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke;
  aBlock[3] = &unk_264330300;
  v17 = v5;
  id v18 = v9;
  id v10 = v5;
  id v11 = v9;
  id v12 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2;
  v14[3] = &unk_264330328;
  id v15 = v12;
  id v13 = v12;
  [(CDPDSecureBackupController *)self getBackupRecordDevicesWithOptionForceFetch:0 completion:v14];
}

uint64_t __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_5();
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v11 = *(void (**)(void))(v10 + 16);
LABEL_19:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_4();
    }

    uint64_t v12 = [v6 count];
    id v13 = _CDPLogSystem();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14) {
        __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_3(v6);
      }

      id v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_2();
      }

      uint64_t v16 = *(void *)(a1 + 32);
      if (v16)
      {
        id v11 = *(void (**)(void))(v16 + 16);
        goto LABEL_19;
      }
    }
    else
    {
      if (v14) {
        __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_1();
      }

      uint64_t v17 = *(void *)(a1 + 32);
      if (v17)
      {
        id v11 = *(void (**)(void))(v17 + 16);
        goto LABEL_19;
      }
    }
  }
}

- (void)getBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  id v7 = self->_context;
  id v8 = a4;
  unsigned int v9 = [(CDPContext *)v7 backupActivity];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 707469235;
  }
  [(CDPContext *)v7 setBackupActivity:v10];
  id v11 = _Block_copy(v8);

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __84__CDPDSecureBackupController_getBackupRecordDevicesWithOptionForceFetch_completion___block_invoke;
  v19 = &unk_26432FB00;
  id v12 = v11;
  id v21 = v12;
  id v13 = v7;
  id v20 = v13;
  BOOL v14 = _Block_copy(&v16);
  if (([(CDPContext *)self->_context idmsRecovery] & 1) != 0
    || ([(CDPContext *)self->_context findMyiPhoneUUID],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    [(CDPDSecureBackupController *)self _getBackupRecordDevicesIncludingUnrecoverableRecords:v14];
  }
  else
  {
    [(CDPDSecureBackupController *)self _getOctagonEscrowBackupRecordDevicesWithOptionForceFetch:v5 completion:v14];
  }
}

uint64_t __84__CDPDSecureBackupController_getBackupRecordDevicesWithOptionForceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

- (id)handleCDPDevices:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v31 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = 0;
    uint64_t v9 = *(void *)v34;
    *(void *)&long long v6 = 138412290;
    long long v30 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([(CDPDSecureBackupController *)self fakeNearlyDepletedRecords])
        {
          id v12 = _CDPLogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            v38 = v11;
            _os_log_debug_impl(&dword_218640000, v12, OS_LOG_TYPE_DEBUG, "**** DEBUG **** Setting fake remaining attempts value of 1 for %@", buf, 0xCu);
          }

          [v11 setRemainingAttempts:1];
        }
        if (v11)
        {
          if ([v11 remainingAttempts])
          {
            [v31 addObject:v11];
          }
          else if (![v11 remainingAttempts])
          {
            id v13 = _CDPLogSystem();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = [v11 remainingAttempts];
              *(_DWORD *)buf = 138412546;
              v38 = v11;
              __int16 v39 = 2048;
              uint64_t v40 = v14;
              _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Disqualified device %@ because the remaining attempts is %lu", buf, 0x16u);
            }
          }
        }
        id v15 = _CDPLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v11 recordDate];
          uint64_t v17 = [v11 recordDate];
          id v18 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v38 = v11;
          __int16 v39 = 2112;
          uint64_t v40 = (uint64_t)v16;
          __int16 v41 = 2112;
          v42 = v18;
          id v19 = v18;
          _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Backup record found for device %@ with date %@ (%@)", buf, 0x20u);
        }
        if (!v8) {
          goto LABEL_22;
        }
        uint64_t v20 = [v11 recordDate];
        if (v20)
        {
          id v21 = (void *)v20;
          v22 = [v11 recordDate];
          v23 = [v8 laterDate:v22];
          v24 = [v11 recordDate];

          if (v23 == v24)
          {
LABEL_22:
            v25 = _CDPLogSystem();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = [v11 recordDate];
              *(_DWORD *)buf = 138412802;
              v38 = v26;
              __int16 v39 = 2112;
              uint64_t v40 = (uint64_t)v8;
              __int16 v41 = 2112;
              v42 = v11;
              _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "Backup record date %@ is later than the previously known newest record (%@), promoting %@ as newest device record", buf, 0x20u);
            }
            uint64_t v27 = [v11 recordDate];

            id v8 = (void *)v27;
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  v28 = _CDPLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_218640000, v28, OS_LOG_TYPE_DEFAULT, "Finished parsing multiple-iCSC records and found the newest record to be %@", buf, 0xCu);
  }

  return v31;
}

- (void)_getOctagonEscrowBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = self->_context;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "_getOctagonEscrowBackupRecordDevicesWithOptionForceFetch: called, fetching escrow records", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke;
  v11[3] = &unk_264330378;
  id v12 = v7;
  id v13 = v6;
  void v11[4] = self;
  BOOL v14 = v4;
  uint64_t v9 = v7;
  id v10 = v6;
  [(CDPDSecureBackupController *)self fetchEscrowRecordsWithOptionForceFetch:v4 completion:v11];
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v8 = [MEMORY[0x263EFF980] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = (void *)[objc_alloc(MEMORY[0x263F34368]) initWithEscrowRecord:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          if (v14) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v11);
    }

    id v15 = [*(id *)(a1 + 32) handleCDPDevices:v8];
    [*(id *)(a1 + 32) _updateContext:*(void *)(a1 + 40) withDevices:v15];
    if ([v15 count])
    {
      uint64_t v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v15 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v33 = v17;
        __int16 v34 = 1024;
        int v35 = 1;
        _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Finished parsing backup records, returning %lu devices and isUsingMultipleICSC=%i", buf, 0x12u);
      }

      uint64_t v18 = *(void *)(a1 + 48);
      if (!v18) {
        goto LABEL_21;
      }
      id v19 = (void *)[v15 copy];
      (*(void (**)(uint64_t, uint64_t, void *, void))(v18 + 16))(v18, 1, v19, 0);
    }
    else
    {
      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(unsigned __int8 *)(a1 + 56);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_54;
      v25[3] = &unk_264330350;
      id v22 = *(id *)(a1 + 48);
      uint64_t v23 = *(void *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      id v27 = v22;
      v25[4] = v23;
      id v26 = v24;
      [v20 fetchAllEscrowRecordsWithOptionForceFetch:v21 completion:v25];

      id v19 = v27;
    }

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_22:
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_54_cold_1();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_9:
    v8();
    goto LABEL_10;
  }
  if ([v5 count])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setTotalEscrowDeviceCount:", objc_msgSend(v5, "count"));
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "there exists multiple icsc records and none of them will get the device into any trust system. Forcing a reset protected data", buf, 2u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "constructed 0 CDP devices after refetching records, possibly single-iCSC.. calling _getBackupRecordDevicesIncludingUnrecoverableRecords", buf, 2u);
  }

  uint64_t v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_55;
  v12[3] = &unk_26432F108;
  v12[4] = v11;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  [v11 _getBackupRecordDevicesIncludingUnrecoverableRecords:v12];

LABEL_10:
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_55(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  [*(id *)(a1 + 32) _updateContext:*(void *)(a1 + 40) withDevices:v9];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v8 + 16))(v8, a2, v9, v7);
  }
}

- (void)_updateContext:(id)a3 withDevices:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v26 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v32;
    do
    {
      uint64_t v11 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "remainingAttempts", v26);
        uint64_t v14 = v13;
        if (v13 > v9) {
          uint64_t v9 = v13;
        }
        if (!v8) {
          goto LABEL_12;
        }
        uint64_t v15 = [v12 recordDate];
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          uint64_t v17 = [v12 recordDate];
          uint64_t v18 = [v8 laterDate:v17];
          [v12 recordDate];
          uint64_t v30 = v9;
          id v19 = v8;
          uint64_t v21 = v20 = v10;

          uint64_t v6 = v28;
          BOOL v22 = v18 == v21;
          uint64_t v10 = v20;
          uint64_t v8 = v19;
          uint64_t v9 = v30;
          if (v22)
          {
LABEL_12:
            uint64_t v23 = [v12 recordDate];

            uint64_t v8 = (void *)v23;
          }
        }
        v7 += v14;
        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v24 = objc_msgSend(obj, "count", v26);
  [v27 setValidEscrowDeviceCount:v24];
  [v27 setTotalRecoveryAttempts:v7];
  [v27 setMaxDeviceRecoveryAttempts:v9];
  [v8 timeIntervalSinceNow];
  [v27 setNewestEscrowRecordAge:fabs(v25)];
}

- (void)_getBackupRecordDevicesIncludingUnrecoverableRecords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "_getBackupRecordDevicesIncludingUnrecoverableRecords: called, fetching account info from SecureBackup", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke;
  v7[3] = &unk_26432FF80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDSecureBackupController *)self accountInfoWithCompletion:v7];
}

void __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_57;
  }
  v45 = [MEMORY[0x263EFF980] array];
  int v7 = [*(id *)(*(void *)(a1 + 32) + 16) desiresAllRecords];
  id v8 = (void *)MEMORY[0x263F329B8];
  if (!v7) {
    id v8 = (void *)MEMORY[0x263F32B08];
  }
  uint64_t v44 = v4;
  [v4 objectForKeyedSubscript:*v8];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v9)
  {
    uint64_t v11 = 0;
    goto LABEL_41;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v47 = *(void *)v51;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v51 != v47) {
        objc_enumerationMutation(obj);
      }
      uint64_t v49 = v12;
      uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * v12);
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F34368]) initWithSecureBackupRecordInfo:v13];
      uint64_t v15 = v14;
      if ([*(id *)(a1 + 32) fakeNearlyDepletedRecords])
      {
        uint64_t v16 = _CDPLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v55 = (uint64_t)v15;
          _os_log_debug_impl(&dword_218640000, v16, OS_LOG_TYPE_DEBUG, "**** DEBUG **** Setting fake remaining attempts value of 1 for %@", buf, 0xCu);
        }

        uint64_t v14 = v15;
        [v15 setRemainingAttempts:1];
      }
      if (v14)
      {
        if ([v14 remainingAttempts])
        {
          [v45 addObject:v14];
        }
        else if (![v14 remainingAttempts])
        {
          uint64_t v17 = _CDPLogSystem();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [v15 remainingAttempts];
            *(_DWORD *)buf = 138412546;
            uint64_t v55 = (uint64_t)v15;
            __int16 v56 = 2048;
            uint64_t v57 = v18;
            _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Disqualified device %@ because the remaining attempts is %lu", buf, 0x16u);
          }
        }
      }
      id v19 = [v13 objectForKeyedSubscript:@"metadata"];
      uint64_t v20 = [v19 objectForKeyedSubscript:@"ClientMetadata"];
      uint64_t v21 = [v20 objectForKeyedSubscript:@"SecureBackupMetadataTimestamp"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v22 = v21;
        id v23 = +[CDPDSecureBackupController _dateWithSecureBackupDateString:v21];
LABEL_27:
        uint64_t v24 = v23;
        goto LABEL_29;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v22 = v21;
        id v23 = v21;
        goto LABEL_27;
      }
      BOOL v22 = v21;
      uint64_t v24 = 0;
LABEL_29:
      [v15 setRecordDate:v24];
      double v25 = _CDPLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        uint64_t v55 = (uint64_t)v15;
        __int16 v56 = 2112;
        uint64_t v57 = (uint64_t)v24;
        __int16 v58 = 2112;
        v59 = v26;
        id v27 = v26;
        _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "Backup record found for device %@ with date %@ (%@)", buf, 0x20u);
      }
      if (!v11
        || v24
        && ([v11 laterDate:v24],
            uint64_t v28 = objc_claimAutoreleasedReturnValue(),
            v28,
            v28 == v24))
      {
        long long v29 = _CDPLogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v55 = (uint64_t)v24;
          __int16 v56 = 2112;
          uint64_t v57 = (uint64_t)v11;
          __int16 v58 = 2112;
          v59 = v15;
          _os_log_impl(&dword_218640000, v29, OS_LOG_TYPE_DEFAULT, "Backup record date %@ is later than the previously known newest record (%@), promoting %@ as newest device record", buf, 0x20u);
        }

        id v30 = v24;
        uint64_t v11 = v30;
      }

      uint64_t v12 = v49 + 1;
    }
    while (v10 != v49 + 1);
    uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  }
  while (v10);
LABEL_41:

  long long v31 = _CDPLogSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = (uint64_t)v11;
    _os_log_impl(&dword_218640000, v31, OS_LOG_TYPE_DEFAULT, "Finished parsing multiple-iCSC records and found the newest record to be %@", buf, 0xCu);
  }

  long long v32 = v45;
  id v4 = v44;
  if ([v45 count])
  {
    BOOL v33 = 1;
  }
  else
  {
    uint64_t v34 = *MEMORY[0x263F32A68];
    int v35 = [v44 objectForKeyedSubscript:*MEMORY[0x263F32A68]];
    BOOL v33 = v35 == 0;
    if (v35)
    {
      uint64_t v36 = [v44 objectForKeyedSubscript:v34];
      uint64_t v37 = _CDPLogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = (uint64_t)v36;
        _os_log_impl(&dword_218640000, v37, OS_LOG_TYPE_DEFAULT, "Found a single-iCSC metadata record. Returning that as a faux-device using %@", buf, 0xCu);
      }

      v38 = (void *)[objc_alloc(MEMORY[0x263F34368]) initWithSecureBackupMetadataInfo:v36];
      __int16 v39 = [v44 objectForKeyedSubscript:*MEMORY[0x263F32AF8]];
      objc_msgSend(v38, "setHasRandomSecret:", objc_msgSend(v39, "BOOLValue"));

      id v4 = v44;
      [v45 removeAllObjects];
      [v45 addObject:v38];

      long long v32 = v45;
    }
    else
    {
      uint64_t v36 = _CDPLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v36, OS_LOG_TYPE_DEFAULT, "No single-iCSC metadata record is present", buf, 2u);
      }
    }
  }
  uint64_t v40 = _CDPLogSystem();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = [v32 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v55 = v41;
    __int16 v56 = 1024;
    LODWORD(v57) = v33;
    _os_log_impl(&dword_218640000, v40, OS_LOG_TYPE_DEFAULT, "Finished parsing backup records, returning %lu devices and isUsingMultipleICSC=%i", buf, 0x12u);
  }

  uint64_t v42 = *(void *)(a1 + 40);
  if (v42)
  {
    v43 = (void *)[v32 copy];
    (*(void (**)(uint64_t, BOOL, void *, void))(v42 + 16))(v42, v33, v43, 0);
  }
  id v5 = 0;
LABEL_57:
}

+ (id)_dateWithSecureBackupDateString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  [v4 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
  id v6 = [v4 dateFromString:v3];
  int v7 = v6;
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

- (void)enableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  int v7 = self->_context;
  id v8 = a4;
  id v9 = a3;
  unsigned int v10 = [(CDPContext *)v7 backupActivity];
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 3808140738;
  }
  [(CDPContext *)v7 setBackupActivity:v11];
  uint64_t v12 = _Block_copy(v8);

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __71__CDPDSecureBackupController_enableSecureBackupWithContext_completion___block_invoke;
  id v19 = &unk_26432ED48;
  uint64_t v20 = v7;
  id v21 = v12;
  uint64_t v13 = v7;
  id v14 = v12;
  uint64_t v15 = _Block_copy(&v16);
  -[CDPDSecureBackupController _enableSecureBackupWithContext:completion:](self, "_enableSecureBackupWithContext:completion:", v9, v15, v16, v17, v18, v19);
}

uint64_t __71__CDPDSecureBackupController_enableSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

- (void)upgradeICSCRecordsThenEnableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = self->_context;
  id v8 = a4;
  unsigned int v9 = [(CDPContext *)v7 backupActivity];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 4105090989;
  }
  [(CDPContext *)v7 setBackupActivity:v10];
  uint64_t v11 = _Block_copy(v8);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432ED48;
  id v21 = v7;
  id v22 = v11;
  uint64_t v12 = v7;
  id v13 = v11;
  id v14 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2;
  v17[3] = &unk_2643303A0;
  id v18 = v6;
  id v19 = v14;
  v17[4] = self;
  id v15 = v6;
  id v16 = v14;
  [(CDPDSecureBackupController *)self getBackupRecordDevicesWithOptionForceFetch:0 completion:v17];
}

uint64_t __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    unsigned int v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_4();
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v8);
    }
  }
  else if (a2)
  {
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_79;
    aBlock[3] = &unk_26432F5B8;
    uint64_t v12 = *(void **)(a1 + 40);
    void aBlock[4] = *(void *)(a1 + 32);
    id v21 = v12;
    id v22 = *(id *)(a1 + 48);
    id v13 = (void (**)(void))_Block_copy(aBlock);
    id v14 = [v7 firstObject];
    if (([v14 hasRandomSecret] & 1) != 0 || (objc_msgSend(v14, "hasNumericSecret") & 1) == 0)
    {
      id v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_2();
      }

      uint64_t v17 = [*(id *)(a1 + 32) delegate];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_82;
      v18[3] = &unk_26432F680;
      id v19 = v13;
      [v17 promptForAdoptionOfMultipleICSCWithCompletion:v18];
    }
    else
    {
      id v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_3();
      }

      v13[2](v13);
    }
  }
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_79(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_80;
  v3[3] = &unk_26432FF58;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 deleteSingleICSCBackupWithCompletion:v3];
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_80(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_80_cold_1();
    }

    [*(id *)(a1 + 32) checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_80_cold_2();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
    }
  }
}

uint64_t __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_82(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_82_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = self->_context;
  id v8 = a4;
  unsigned int v9 = [(CDPContext *)v7 backupActivity];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 2608738587;
  }
  [(CDPContext *)v7 setBackupActivity:v10];
  uint64_t v11 = _Block_copy(v8);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432ED48;
  id v22 = v7;
  id v23 = v11;
  uint64_t v12 = v7;
  id v13 = v11;
  id v14 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke_2;
  v17[3] = &unk_2643303C8;
  id v18 = v6;
  id v19 = self;
  id v20 = v14;
  id v15 = v14;
  id v16 = v6;
  [(CDPDSecureBackupController *)self checkForExistingRecord:v17];
}

uint64_t __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

void __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recordInfo];

  if (v4)
  {
    [*(id *)(a1 + 32) setDevice:v3];
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v6 = "Calling enable without delete due to existing record metadata being present";
      id v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      id v6 = "No existing backup record found, continuing with enable";
      id v7 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }

  [*(id *)(a1 + 40) _enableSecureBackupWithContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

- (void)checkForAnyOctagonRecord:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Starting to check whether the account has any OT viable escrow record...", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke;
  v7[3] = &unk_264330328;
  id v8 = v4;
  id v6 = v4;
  [(CDPDSecureBackupController *)self getBackupRecordDevicesWithOptionForceFetch:0 completion:v7];
}

void __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v7);
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend(v6, "aaf_firstObjectPassingTest:", &__block_literal_global_6);
    uint64_t v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Completed the check for OT only viable escrow records with result: %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, BOOL, void))(v12 + 16))(v12, v10 != 0, 0);
    }
  }
}

BOOL __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 record];
  BOOL v3 = [v2 recordViability] != 2;

  return v3;
}

- (void)checkForExistingRecord:(id)a3
{
  id v5 = self->_context;
  id v6 = a3;
  unsigned int v7 = [(CDPContext *)v5 backupActivity];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 407282594;
  }
  [(CDPContext *)v5 setBackupActivity:v8];
  uint64_t v9 = _Block_copy(v6);

  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __53__CDPDSecureBackupController_checkForExistingRecord___block_invoke;
  id v18 = &unk_264330410;
  id v19 = v5;
  id v20 = v9;
  uint64_t v10 = v5;
  id v11 = v9;
  uint64_t v12 = _Block_copy(&v15);
  int v13 = [(CDPDSecureBackupController *)self delegate];
  id v14 = [v13 circlePeerIDForSecureBackupController:self];

  [(CDPDSecureBackupController *)self checkForExistingRecordWithPeerId:v14 completion:v12];
}

uint64_t __53__CDPDSecureBackupController_checkForExistingRecord___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

- (void)checkForExistingRecordWithPeerId:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned int v7 = self->_context;
  id v8 = a4;
  unsigned int v9 = [(CDPContext *)v7 backupActivity];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 1412515335;
  }
  [(CDPContext *)v7 setBackupActivity:v10];
  id v11 = _Block_copy(v8);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke;
  aBlock[3] = &unk_264330410;
  id v23 = v11;
  uint64_t v12 = v7;
  id v22 = v12;
  id v13 = v11;
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Checking if the peer has a secure backup: %@", buf, 0xCu);
  }

  uint64_t v16 = (void *)MEMORY[0x263F08A98];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke_87;
  v19[3] = &unk_26432F228;
  id v20 = v6;
  id v17 = v6;
  id v18 = [v16 predicateWithBlock:v19];
  [(CDPDSecureBackupController *)self checkForExistingRecordMatchingPredicate:v18 forceFetch:0 completion:v14];
}

uint64_t __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

uint64_t __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke_87(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)checkForExistingRecordMatchingPredicate:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = self->_context;
  id v10 = a5;
  unsigned int v11 = [(CDPContext *)v9 backupActivity];
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 1846835407;
  }
  [(CDPContext *)v9 setBackupActivity:v12];
  id v13 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke;
  aBlock[3] = &unk_264330410;
  id v14 = v13;
  id v23 = v14;
  uint64_t v15 = v9;
  id v22 = v15;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController checkForExistingRecordMatchingPredicate:forceFetch:completion:]();
  }

  if (v16)
  {
    if (v8)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_89;
      v18[3] = &unk_26432F130;
      id v19 = v8;
      id v20 = v16;
      [(CDPDSecureBackupController *)self getBackupRecordDevicesWithOptionForceFetch:v6 completion:v18];
    }
    else
    {
      (*((void (**)(void *, void, void))v16 + 2))(v16, 0, 0);
    }
  }
}

uint64_t __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

void __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_89(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    unsigned int v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_89_cold_1();
    }
  }
  else
  {
    unsigned int v7 = [a3 filteredArrayUsingPredicate:*(void *)(a1 + 32)];
    unsigned int v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v7, "count"));
      int v11 = 138412290;
      uint64_t v12 = v10;
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

- (BOOL)supportsRecoveryKeyWithError:(id *)a3
{
  id v5 = self->_context;
  unsigned int v6 = [(CDPContext *)v5 backupActivity];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 3623838984;
  }
  [(CDPContext *)v5 setBackupActivity:v7];
  if (!CFPreferencesGetAppBooleanValue(@"ForceRecoveryKeySupport", @"com.apple.corecdp", 0))
  {
    id v10 = objc_alloc_init(MEMORY[0x263F16D38]);
    int v11 = [(CDPDSecureBackupController *)self context];
    uint64_t v12 = [v11 altDSID];
    [v10 setAltDSID:v12];

    [v10 setContext:*MEMORY[0x263F16D90]];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [(CDPDSecureBackupController *)self context];
      id v14 = [v13 telemetryFlowID];
      [v10 setFlowID:v14];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [(CDPDSecureBackupController *)self context];
      uint64_t v16 = [v15 telemetryDeviceSessionID];
      [v10 setDeviceSessionID:v16];
    }
    id v17 = [(CDPDSecureBackupController *)self octagonTrustProxy];
    id v27 = 0;
    unsigned __int8 v18 = [v17 isRecoveryKeySet:v10 error:&v27];
    id v19 = v27;

    id v20 = [(CDPDSecureBackupController *)self secureBackupProxy];
    id v26 = 0;
    unsigned __int8 v21 = [v20 isRecoveryKeySet:&v26];
    id v22 = v26;

    char v9 = v21 | v18;
    if ((v21 | v18))
    {
      [(CDPContext *)v5 setBackupActivity:0];
LABEL_28:

      goto LABEL_29;
    }
    if (v19)
    {
      if (a3) {
        *a3 = v19;
      }
      [(CDPContext *)v5 setBackupActivity:0];
      id v23 = _CDPLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController supportsRecoveryKeyWithError:]();
      }

      if (!v22) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!v22) {
        goto LABEL_28;
      }
      if (a3) {
        *a3 = v22;
      }
      [(CDPContext *)v5 setBackupActivity:0];
    }
    uint64_t v24 = _CDPLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController supportsRecoveryKeyWithError:]();
    }

    goto LABEL_28;
  }
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController supportsRecoveryKeyWithError:]();
  }

  [(CDPContext *)v5 setBackupActivity:0];
  char v9 = 1;
LABEL_29:

  return v9;
}

- (BOOL)supportsWalrusRecoveryKeyWithError:(id *)a3
{
  id v5 = [MEMORY[0x263F290F0] sharedInstance];
  unsigned int v6 = [(CDPContext *)self->_context altDSID];
  uint64_t v7 = [v5 authKitAccountWithAltDSID:v6];

  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v5 hasModernRecoveryKeyForAccount:v7];
    }
    else
    {
      id v8 = 0;
    }
    unsigned __int8 v18 = [(CDPContext *)self->_context cliqueConfiguration];
    octagonTrustProxy = self->_octagonTrustProxy;
    id v22 = 0;
    LODWORD(v17) = [(CDPDOctagonTrustProxy *)octagonTrustProxy isRecoveryKeySet:v18 error:&v22];
    id v20 = v22;
    if (v20)
    {
      id v17 = _CDPLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController supportsRecoveryKeyWithError:]();
      }

      LOBYTE(v17) = 0;
      if (a3) {
        *a3 = v20;
      }
    }
    else if (v17)
    {
      LOBYTE(v17) = [v8 BOOLValue];
    }
  }
  else
  {
    char v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController supportsWalrusRecoveryKeyWithError:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5102);
      LOBYTE(v17) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return (char)v17;
}

- (void)_enableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _enableSecureBackupWithContext:completion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke;
  v11[3] = &unk_264330438;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CDPDSecureBackupController *)self _authenticatedEnableSecureBackupIncludingFallbackWithContext:v9 completion:v11];
}

void __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, 1, v5);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) _retryRepairWithContext:*(void *)(a1 + 40) retryCount:0 completion:*(void *)(a1 + 48)];
  }
}

- (void)_retryRepairWithContext:(id)a3 retryCount:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _retryRepairWithContext:retryCount:completion:]();
  }

  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _retryRepairWithContext:retryCount:completion:]((uint64_t)self);
  }

  dispatch_time_t v12 = dispatch_time(0, 1000000000 * self->_icscRepairRetryDelay);
  id v13 = dispatch_get_global_queue(0, 0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke;
  v16[3] = &unk_264330488;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v14 = v9;
  id v15 = v8;
  dispatch_after(v12, v13, v16);
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2;
  v6[3] = &unk_26432FF08;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v5;
  [v3 reauthenticateUserWithCompletion:v6];
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_2();
  }

  if (a2)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103;
    v21[3] = &unk_264330460;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v23 = v9;
    uint64_t v24 = v10;
    uint64_t v11 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v11;
    [v7 _authenticatedEnableSecureBackupIncludingFallbackWithContext:v8 completion:v21];
  }
  else
  {
    dispatch_time_t v12 = [*(id *)(a1 + 40) circleJoinResult];
    int v13 = [v12 hasPeersWithCDPBackupRecords];

    if (v13)
    {
      id v14 = [MEMORY[0x263F34388] contextForStateRepair];
      id v15 = [*(id *)(*(void *)(a1 + 32) + 16) altDSID];
      [v14 setAltDSID:v15];

      uint64_t v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_1();
      }

      id v17 = [*(id *)(*(void *)(a1 + 32) + 16) telemetryFlowID];
      [v14 setTelemetryFlowID:v17];

      id v18 = [*(id *)(*(void *)(a1 + 32) + 16) telemetryDeviceSessionID];
      [v14 setTelemetryDeviceSessionID:v18];

      int64_t v19 = +[CDPDFollowUpController sharedInstance];
      [v19 postFollowUpItemForContext:v14 error:0];
    }
    [*(id *)(a1 + 32) _postICSCCreationFailedEventWithError:v5];
    uint64_t v20 = *(void *)(a1 + 48);
    if (v20) {
      (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v5);
    }
  }
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_14:
      v8();
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56) + 1;
    uint64_t v10 = [*(id *)(a1 + 32) icscRepairTotalRetries];
    uint64_t v11 = _CDPLogSystem();
    dispatch_time_t v12 = v11;
    if (v9 >= v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103_cold_3();
      }

      uint64_t v13 = *(void *)(a1 + 48);
      if (v13)
      {
        uint64_t v8 = *(void (**)(void))(v13 + 16);
        goto LABEL_14;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103_cold_2();
      }

      [*(id *)(a1 + 32) _retryRepairWithContext:*(void *)(a1 + 40) retryCount:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
    }
  }
}

- (void)_postICSCCreationFailedEventWithError:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F202A8];
  context = self->_context;
  uint64_t v5 = *MEMORY[0x263F34608];
  uint64_t v6 = *MEMORY[0x263F34830];
  id v7 = a3;
  id v9 = [v3 analyticsEventWithContext:context eventName:v5 category:v6];
  [v9 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
  [v9 populateUnderlyingErrorsStartingWithRootError:v7];

  uint64_t v8 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v8 sendEvent:v9];
}

- (void)enableSecureBackupWithRecoveryKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = self->_context;
  id v8 = a4;
  unsigned int v9 = [(CDPContext *)v7 backupActivity];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 2608738587;
  }
  [(CDPContext *)v7 setBackupActivity:v10];
  uint64_t v11 = _Block_copy(v8);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke;
  aBlock[3] = &unk_26432ED48;
  id v12 = v11;
  id v26 = v12;
  uint64_t v13 = v7;
  id v25 = v13;
  id v14 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  id v23 = 0;
  BOOL v15 = [(CDPDSecureBackupController *)self authenticatedEnableSecureBackupWithRecoveryKey:v6 error:&v23];
  id v16 = v23;
  id v17 = v16;
  if (v15)
  {
    v14[2](v14, 1, 0);
  }
  else if ([v16 isAuthenticationError])
  {
    id v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController enableSecureBackupWithRecoveryKey:completion:]();
    }

    context = self->_context;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke_108;
    v20[3] = &unk_26432FF58;
    v20[4] = self;
    id v21 = v6;
    id v22 = v14;
    [(CDPContext *)context reauthenticateUserWithCompletion:v20];
  }
  else
  {
    ((void (**)(void *, uint64_t, void *))v14)[2](v14, 0, v17);
  }
}

uint64_t __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

void __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke_108(void *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    id v12 = 0;
    uint64_t v8 = [v6 authenticatedEnableSecureBackupWithRecoveryKey:v7 error:&v12];
    id v9 = v12;
    uint64_t v10 = a1[6];
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, v8, v9);
    }
  }
  else
  {
    uint64_t v11 = a1[6];
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v5);
    }
  }
}

- (BOOL)authenticatedEnableSecureBackupWithRecoveryKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v8 = MEMORY[0x263EFFA88];
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F329F8]];
    [v7 setObject:v8 forKey:*MEMORY[0x263F32AD0]];
    [v7 setObject:v6 forKey:*MEMORY[0x263F32A98]];
    id v9 = [(CDPDSecureBackupConfiguration *)self->_configuration escrowAuthInfoForCreateEscrowRecordFlow:1];
    [v7 addEntriesFromDictionary:v9];

    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController authenticatedEnableSecureBackupWithRecoveryKey:error:]();
    }

    char v11 = [(CDPDSecureBackupProxy *)self->_secureBackupProxy enableWithInfo:v7 error:a4];
  }
  else if (a4)
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController authenticatedEnableSecureBackupWithRecoveryKey:error:]();
    }

    _CDPStateError();
    char v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_authenticatedEnableSecureBackupIncludingFallbackWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke;
  v10[3] = &unk_264330438;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(CDPDSecureBackupController *)self _authenticatedEnableSecureBackupWithContext:v8 fallbackState:0 completion:v10];
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_19:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_5();
    }

    if ([v5 isMissingCachedPassphraseError])
    {
      char v10 = [MEMORY[0x263F34400] useCDPContextSecretInsteadOfSBDSecretFeatureEnabled];
      id v11 = _CDPLogSystem();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      if (v10)
      {
        if (v12) {
          __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_2();
        }

        uint64_t v13 = *(void **)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_111;
        v16[3] = &unk_26432F680;
        id v17 = *(id *)(a1 + 48);
        [v13 _authenticatedEnableSecureBackupWithContext:v14 fallbackState:1 completion:v16];

        goto LABEL_20;
      }
      if (v12) {
        __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_3();
      }
    }
    else
    {
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_4();
      }
    }

    uint64_t v15 = *(void *)(a1 + 48);
    if (v15)
    {
      id v9 = *(void (**)(void))(v15 + 16);
      goto LABEL_19;
    }
  }
LABEL_20:
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_111(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_111_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_111_cold_2();
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_10;
    }
  }
}

- (void)_authenticatedEnableSecureBackupWithContext:(id)a3 fallbackState:(unint64_t)a4 completion:(id)a5
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:]1();
  }

  uint64_t v90 = [(CDPDSecureBackupController *)self delegate];
  BOOL v11 = [(CDPDSecureBackupController *)self _shouldUseSBDCacheWithSecureBackupContext:v8 fallbackState:a4];
  if (CFPreferencesGetAppBooleanValue(@"ForceCachedSecretPurge", @"com.apple.corecdp", 0))
  {
    BOOL v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:]0();
    }

    [(CDPDSecureBackupProxy *)self->_secureBackupProxy uncacheAllSecrets];
  }
  v89 = (void (**)(void, void, void))v9;
  uint64_t v13 = [v8 localSecretType];
  uint64_t v14 = [v8 localSecret];
  uint64_t v15 = -[CDPDSecureBackupController _clientMetadataWithSecretType:length:](self, "_clientMetadataWithSecretType:length:", v13, [v14 length]);

  unint64_t v88 = a4;
  if (!v11)
  {
    id v16 = [v8 localSecret];

    if (!v16)
    {
      v38 = v15;
      goto LABEL_28;
    }
    id v17 = [v8 localSecret];
    uint64_t v18 = [v17 length];

    if (!v18)
    {
      int64_t v19 = _CDPLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.9(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  id v27 = (void *)[v15 mutableCopy];
  uint64_t v28 = [MEMORY[0x263F53C50] sharedConnection];
  int v29 = [v28 unlockScreenType];
  id v30 = _CDPLogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v96 = v29 == 0;
    _os_log_debug_impl(&dword_218640000, v30, OS_LOG_TYPE_DEBUG, "Using cached secret and managed config reports devicePasscodeIsSimple=%i", buf, 8u);
  }

  long long v31 = [NSNumber numberWithInt:v29 != 0];
  [v27 setObject:v31 forKey:*MEMORY[0x263F32AE0]];

  long long v32 = [NSNumber numberWithInt:v29 == 0];
  [v27 setObject:v32 forKey:*MEMORY[0x263F32AF0]];

  if (v29)
  {
    [v27 removeObjectForKey:*MEMORY[0x263F32A78]];
  }
  else
  {
    *(_DWORD *)buf = -1;
    BOOL v33 = [MEMORY[0x263F53C50] sharedConnection];
    int v34 = [v33 unlockScreenTypeWithOutSimplePasscodeType:buf];

    if (v34 && *(_DWORD *)buf != -1) {
      -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:]();
    }
    if (*(_DWORD *)buf) {
      uint64_t v35 = 6;
    }
    else {
      uint64_t v35 = 4;
    }
    uint64_t v36 = _CDPLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.8();
    }

    uint64_t v37 = [NSNumber numberWithUnsignedInteger:v35];
    [v27 setObject:v37 forKey:*MEMORY[0x263F32A78]];
  }
  v38 = objc_msgSend(v27, "copy", self);

  __int16 v39 = _CDPLogSystem();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.7();
  }

LABEL_28:
  uint64_t v40 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v41 = [v8 localSecret];

  if (v41)
  {
    uint64_t v42 = [v8 localSecret];
    uint64_t v43 = [v42 length];

    if (!v43)
    {
      uint64_t v44 = _CDPLogSystem();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.6(v44, v45, v46, v47, v48, v49, v50, v51);
      }
    }
    long long v52 = [v8 localSecret];
    long long v53 = (void *)MEMORY[0x263F32A80];
  }
  else
  {
    v54 = [v8 recoveryKey];

    if (!v54) {
      goto LABEL_37;
    }
    [v40 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AD0]];
    long long v52 = [v8 recoveryKey];
    long long v53 = (void *)MEMORY[0x263F32A98];
  }
  [v40 setObject:v52 forKey:*v53];

LABEL_37:
  if ([v8 synchronous]) {
    [v40 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AD0]];
  }
  uint64_t v55 = [v8 preRecordUUID];

  if (v55)
  {
    __int16 v56 = [v8 preRecordUUID];
    [v40 setObject:v56 forKey:*MEMORY[0x263F32A50]];
  }
  if (v11)
  {
    [v40 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AD8]];
  }
  else
  {
    uint64_t v57 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "localSecretType") == 1);
    [v40 setObject:v57 forKey:*MEMORY[0x263F32AF8]];
  }
  uint64_t v58 = MEMORY[0x263EFFA88];
  [v40 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F329F8]];
  [v40 setObject:v58 forKey:*MEMORY[0x263F32AE8]];
  v59 = [v8 device];
  v60 = [v59 recordInfo];

  if (v60)
  {
    uint64_t v61 = [v8 device];
    v62 = [v61 recordInfo];
    [v40 setObject:v62 forKey:*MEMORY[0x263F32AC0]];
  }
  v63 = [(CDPDSecureBackupConfiguration *)self->_configuration escrowAuthInfoForCreateEscrowRecordFlow:1];
  [v40 addEntriesFromDictionary:v63];

  if ([v8 nonViableRequiresRepair]) {
    [v40 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32A70]];
  }
  v64 = [v8 telemetryDeviceSessionID];

  if (v64)
  {
    v65 = [v8 telemetryDeviceSessionID];
    [v40 setObject:v65 forKey:*MEMORY[0x263F32A08]];
  }
  v66 = [v8 telemetryFlowID];

  if (v66)
  {
    v67 = [v8 telemetryFlowID];
    [v40 setObject:v67 forKey:*MEMORY[0x263F32A48]];
  }
  v68 = _CDPLogSystem();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.5(v8);
  }

  v69 = [MEMORY[0x263F34328] sharedInstance];
  v70 = [v69 primaryAccountStashedPRK];

  if (v70)
  {
    v71 = [(CDPDSecureBackupController *)self _currentAnisetteData];
    v72 = [v71 machineID];

    if (v72)
    {
      v73 = [v38 mutableCopy];
      [v73 setObject:v72 forKeyedSubscript:@"device_mid"];
      uint64_t v74 = [v73 copy];

      v93 = @"prk";
      v94 = v70;
      v75 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      v76 = [MEMORY[0x263F08910] archivedDataWithRootObject:v75 requiringSecureCoding:1 error:0];
      [v40 setObject:v76 forKey:*MEMORY[0x263F32A58]];

      v38 = (void *)v74;
    }
    else
    {
      v73 = _CDPLogSystem();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.4();
      }
    }
    v78 = v89;
    v77 = (void *)v90;
  }
  else
  {
    v72 = _CDPLogSystem();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:]();
    }
    v78 = v89;
    v77 = (void *)v90;
  }

  [v40 setObject:v38 forKeyedSubscript:*MEMORY[0x263F32A68]];
  v79 = _CDPLogSystem();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:]();
  }

  secureBackupProxy = self->_secureBackupProxy;
  id v92 = 0;
  [(CDPDSecureBackupProxy *)secureBackupProxy enableWithInfo:v40 error:&v92];
  id v81 = v92;
  id v82 = v81;
  if (v81)
  {
    v83 = [v81 domain];
    if ([v83 isEqual:*MEMORY[0x263F329B0]])
    {
      uint64_t v84 = [v82 code];

      if (v84 != -6005)
      {
        v77 = (void *)v90;
        goto LABEL_74;
      }
      v85 = _CDPLogSystem();
      v77 = (void *)v90;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v85, OS_LOG_TYPE_DEFAULT, "Failed to enable due to existing record, disabling and trying again", buf, 2u);
      }

      id v91 = 0;
      [(CDPDSecureBackupController *)self _disableThenEnableWithInfo:v40 error:&v91];
      v83 = v82;
      id v82 = v91;
    }
  }
LABEL_74:
  if (self->_context && v77 && ([v77 synchronizeCircleViewsForSecureBackupContext:v8] & 1) == 0)
  {
    if (!v78) {
      goto LABEL_79;
    }
    v87 = _CDPLogSystem();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v87, OS_LOG_TYPE_DEFAULT, "Failed to synchronize circle views", buf, 2u);
    }

    v86 = _CDPStateError();
    ((void (**)(void, void, void *))v78)[2](v78, 0, v86);
  }
  else
  {
    v86 = [(CDPDSecureBackupController *)self context];
    [(CDPDSecureBackupController *)self _handleSecureBackupEnablementError:v82 fallbackState:v88 context:v86 delegate:v77 completion:v78];
  }

LABEL_79:
}

- (void)_handleSecureBackupEnablementError:(id)a3 fallbackState:(unint64_t)a4 context:(id)a5 delegate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    int v16 = [v12 isMissingCachedPassphraseError];
    id v17 = [MEMORY[0x263F343A8] sharedInstance];
    int v18 = [v17 hasLocalSecret];

    int64_t v19 = _CDPLogSystem();
    uint64_t v20 = v19;
    if (v16 && v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.5();
      }

      if (a4)
      {
        char v21 = [v13 disableAsyncModeRequested];
        uint64_t v22 = _CDPLogSystem();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
        if (v21)
        {
          if (v23) {
            -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:]();
          }

          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke;
          v27[3] = &unk_26432FF30;
          v27[4] = self;
          id v28 = v15;
          [v14 promptForLocalSecretWithCompletion:v27];

          goto LABEL_28;
        }
        if (v23) {
          -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.4();
        }
      }
      else
      {
        uint64_t v25 = _CDPLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:]();
        }
      }
      uint64_t v26 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5501, v12);
      if (v15) {
        (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v26);
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.6();
      }

      if (v15) {
        (*((void (**)(id, void, id))v15 + 2))(v15, 0, v12);
      }
    }
  }
  else
  {
    uint64_t v24 = _CDPLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:]();
    }

    if (v15) {
      (*((void (**)(id, uint64_t, void))v15 + 2))(v15, 1, 0);
    }
  }
LABEL_28:
}

void __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(CDPDSecureBackupContext);
    id v8 = [v5 validatedSecret];
    [(CDPDSecureBackupContext *)v7 setLocalSecret:v8];

    -[CDPDSecureBackupContext setLocalSecretType:](v7, "setLocalSecretType:", [v5 secretType]);
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) _enableSecureBackupWithContext:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
    }
  }
}

- (BOOL)_shouldUseSBDCacheWithSecureBackupContext:(id)a3 fallbackState:(unint64_t)a4
{
  id v6 = a3;
  if (CFPreferencesGetAppBooleanValue(@"ForceUseCachedSecret", @"com.apple.corecdp", 0))
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:]();
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

- (BOOL)_disableThenEnableWithInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  BOOL v7 = [(CDPDSecureBackupController *)self _disableSecureBackupWithEnableInfo:v6 error:&v13];
  id v8 = v13;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = (void *)[v6 mutableCopy];
    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F32AC0]];
    [v10 setObject:0 forKeyedSubscript:*MEMORY[0x263F32A70]];
    char v11 = [(CDPDSecureBackupProxy *)self->_secureBackupProxy enableWithInfo:v10 error:a4];
  }
  else
  {
    char v11 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v11;
}

- (id)_currentAnisetteData
{
  id v2 = objc_alloc_init(MEMORY[0x263F29108]);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__5;
  id v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CDPDSecureBackupController__currentAnisetteData__block_invoke;
  v7[3] = &unk_2643304B0;
  id v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [v2 anisetteDataWithCompletion:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __50__CDPDSecureBackupController__currentAnisetteData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __50__CDPDSecureBackupController__currentAnisetteData__block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_clientMetadataWithSecretType:(unint64_t)a3 length:(unint64_t)a4
{
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v7 = [NSNumber numberWithInt:a3 == 3];
  [v6 setObject:v7 forKey:*MEMORY[0x263F32AE0]];

  uint64_t v8 = [NSNumber numberWithInt:a3 == 2];
  [v6 setObject:v8 forKey:*MEMORY[0x263F32AF0]];

  if (a3 == 2)
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a4];
    [v6 setObject:v9 forKey:*MEMORY[0x263F32A78]];
  }
  id v10 = [MEMORY[0x263F343A8] sharedInstance];
  char v11 = [v10 deviceName];

  if (v11) {
    [v6 setObject:v11 forKeyedSubscript:@"device_name"];
  }
  uint64_t v12 = [MEMORY[0x263F343A8] sharedInstance];
  id v13 = [v12 marketingModel];

  if (v13) {
    [v6 setObject:v13 forKeyedSubscript:@"device_model"];
  }
  id v14 = [MEMORY[0x263F343A8] sharedInstance];
  id v15 = [v14 modelVersion];

  if (v15) {
    [v6 setObject:v15 forKeyedSubscript:@"device_model_version"];
  }
  int v16 = [MEMORY[0x263F343A8] sharedInstance];
  id v17 = [v16 deviceClass];

  if (v17) {
    [v6 setObject:v17 forKeyedSubscript:@"device_model_class"];
  }
  [v6 setObject:&unk_26C9D30E8 forKeyedSubscript:@"device_platform"];
  int v18 = (void *)MGCopyAnswer();
  if (v18) {
    [v6 setObject:v18 forKeyedSubscript:@"device_color"];
  }
  int64_t v19 = (void *)MGCopyAnswer();
  if (v19) {
    [v6 setObject:v19 forKeyedSubscript:@"device_enclosure_color"];
  }
  uint64_t v20 = (void *)[v6 copy];

  return v20;
}

- (id)performEscrowRecoveryWithData:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController performEscrowRecoveryWithData:error:]();
  }

  uint64_t v8 = (void *)[v6 mutableCopy];
  id v9 = [(CDPContext *)self->_context telemetryFlowID];

  if (v9)
  {
    id v10 = [(CDPContext *)self->_context telemetryFlowID];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F32A48]];
  }
  char v11 = [(CDPContext *)self->_context telemetryDeviceSessionID];

  if (v11)
  {
    uint64_t v12 = [(CDPContext *)self->_context telemetryDeviceSessionID];
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F32A08]];
  }
  id v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(CDPContext *)self->_context telemetryFlowID];
    id v15 = [(CDPContext *)self->_context telemetryDeviceSessionID];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v14;
    __int16 v27 = 2114;
    id v28 = v15;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Passing telemetry flow ID %{public}@ and session ID %{public}@ to OTClique performEscrowRecoveryWithContextData", buf, 0x16u);
  }
  int v16 = (void *)MEMORY[0x263F16D30];
  id v17 = [(CDPContext *)self->_context cliqueConfiguration];
  id v24 = 0;
  int v18 = [v16 performEscrowRecoveryWithContextData:v17 escrowArguments:v8 error:&v24];
  id v19 = v24;

  uint64_t v20 = _CDPLogSystem();
  char v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController performEscrowRecoveryWithData:error:]();
    }

    id v22 = 0;
    if (a4) {
      *a4 = v19;
    }
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController performEscrowRecoveryWithData:error:]();
    }

    id v22 = v18;
  }

  return v22;
}

- (id)performSilentEscrowRecoveryWithCDPContext:(id)a3 error:(id *)a4
{
  v79[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.7();
  }

  uint64_t v68 = 0;
  v69[0] = &v68;
  v69[1] = 0x3032000000;
  v69[2] = __Block_byref_object_copy__5;
  v69[3] = __Block_byref_object_dispose__5;
  id v70 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__5;
  v66 = __Block_byref_object_dispose__5;
  id v67 = [MEMORY[0x263EFF980] array];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 1;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke;
  v53[3] = &unk_2643304D8;
  uint64_t v55 = &v68;
  __int16 v56 = &v58;
  uint64_t v57 = &v62;
  id v9 = v8;
  v54 = v9;
  [(CDPDSecureBackupController *)self getBackupRecordDevicesWithOptionForceFetch:0 completion:v53];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (*(void *)(v69[0] + 40))
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.6((uint64_t)v69, v10, v11, v12, v13, v14, v15, v16);
    }

    if (a4)
    {
      id v17 = 0;
      *a4 = *(id *)(v69[0] + 40);
      goto LABEL_40;
    }
    goto LABEL_33;
  }
  if (*((unsigned char *)v59 + 24))
  {
    if (![(id)v63[5] count])
    {
      uint64_t v37 = _CDPLogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:]();
      }

      if (a4)
      {
        v38 = (void *)MEMORY[0x263F087E8];
        uint64_t v78 = *MEMORY[0x263F08320];
        v79[0] = @"no escrow records found";
        __int16 v39 = [NSDictionary dictionaryWithObjects:v79 forKeys:&v78 count:1];
        uint64_t v40 = [v38 errorWithDomain:*MEMORY[0x263F342B0] code:-5305 userInfo:v39];

        id v41 = v40;
        *a4 = v41;
      }
LABEL_33:
      id v17 = 0;
      goto LABEL_40;
    }
    int v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.5(v77, [(id)v63[5] count], v18);
    }

    id v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.4();
    }

    uint64_t v51 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:*MEMORY[0x263F34780] category:*MEMORY[0x263F34830]];
    uint64_t v20 = _CDPSignpostLogSystem();
    os_signpost_id_t v21 = _CDPSignpostCreate();

    id v22 = _CDPSignpostLogSystem();
    BOOL v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_218640000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "OTCPerformSilentEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    id v24 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v72 = v21;
      _os_log_impl(&dword_218640000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: OTCPerformSilentEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    uint64_t v25 = (void *)MEMORY[0x263F16D30];
    uint64_t v26 = [(CDPContext *)self->_context cliqueConfiguration];
    uint64_t v27 = v63[5];
    id v28 = (id *)(v69[0] + 40);
    id obj = *(id *)(v69[0] + 40);
    id v17 = [v25 performSilentEscrowRecovery:v26 cdpContext:v6 allRecords:v27 error:&obj];
    objc_storeStrong(v28, obj);

    uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
    id v30 = _CDPSignpostLogSystem();
    long long v31 = v30;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      int v32 = [*(id *)(v69[0] + 40) code];
      *(_DWORD *)buf = 67240192;
      LODWORD(v72) = v32;
      _os_signpost_emit_with_name_impl(&dword_218640000, v31, OS_SIGNPOST_INTERVAL_END, v21, "OTCPerformSilentEscrowRecovery", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
    }

    BOOL v33 = _CDPSignpostLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = [*(id *)(v69[0] + 40) code];
      *(_DWORD *)buf = 134218496;
      os_signpost_id_t v72 = v21;
      __int16 v73 = 2048;
      double v74 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v75 = 1026;
      int v76 = v34;
      _os_log_impl(&dword_218640000, v33, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: OTCPerformSilentEscrowRecovery  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
    }

    if (v17)
    {
      [v51 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34558]];
    }
    else
    {
      uint64_t v42 = _CDPLogSystem();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:]((uint64_t)v69, v42, v43, v44, v45, v46, v47, v48);
      }

      if (a4) {
        *a4 = *(id *)(v69[0] + 40);
      }
      [v51 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
      [v51 populateUnderlyingErrorsStartingWithRootError:*(void *)(v69[0] + 40)];
    }
    uint64_t v49 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v49 sendEvent:v51];
  }
  else
  {
    uint64_t v35 = _CDPLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:]();
    }

    uint64_t v36 = [MEMORY[0x263F5B738] CDPRecordContextToDictionary:v6];
    id v17 = [(CDPDSecureBackupController *)self performEscrowRecoveryWithData:v36 error:a4];
  }
LABEL_40:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v17;
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_4();
    }
LABEL_4:

    goto LABEL_5;
  }
  if (![v7 count])
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_1();
    }
    goto LABEL_4;
  }
  if (a2)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = (void *)MEMORY[0x263F5B738];
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "recordInfo", (void)v19);
          id v17 = [v15 dictionaryToEscrowRecord:v16];

          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_2(a1);
    }
    goto LABEL_4;
  }
  int v18 = _CDPLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_3();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)recordIsEmpty:(id)a3
{
  id v3 = a3;
  if ([v3 creationDate])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 escrowInformationMetadata];
    if ([v5 secureBackupTimestamp]
      || [v3 recordStatus] != 1
      || [v3 remainingAttempts])
    {
      BOOL v4 = 0;
    }
    else
    {
      id v7 = [v3 escrowInformationMetadata];
      if ([v7 secureBackupUsesMultipleIcscs])
      {
        BOOL v4 = 0;
      }
      else
      {
        id v8 = [v3 escrowInformationMetadata];
        id v9 = [v8 clientMetadata];
        if ([v9 devicePlatform])
        {
          BOOL v4 = 0;
        }
        else
        {
          id v10 = [v3 escrowInformationMetadata];
          uint64_t v11 = [v10 clientMetadata];
          if ([v11 secureBackupMetadataTimestamp])
          {
            BOOL v4 = 0;
          }
          else
          {
            uint64_t v12 = [v3 escrowInformationMetadata];
            uint64_t v13 = [v12 clientMetadata];
            BOOL v4 = [v13 secureBackupNumericPassphraseLength] == 0;
          }
        }
      }
    }
  }
  return v4;
}

- (id)performEscrowRecoveryWithRecoveryContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  id v7 = [(CDPDSecureBackupController *)self _performEscrowRecoveryWithRecoveryContext:v6 fallbackState:0 error:&v13];
  id v8 = v13;
  if ([v8 indicatesRecoveryCanBeRetried])
  {
    id v12 = v8;
    uint64_t v9 = [(CDPDSecureBackupController *)self _performEscrowRecoveryWithRecoveryContext:v6 fallbackState:1 error:&v12];
    id v10 = v12;

    id v8 = v10;
    id v7 = (void *)v9;
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (id)_performEscrowRecoveryWithRecoveryContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5
{
  v91[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:]3();
  }

  id v10 = [(CDPDSecureBackupController *)self _recoveryInfoDictionaryFromContext:v8 usePreviouslyCachedSecret:[(CDPDSecureBackupController *)self _shouldUseSBDCacheWithSecureBackupContext:v8 fallbackState:a4]];
  uint64_t v11 = [MEMORY[0x263F5B738] dictionaryToCDPRecordContext:v10];
  id v12 = [v8 recoveryKey];

  if (v12)
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:]2();
    }

    uint64_t v14 = [v8 recoveryKey];
    if (!v14) {
      goto LABEL_25;
    }
LABEL_12:
    long long v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:]0();
    }

    long long v20 = [(CDPContext *)self->_context cliqueConfiguration];
    objc_msgSend(v20, "setOctagonCapableRecordsExist:", objc_msgSend(v8, "octagonCapableRecordsExist"));
    id v21 = objc_alloc(MEMORY[0x263F202A8]);
    long long v22 = (void *)[v21 initWithEventName:*MEMORY[0x263F346C0] eventCategory:*MEMORY[0x263F34830] initData:0];
    BOOL v23 = [(CDPContext *)self->_context telemetryFlowID];

    if (v23)
    {
      uint64_t v24 = [(CDPContext *)self->_context telemetryFlowID];
      [v22 setObject:v24 forKeyedSubscript:*MEMORY[0x263F20348]];
    }
    uint64_t v25 = [(CDPContext *)self->_context telemetryDeviceSessionID];

    if (v25)
    {
      uint64_t v26 = [(CDPContext *)self->_context telemetryDeviceSessionID];
      [v22 setObject:v26 forKeyedSubscript:*MEMORY[0x263F20320]];
    }
    id v83 = 0;
    char v27 = [MEMORY[0x263F16D30] recoverWithRecoveryKey:v20 recoveryKey:v14 error:&v83];
    id v28 = v83;
    if ((v27 & 1) == 0)
    {
      [v22 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
      [v22 populateUnderlyingErrorsStartingWithRootError:v28];
      id v41 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
      [v41 sendEvent:v22];

      uint64_t v42 = _CDPLogSystem();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.9();
      }

      if (a5) {
        *a5 = v28;
      }

      id v32 = 0;
      id v35 = 0;
      uint64_t v36 = 0;
      goto LABEL_48;
    }
    uint64_t v29 = _CDPLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.8();
    }

    id v30 = objc_alloc(MEMORY[0x263F16D30]);
    long long v31 = [(CDPContext *)self->_context cliqueConfiguration];
    id v32 = (id)[v30 initWithContextData:v31];

    [v22 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34558]];
    BOOL v33 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v33 sendEvent:v22];

LABEL_22:
    int v34 = _CDPLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:]();
    }

    id v32 = v32;
    id v35 = 0;
    uint64_t v36 = v32;
    goto LABEL_48;
  }
  if ([(CDPDSecureBackupController *)self supportsRecoveryKeyWithError:0])
  {
    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:]1();
    }

    uint64_t v16 = +[CDPRecoveryKeyCache sharedInstance];
    id v17 = [(CDPDSecureBackupController *)self context];
    int v18 = [v17 altDSID];
    uint64_t v14 = [v16 fetchRecoveryKeyFromCacheForAltDSID:v18];

    if (v14) {
      goto LABEL_12;
    }
  }
LABEL_25:
  int v37 = [v8 silentRecovery];
  v38 = _CDPLogSystem();
  BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
  if (v37)
  {
    if (v39) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:]();
    }

    uint64_t v40 = [(CDPDSecureBackupController *)self performSilentEscrowRecoveryWithCDPContext:v11 error:a5];
LABEL_47:
    uint64_t v36 = (void *)v40;
    id v32 = 0;
    id v35 = 0;
    goto LABEL_48;
  }
  if (v39) {
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.7();
  }

  uint64_t v43 = [v8 device];
  char v44 = [v43 isUsingMultipleiCSC];

  if ((v44 & 1) == 0)
  {
    uint64_t v57 = _CDPLogSystem();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.6();
    }

    uint64_t v40 = [(CDPDSecureBackupController *)self performEscrowRecoveryWithData:v10 error:a5];
    goto LABEL_47;
  }
  uint64_t v45 = (void *)MEMORY[0x263F5B738];
  uint64_t v46 = [v8 device];
  uint64_t v47 = [v46 recordInfo];
  uint64_t v48 = [v45 dictionaryToEscrowRecord:v47];

  uint64_t v49 = (void *)v48;
  LODWORD(v46) = [(CDPDSecureBackupController *)self recordIsEmpty:v48];
  uint64_t v50 = _CDPLogSystem();
  uint64_t v51 = v50;
  if (v46)
  {
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:]();
    }

    if (a5)
    {
      long long v52 = (void *)MEMORY[0x263F087E8];
      uint64_t v53 = *MEMORY[0x263F342B0];
      uint64_t v90 = *MEMORY[0x263F08320];
      v91[0] = @"chosen record is empty";
      v54 = [NSDictionary dictionaryWithObjects:v91 forKeys:&v90 count:1];
      uint64_t v55 = [v52 errorWithDomain:v53 code:-5305 userInfo:v54];

      id v56 = v55;
      *a5 = v56;
    }
    id v32 = 0;
    id v35 = 0;
LABEL_43:
    uint64_t v36 = 0;
    goto LABEL_48;
  }
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.5();
  }

  id v59 = objc_alloc(MEMORY[0x263F202A8]);
  uint64_t v60 = (void *)[v59 initWithEventName:*MEMORY[0x263F34728] eventCategory:*MEMORY[0x263F34830] initData:0];
  char v61 = [(CDPContext *)self->_context telemetryFlowID];

  if (v61)
  {
    uint64_t v62 = [(CDPContext *)self->_context telemetryFlowID];
    [v60 setObject:v62 forKeyedSubscript:*MEMORY[0x263F20348]];
  }
  v63 = [(CDPContext *)self->_context telemetryDeviceSessionID];

  if (v63)
  {
    uint64_t v64 = [(CDPContext *)self->_context telemetryDeviceSessionID];
    [v60 setObject:v64 forKeyedSubscript:*MEMORY[0x263F20320]];
  }
  v65 = _CDPSignpostLogSystem();
  os_signpost_id_t v66 = _CDPSignpostCreate();

  id v67 = _CDPSignpostLogSystem();
  uint64_t v68 = v67;
  if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v68, OS_SIGNPOST_INTERVAL_BEGIN, v66, "OTCPerformEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
  }

  v69 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v85 = v66;
    _os_log_impl(&dword_218640000, v69, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: OTCPerformEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
  }

  id v70 = (void *)MEMORY[0x263F16D30];
  v71 = [(CDPContext *)self->_context cliqueConfiguration];
  id v81 = v49;
  id v82 = 0;
  id v32 = [v70 performEscrowRecovery:v71 cdpContext:v11 escrowRecord:v49 error:&v82];
  id v35 = v82;

  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  __int16 v73 = _CDPSignpostLogSystem();
  double v74 = v73;
  if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
  {
    int v75 = [v35 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v85) = v75;
    _os_signpost_emit_with_name_impl(&dword_218640000, v74, OS_SIGNPOST_INTERVAL_END, v66, "OTCPerformEscrowRecovery", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  int v76 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    int v77 = [v35 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v85 = v66;
    __int16 v86 = 2048;
    double v87 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v88 = 1026;
    int v89 = v77;
    _os_log_impl(&dword_218640000, v76, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: OTCPerformEscrowRecovery  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  uint64_t v78 = *MEMORY[0x263F34558];
  if (v32)
  {
    [v60 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v78];
  }
  else
  {
    [v60 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v78];
    [v60 populateUnderlyingErrorsStartingWithRootError:v35];
  }
  v79 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v79 sendEvent:v60];

  if (!v35) {
    goto LABEL_22;
  }
  v80 = _CDPLogSystem();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.4();
  }

  if (!a5) {
    goto LABEL_43;
  }
  id v35 = v35;
  uint64_t v36 = 0;
  *a5 = v35;
LABEL_48:

  return v36;
}

- (void)performEscrowRecoveryWithRecoveryContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke;
    v8[3] = &unk_26432FF58;
    id v9 = v6;
    id v10 = self;
    id v11 = v7;
    [(CDPDSecureBackupController *)self checkForAnyOctagonRecord:v8];
  }
}

void __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [a1[4] setOctagonCapableRecordsExist:a2];
  uint64_t v40 = 0;
  id v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__5;
  char v44 = __Block_byref_object_dispose__5;
  id v45 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  int v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  BOOL v39 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  id v7 = a1[4];
  id v6 = a1[5];
  id v8 = v41;
  id obj = v41[5];
  id v9 = [v6 performEscrowRecoveryWithRecoveryContext:v7 error:&obj];
  objc_storeStrong(v8 + 5, obj);
  [(id)v35[5] setRecoveredClique:v9];

  id v10 = [(id)v35[5] recoveredClique];
  if (!v10 || (id v11 = v41[5], v10, v11))
  {
    if ([v41[5] isAuthenticationError])
    {
      id v12 = a1[5];
      id v13 = (void *)v12[2];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_2;
      v28[3] = &unk_264330500;
      long long v31 = &v34;
      v28[4] = v12;
      id v29 = a1[4];
      id v32 = &v40;
      id v30 = a1[6];
      [v13 reauthenticateUserWithCompletion:v28];

      id v14 = 0;
    }
    else
    {
      if ([a1[4] silentRecovery]
        && [v41[5] isICSCInvalidError])
      {
        id v15 = a1[5];
        id v27 = 0;
        int v16 = [v15 supportsRecoveryKeyWithError:&v27];
        id v14 = v27;
        if (v16)
        {
          id v17 = _CDPLogSystem();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Recovering SecureBackup failed - iCSC Invalid (silent burn failed). Trying again with cached recovery key.", buf, 2u);
          }

          [a1[4] setUsePreviouslyCachedRecoveryKey:1];
          int v18 = objc_msgSend(a1[5], "_recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:", a1[4], objc_msgSend(a1[4], "usePreviouslyCachedSecret"));
          id v19 = a1[5];
          id v25 = 0;
          long long v20 = [v19 performEscrowRecoveryWithData:v18 error:&v25];
          id v21 = v25;
          [(id)v35[5] setRecoveredClique:v20];

          long long v22 = [(id)v35[5] recoveredClique];

          if (!v22)
          {
            if (v21)
            {
              BOOL v23 = _CDPLogSystem();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_2();
              }
            }
            else if (v14)
            {
              uint64_t v24 = _CDPLogSystem();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_1();
              }

              id v21 = v14;
            }
            else
            {
              id v21 = 0;
            }
          }
          (*((void (**)(void))a1[6] + 2))();

          goto LABEL_24;
        }
      }
      else
      {
        id v14 = 0;
      }
      (*((void (**)(void))a1[6] + 2))();
    }
LABEL_24:

    goto LABEL_25;
  }
  (*((void (**)(void))a1[6] + 2))();
LABEL_25:
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
}

uint64_t __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_2(void *a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v5 + 40);
    id v6 = [v3 performEscrowRecoveryWithRecoveryContext:v4 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    [*(id *)(*(void *)(a1[7] + 8) + 40) setRecoveredClique:v6];

    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v8 = *(uint64_t (**)(void))(a1[6] + 16);
    return v8();
  }
}

- (void)recoverSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = self->_context;
  id v8 = a4;
  unsigned int v9 = [(CDPContext *)v7 backupActivity];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 3877103917;
  }
  [(CDPContext *)v7 setBackupActivity:v10];
  id v11 = _Block_copy(v8);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke;
  aBlock[3] = &unk_26432FA90;
  id v12 = v11;
  id v53 = v12;
  id v13 = v7;
  long long v52 = v13;
  id v14 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v14)
  {
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3032000000;
    uint64_t v48 = __Block_byref_object_copy__5;
    uint64_t v49 = __Block_byref_object_dispose__5;
    id v50 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3032000000;
    uint64_t v42 = __Block_byref_object_copy__5;
    uint64_t v43 = __Block_byref_object_dispose__5;
    id v44 = 0;
    id obj = 0;
    uint64_t v15 = [(CDPDSecureBackupController *)self _recoverBackupDictionaryWithContext:v6 fallbackState:0 error:&obj];
    objc_storeStrong(&v50, obj);
    int v16 = (void *)v40[5];
    v40[5] = v15;

    if ([(id)v46[5] indicatesRecoveryCanBeRetried])
    {
      id v17 = (id *)(v46 + 5);
      id v37 = (id)v46[5];
      uint64_t v18 = [(CDPDSecureBackupController *)self _recoverBackupDictionaryWithContext:v6 fallbackState:1 error:&v37];
      objc_storeStrong(v17, v37);
      id v19 = (void *)v40[5];
      v40[5] = v18;
    }
    if ([(id)v46[5] isAuthenticationError])
    {
      context = self->_context;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke_2;
      v32[3] = &unk_264330500;
      id v35 = &v39;
      v32[4] = self;
      id v33 = v6;
      uint64_t v36 = &v45;
      uint64_t v34 = v14;
      [(CDPContext *)context reauthenticateUserWithCompletion:v32];

      id v21 = 0;
    }
    else
    {
      if ([v6 silentRecovery]
        && [(id)v46[5] isICSCInvalidError])
      {
        id v31 = 0;
        BOOL v22 = [(CDPDSecureBackupController *)self supportsRecoveryKeyWithError:&v31];
        id v21 = v31;
        if (v22)
        {
          BOOL v23 = _CDPLogSystem();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218640000, v23, OS_LOG_TYPE_DEFAULT, "Recovering SecureBackup failed - iCSC Invalid (silent burn failed). Trying again with cached recovery key.", buf, 2u);
          }

          [v6 setUsePreviouslyCachedRecoveryKey:1];
          uint64_t v24 = (id *)(v46 + 5);
          id v29 = (id)v46[5];
          uint64_t v25 = [(CDPDSecureBackupController *)self _recoverBackupDictionaryWithContext:v6 fallbackState:2 error:&v29];
          objc_storeStrong(v24, v29);
          uint64_t v26 = (void *)v40[5];
          v40[5] = v25;

          ((void (*)(void (**)(void *, uint64_t), uint64_t, uint64_t))v14[2])(v14, v40[5], v46[5]);
          goto LABEL_19;
        }
      }
      else
      {
        id v21 = 0;
      }
      id v27 = v14[2];
      uint64_t v28 = v40[5];
      if (v46[5]) {
        v27(v14, v28);
      }
      else {
        ((void (*)(void (**)(void *, uint64_t), uint64_t, id))v27)(v14, v28, v21);
      }
    }
LABEL_19:

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }
}

uint64_t __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

uint64_t __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke_2(void *a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v5 + 40);
    uint64_t v6 = [v3 _recoverBackupDictionaryWithContext:v4 fallbackState:0 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    uint64_t v7 = *(void *)(a1[7] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if ([*(id *)(*(void *)(a1[8] + 8) + 40) indicatesRecoveryCanBeRetried])
    {
      unsigned int v9 = (void *)a1[4];
      uint64_t v10 = a1[5];
      uint64_t v11 = *(void *)(a1[8] + 8);
      id v17 = *(id *)(v11 + 40);
      uint64_t v12 = [v9 _recoverBackupDictionaryWithContext:v10 fallbackState:1 error:&v17];
      objc_storeStrong((id *)(v11 + 40), v17);
      uint64_t v13 = *(void *)(a1[7] + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else
  {
    int v16 = *(uint64_t (**)(void))(a1[6] + 16);
    return v16();
  }
}

- (id)_makeRecoveryKeyVerifyEventWithError:(id)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x263F202A8];
  context = self->_context;
  uint64_t v7 = *MEMORY[0x263F34700];
  uint64_t v8 = *MEMORY[0x263F34830];
  id v9 = a3;
  uint64_t v10 = [v5 analyticsEventWithContext:context eventName:v7 category:v8];
  uint64_t v11 = [NSNumber numberWithBool:v4];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F20330]];

  [v10 populateUnderlyingErrorsStartingWithRootError:v9];
  return v10;
}

- (void)validateRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Validating Recovery Key", buf, 2u);
  }

  id v9 = [v6 recoveryKey];

  if (v9)
  {
    uint64_t v10 = [(CDPContext *)self->_context cliqueConfiguration];
    uint64_t v11 = (void *)MEMORY[0x263F16D30];
    uint64_t v12 = [v6 recoveryKey];
    id v23 = 0;
    [v11 preflightRecoverOctagonUsingRecoveryKey:v10 recoveryKey:v12 error:&v23];
    id v13 = v23;

    id v14 = _CDPLogSystem();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v13;
        _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "validateRecoveryKey Failed: %@", buf, 0xCu);
      }

      int v16 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
      id v17 = [(CDPDSecureBackupController *)self _makeRecoveryKeyVerifyEventWithError:v13 result:0];
      [v16 sendEvent:v17];

      if (v7) {
        v7[2](v7, 0, v13);
      }
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "RecoveryKey Validated", buf, 2u);
      }

      id v19 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
      long long v20 = [(CDPDSecureBackupController *)self _makeRecoveryKeyVerifyEventWithError:0 result:1];
      [v19 sendEvent:v20];

      id v21 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      [(CDPDRemoteSecretValidationResult *)v21 setSecretType:5];
      BOOL v22 = [v6 recoveryKey];
      [(CDPDRemoteSecretValidationResult *)v21 setValidSecret:v22];

      if (v7) {
        ((void (**)(id, CDPDRemoteSecretValidationResult *, id))v7)[2](v7, v21, 0);
      }
    }
    goto LABEL_19;
  }
  uint64_t v18 = _CDPLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "Recovery key is nil, calling completion with error", buf, 2u);
  }

  if (v7)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
    v7[2](v7, 0, v10);
LABEL_19:
  }
}

- (void)validateAndRepairRecoveryKeyMismatchWithContext:(id)a3 authProvider:(id)a4 circleProxy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Validating and Repairing Recovery Key Mismatch", buf, 2u);
  }

  BOOL v15 = [v10 recoveryKey];

  if (v15)
  {
    int v16 = [(CDPContext *)self->_context cliqueConfiguration];
    id v17 = (void *)[objc_alloc(MEMORY[0x263F343F0]) initWithContext:self->_context];
    id v29 = 0;
    char v18 = [v17 verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError:&v29];
    id v19 = v29;
    long long v20 = _CDPLogSystem();
    id v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController validateAndRepairRecoveryKeyMismatchWithContext:authProvider:circleProxy:completion:]();
      }

      [(CDPDSecureBackupController *)self validateRecoveryKeyWithContext:v10 completion:v13];
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v21, OS_LOG_TYPE_DEFAULT, "Detected a RK oserving system mismatch", buf, 2u);
      }

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke;
      v23[3] = &unk_264330550;
      v23[4] = self;
      id v24 = v16;
      id v25 = v10;
      id v28 = v13;
      id v26 = v12;
      id v27 = v11;
      [(CDPDSecureBackupController *)self _validateRecoveryKeyInIDMSWithContext:v25 authProvider:v27 completion:v23];
    }
    goto LABEL_16;
  }
  BOOL v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Recovery key is nil, calling completion with error", buf, 2u);
  }

  if (v13)
  {
    int v16 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v16);
LABEL_16:
  }
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_4();
    }

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) recoveryKey];
    id v55 = 0;
    [v7 _setRecoveryKeyInOctagonIfRequiredWithConfig:v8 recoveryKey:v9 error:&v55];
    id v10 = v55;

    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [*(id *)(a1 + 48) recoveryKey];
    id v54 = 0;
    [v11 _setRecoveryKeyInSOSIfRequiredWithConfig:v12 recoveryKey:v13 error:&v54];
    id v14 = v54;

    if (v10)
    {
      BOOL v15 = _CDPLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_3();
      }

      uint64_t v16 = *(void *)(a1 + 72);
      if (!v16) {
        goto LABEL_34;
      }
      id v17 = *(void (**)(void))(v16 + 16);
    }
    else
    {
      uint64_t v36 = _CDPLogSystem();
      id v37 = v36;
      if (!v14)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_1();
        }

        uint64_t v40 = objc_alloc_init(CDPDRemoteSecretValidationResult);
        [(CDPDRemoteSecretValidationResult *)v40 setSecretType:5];
        uint64_t v41 = [*(id *)(a1 + 48) recoveryKey];
        [(CDPDRemoteSecretValidationResult *)v40 setValidSecret:v41];

        uint64_t v42 = *(void *)(a1 + 72);
        if (v42) {
          (*(void (**)(uint64_t, CDPDRemoteSecretValidationResult *, void))(v42 + 16))(v42, v40, 0);
        }

        goto LABEL_34;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_2();
      }

      uint64_t v38 = *(void *)(a1 + 72);
      if (!v38)
      {
LABEL_34:

        goto LABEL_35;
      }
      id v17 = *(void (**)(void))(v38 + 16);
    }
    v17();
    goto LABEL_34;
  }
  char v18 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  long long v20 = [*(id *)(a1 + 48) recoveryKey];
  LODWORD(v18) = [v18 _validateOctagonRecoveryKeyWithConfig:v19 recoveryKey:v20];

  if (v18)
  {
    id v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_5();
    }

    objc_initWeak(&location, *(id *)(a1 + 32));
    BOOL v22 = *(void **)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 56);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147;
    v48[3] = &unk_264330528;
    uint64_t v25 = *(void *)(a1 + 64);
    id v51 = *(id *)(a1 + 72);
    objc_copyWeak(&v52, &location);
    id v49 = *(id *)(a1 + 40);
    id v50 = *(id *)(a1 + 48);
    [v22 _setRecoveryKeyInIDMSWithContext:v23 circleProxy:v24 authProvider:v25 completion:v48];

    objc_destroyWeak(&v52);
    id v26 = v51;
LABEL_18:

    objc_destroyWeak(&location);
    goto LABEL_36;
  }
  id v27 = *(void **)(a1 + 32);
  id v28 = [*(id *)(a1 + 48) recoveryKey];
  int v29 = [v27 _validateSOSRecoveryKey:v28 config:*(void *)(a1 + 40)];

  id v30 = _CDPLogSystem();
  id v31 = v30;
  if (v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_6();
    }

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v32 = *(void **)(a1 + 32);
    uint64_t v33 = *(void *)(a1 + 48);
    uint64_t v34 = *(void *)(a1 + 56);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148;
    v43[3] = &unk_264330528;
    uint64_t v35 = *(void *)(a1 + 64);
    id v46 = *(id *)(a1 + 72);
    objc_copyWeak(&v47, &location);
    id v44 = *(id *)(a1 + 40);
    id v45 = *(id *)(a1 + 48);
    [v32 _setRecoveryKeyInIDMSWithContext:v33 circleProxy:v34 authProvider:v35 completion:v43];

    objc_destroyWeak(&v47);
    id v26 = v46;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_7();
  }

  uint64_t v39 = *(void *)(a1 + 72);
  if (v39)
  {
    _CDPStateError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v39 + 16))(v39, 0, v10);
LABEL_35:
  }
LABEL_36:
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) recoveryKey];
      id v18 = 0;
      [WeakRetained _setRecoveryKeyInSOSIfRequiredWithConfig:v8 recoveryKey:v9 error:&v18];
      id v10 = v18;

      id v11 = _CDPLogSystem();
      uint64_t v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147_cold_2();
        }

        uint64_t v13 = *(void *)(a1 + 48);
        if (v13) {
          (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v10);
        }
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147_cold_1();
        }

        BOOL v15 = objc_alloc_init(CDPDRemoteSecretValidationResult);
        [(CDPDRemoteSecretValidationResult *)v15 setSecretType:5];
        uint64_t v16 = [*(id *)(a1 + 40) recoveryKey];
        [(CDPDRemoteSecretValidationResult *)v15 setValidSecret:v16];

        uint64_t v17 = *(void *)(a1 + 48);
        if (v17) {
          (*(void (**)(uint64_t, CDPDRemoteSecretValidationResult *, void))(v17 + 16))(v17, v15, 0);
        }
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 48);
      if (!v14)
      {
LABEL_20:

        goto LABEL_21;
      }
      _CDPStateError();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v10);
    }

    goto LABEL_20;
  }
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147_cold_3();
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v4);
  }
LABEL_21:
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) recoveryKey];
      id v18 = 0;
      [WeakRetained _setRecoveryKeyInOctagonIfRequiredWithConfig:v8 recoveryKey:v9 error:&v18];
      id v10 = v18;

      id v11 = _CDPLogSystem();
      uint64_t v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148_cold_2();
        }

        uint64_t v13 = *(void *)(a1 + 48);
        if (v13) {
          (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v10);
        }
        goto LABEL_20;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148_cold_1();
      }

      BOOL v15 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      [(CDPDRemoteSecretValidationResult *)v15 setSecretType:5];
      uint64_t v16 = [*(id *)(a1 + 40) recoveryKey];
      [(CDPDRemoteSecretValidationResult *)v15 setValidSecret:v16];

      uint64_t v17 = *(void *)(a1 + 48);
      if (v17) {
        (*(void (**)(uint64_t, CDPDRemoteSecretValidationResult *, void))(v17 + 16))(v17, v15, 0);
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 48);
      if (!v14)
      {
LABEL_19:
        id v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
      _CDPStateError();
      BOOL v15 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, CDPDRemoteSecretValidationResult *))(v14 + 16))(v14, 0, v15);
    }

    goto LABEL_19;
  }
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148_cold_3();
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v4);
  }
LABEL_21:
}

- (BOOL)_isRecoveryKeySetInOctagonWithConfig:(id)a3
{
  id v7 = 0;
  char v3 = [MEMORY[0x263F16D30] isRecoveryKeySetInOctagon:a3 error:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _isRecoveryKeySetInOctagonWithConfig:]();
    }

    char v3 = 0;
  }

  return v3;
}

- (BOOL)_validateOctagonRecoveryKeyWithConfig:(id)a3 recoveryKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(CDPDSecureBackupController *)self _isRecoveryKeySetInOctagonWithConfig:v6])
  {
    id v16 = 0;
    [MEMORY[0x263F16D30] preflightRecoverOctagonUsingRecoveryKey:v6 recoveryKey:v7 error:&v16];
    uint64_t v8 = v16;
    BOOL v9 = v8 == 0;
    id v10 = _CDPLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        uint64_t v12 = "Octagon validateRecoveryKey Failed: %@";
        uint64_t v13 = v10;
        uint32_t v14 = 12;
LABEL_10:
        _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Octagon RecoveryKey Validated";
      uint64_t v13 = v10;
      uint32_t v14 = 2;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Recovery Key not set in Octagon", buf, 2u);
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (void)_setRecoveryKeyInOctagonIfRequiredWithConfig:(id)a3 recoveryKey:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(CDPDSecureBackupController *)self _isRecoveryKeySetInOctagonWithConfig:v8])
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Recovery Key already set in Octagon", buf, 2u);
    }
  }
  else
  {
    id v13 = 0;
    [MEMORY[0x263F16D30] setRecoveryKeyWithContext:v8 recoveryKey:v9 error:&v13];
    id v10 = v13;
    BOOL v11 = _CDPLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        BOOL v15 = v10;
        _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Set RK in Octagon Failed with error: %@", buf, 0xCu);
      }

      if (a5)
      {
        id v10 = v10;
        *a5 = v10;
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Set RK in Octagon succeeded", buf, 2u);
      }
    }
  }
}

- (BOOL)_isRecoveryKeySetInSOSWithConfig:(id)a3
{
  id v4 = a3;
  if (![(CDPDSecureBackupController *)self _isSOSEnabled])
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _isRecoveryKeySetInSOSWithConfig:]();
    }
    goto LABEL_8;
  }
  id v9 = 0;
  char v5 = [MEMORY[0x263F16D30] isRecoveryKeySetInSOS:v4 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _isRecoveryKeySetInSOSWithConfig:]();
    }

LABEL_8:
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isSOSEnabled
{
  return MEMORY[0x270EFD430](self, a2);
}

- (BOOL)_isInSOSCircle
{
  uint64_t v2 = (void *)MEMORY[0x263F343E8];
  char v3 = [(CDPContext *)self->_context altDSID];
  uint64_t v4 = [v2 syncingStatusForAltDSID:v3];

  return v4 == 1;
}

- (BOOL)_validateSOSRecoveryKey:(id)a3 config:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(CDPDSecureBackupController *)self _isRecoveryKeySetInSOSWithConfig:a4])
  {
    id v7 = [(CDPDSecureBackupController *)self secureBackupProxy];
    id v17 = 0;
    char v8 = [v7 verifyRecoveryKey:v6 error:&v17];
    id v9 = v17;

    if (v9) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v8;
    }
    BOOL v11 = _CDPLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        id v13 = "SOS RecoveryKey Validated";
        uint32_t v14 = v11;
        uint32_t v15 = 2;
LABEL_13:
        _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v9;
      id v13 = "SOS validateRecoveryKey Failed: %@";
      uint32_t v14 = v11;
      uint32_t v15 = 12;
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Recovery Key not set in SOS", buf, 2u);
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (void)_setRecoveryKeyInSOSIfRequiredWithConfig:(id)a3 recoveryKey:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if ([(CDPDSecureBackupController *)self _isRecoveryKeySetInSOSWithConfig:a3]
    || ![(CDPDSecureBackupController *)self _isInSOSCircle])
  {
    BOOL v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Recovery Key Already Set in SOS", buf, 2u);
    }
  }
  else
  {
    id v9 = [(CDPDSecureBackupController *)self secureBackupProxy];
    id v14 = 0;
    char v10 = [v9 setRecoveryKeyInSOS:v8 error:&v14];
    BOOL v11 = v14;

    if (v11 || (v10 & 1) == 0)
    {
      BOOL v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "setRecoveryKeyInSOSWithCompletion Failed: %@", buf, 0xCu);
      }

      if (a5) {
        *a5 = v11;
      }
    }
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "setRecoveryKeyInSOSWithCompletion suceeded", buf, 2u);
    }
  }
}

- (void)_validateRecoveryKeyInIDMSWithContext:(id)a3 authProvider:(id)a4 completion:(id)a5
{
  context = self->_context;
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 recoveryKey];
  [v9 cdpContext:context verifyMasterKey:v10 completion:v8];
}

- (void)_setRecoveryKeyInIDMSWithContext:(id)a3 circleProxy:(id)a4 authProvider:(id)a5 completion:(id)a6
{
  id v10 = a5;
  BOOL v11 = (void (**)(id, void, id))a6;
  id v12 = a4;
  id v13 = [a3 recoveryKey];
  id v20 = 0;
  id v14 = [v12 generateVerifierWithRecoveryKey:v13 error:&v20];

  id v15 = v20;
  if (!v14 || v15)
  {
    uint64_t v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _setRecoveryKeyInIDMSWithContext:circleProxy:authProvider:completion:]();
    }

    if (v11) {
      v11[2](v11, 0, v15);
    }
  }
  else
  {
    context = self->_context;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __99__CDPDSecureBackupController__setRecoveryKeyInIDMSWithContext_circleProxy_authProvider_completion___block_invoke;
    v18[3] = &unk_26432F680;
    uint64_t v19 = v11;
    [v10 cdpContext:context persistMasterKeyVerifier:v14 completion:v18];
  }
}

void __99__CDPDSecureBackupController__setRecoveryKeyInIDMSWithContext_circleProxy_authProvider_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || (a2 & 1) == 0)
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Locally Harmonized RK failed to register in IDMS: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_11;
    }
  }
  else
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = 0;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Locally Harmonized RK registered in IDMS successfully: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_11:
      v9();
    }
  }
}

- (id)_recoverBackupDictionaryWithContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(CDPDSecureBackupController *)self _recoveryInfoDictionaryFromContext:v8 usePreviouslyCachedSecret:[(CDPDSecureBackupController *)self _shouldUseSBDCacheWithSecureBackupContext:v8 fallbackState:a4]];
  uint64_t v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.4(v8, (uint64_t)v9);
  }

  int v11 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  secureBackupProxy = self->_secureBackupProxy;
  id v20 = 0;
  uint64_t v13 = [(CDPDSecureBackupProxy *)secureBackupProxy recoverWithInfo:v9 error:&v20];
  id v14 = v20;
  if (v14)
  {
    id v15 = v14;
    if (v13)
    {
      uint64_t v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:]();
      }

      uint64_t v17 = [v15 errorByExtendingUserInfoWithDictionary:v13];

      int v11 = 0;
      id v15 = (void *)v17;
    }
    id v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:]();
    }
  }
  else
  {
    [(CDPDRemoteSecretValidationResult *)v11 setRecoveredInfo:v13];
    id v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:]();
    }
    id v15 = 0;
  }

  if (a5) {
    *a5 = v15;
  }

  return v11;
}

- (id)_recoveryInfoDictionaryFromContext:(id)a3 usePreviouslyCachedSecret:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [v6 device];
  id v9 = [(CDPDSecureBackupConfiguration *)self->_configuration escrowAuthInfoForCreateEscrowRecordFlow:0];
  [v7 addEntriesFromDictionary:v9];

  uint64_t v10 = [v8 recordInfo];

  if (v10)
  {
    int v11 = [v8 recordInfo];
    id v12 = [v11 objectForKeyedSubscript:@"metadata"];
    [v7 setObject:v12 forKey:*MEMORY[0x263F32A68]];
  }
  uint64_t v13 = [v6 recoverySecret];

  if (v13)
  {
    id v14 = [v6 recoverySecret];
    uint64_t v15 = [v14 length];

    if (!v15)
    {
      uint64_t v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[CDPDSecureBackupController _recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    uint64_t v24 = [v6 recoverySecret];
    [v7 setObject:v24 forKey:*MEMORY[0x263F32A80]];
  }
  else
  {
    uint64_t v25 = [v6 recoveryKey];

    if (v25)
    {
      id v26 = [v6 recoveryKey];
      [v7 setObject:v26 forKey:*MEMORY[0x263F32A98]];

      [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F329F8]];
    }
  }
  if (v4) {
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AD8]];
  }
  if (([v8 isUsingMultipleiCSC] & 1) != 0 || objc_msgSend(v6, "silentRecovery"))
  {
    uint64_t v27 = MEMORY[0x263EFFA88];
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AE8]];
    [v7 setObject:v27 forKey:*MEMORY[0x263F329F8]];
  }
  id v28 = [v8 recordID];

  if (v28)
  {
    int v29 = [v8 recordID];
    [v7 setObject:v29 forKey:*MEMORY[0x263F32A90]];
  }
  if ([v6 silentRecovery]) {
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32AB8]];
  }
  if ([v6 usePreviouslyCachedRecoveryKey]) {
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32B00]];
  }
  id v30 = [v6 telemetryFlowID];

  if (v30)
  {
    id v31 = [v6 telemetryFlowID];
    [v7 setObject:v31 forKey:*MEMORY[0x263F32A48]];
  }
  id v32 = [v6 telemetryDeviceSessionID];

  if (v32)
  {
    uint64_t v33 = [v6 telemetryDeviceSessionID];
    [v7 setObject:v33 forKey:*MEMORY[0x263F32A08]];
  }
  uint64_t v34 = _CDPLogSystem();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = [v6 telemetryFlowID];
    uint64_t v36 = [v6 telemetryDeviceSessionID];
    int v38 = 138543618;
    uint64_t v39 = v35;
    __int16 v40 = 2114;
    uint64_t v41 = v36;
    _os_log_impl(&dword_218640000, v34, OS_LOG_TYPE_DEFAULT, "Adding telemetry flow ID %{public}@ and session ID %{public}@ to recoveryInfo", (uint8_t *)&v38, 0x16u);
  }
  if ([v6 nonViableRequiresRepair]) {
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32A70]];
  }

  return v7;
}

- (void)deleteAllBackupRecordsWithCompletion:(id)a3
{
  id v5 = self->_context;
  id v6 = a3;
  unsigned int v7 = [(CDPContext *)v5 backupActivity];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 4108292144;
  }
  [(CDPContext *)v5 setBackupActivity:v8];
  id v9 = _Block_copy(v6);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke;
  aBlock[3] = &unk_26432ED48;
  uint64_t v17 = v5;
  id v18 = v9;
  uint64_t v10 = v5;
  id v11 = v9;
  id v12 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2;
  v14[3] = &unk_26432EDC0;
  void v14[4] = self;
  id v15 = v12;
  id v13 = v12;
  [(CDPDSecureBackupController *)self _deleteAllBackupRecordsWithCompletion:v14];
}

uint64_t __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  char v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

void __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 isAuthenticationError])
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 16);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_150;
    v10[3] = &unk_26432EDC0;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 40);
    [v8 reauthenticateUserWithCompletion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
    }
  }
}

uint64_t __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_150(uint64_t a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _deleteAllBackupRecordsWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  return MEMORY[0x270F9A790]();
}

- (void)_deleteAllBackupRecordsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, id))a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [(CDPContext *)self->_context appleID];
  [v5 setObject:v6 forKey:*MEMORY[0x263F329C0]];

  uint64_t v7 = [(CDPContext *)self->_context passwordEquivToken];
  [v5 setObject:v7 forKey:*MEMORY[0x263F329E0]];

  uint64_t v8 = MEMORY[0x263EFFA88];
  [v5 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32B10]];
  [v5 setObject:v8 forKey:*MEMORY[0x263F329F8]];
  uint64_t v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupController _deleteAllBackupRecordsWithCompletion:]();
  }

  secureBackupProxy = self->_secureBackupProxy;
  id v14 = 0;
  uint64_t v11 = [(CDPDSecureBackupProxy *)secureBackupProxy disableWithInfo:v5 error:&v14];
  id v12 = v14;
  if (v12)
  {
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _deleteAllBackupRecordsWithCompletion:]();
    }
  }
  if (v4) {
    v4[2](v4, v11, v12);
  }
}

- (void)deleteSingleICSCBackupWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke;
  v6[3] = &unk_26432EDC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CDPDSecureBackupController *)self _deleteSingleICSCBackupWithCompletion:v6];
}

void __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 isAuthenticationError])
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 16);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_151;
    v10[3] = &unk_26432EDC0;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 40);
    [v8 reauthenticateUserWithCompletion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
    }
  }
}

uint64_t __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_151(uint64_t a1, int a2, void *a3)
{
  a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _deleteSingleICSCBackupWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  return MEMORY[0x270F9A790]();
}

- (void)_deleteSingleICSCBackupWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke;
  v6[3] = &unk_26432EE88;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CDPDSecureBackupController *)self accountInfoWithCompletion:v6];
}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 objectForKeyedSubscript:*MEMORY[0x263F32A68]];
    id v7 = _CDPLogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8) {
        __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_4();
      }

      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 24);
      id v17 = 0;
      uint64_t v10 = [v9 disableWithInfo:0 error:&v17];
      id v11 = v17;
      if (v11)
      {
        id v12 = _CDPLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CDPDSecureBackupController _deleteAllBackupRecordsWithCompletion:]();
        }
      }
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v10, v11);
      }
    }
    else
    {
      if (v8) {
        __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_2();
      }

      uint64_t v16 = *(void *)(a1 + 40);
      if (v16) {
        (*(void (**)(uint64_t, uint64_t, void))(v16 + 16))(v16, 1, 0);
      }
    }
  }
  else
  {
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_1();
    }

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v5);
    }
  }
}

- (void)disableSecureBackupWithCompletion:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  [(CDPDSecureBackupController *)self _disableSecureBackup:&v10];
  id v5 = v10;
  if ([v5 isAuthenticationError])
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController disableSecureBackupWithCompletion:]();
    }

    context = self->_context;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__CDPDSecureBackupController_disableSecureBackupWithCompletion___block_invoke;
    v8[3] = &unk_26432EDC0;
    void v8[4] = self;
    id v9 = v4;
    [(CDPContext *)context reauthenticateUserWithCompletion:v8];
  }
  else if (v4)
  {
    (*((void (**)(id, id))v4 + 2))(v4, v5);
  }
}

void __64__CDPDSecureBackupController_disableSecureBackupWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v10 = 0;
    [v6 _disableSecureBackup:&v10];
    id v7 = v10;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = v5;
    }
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
}

- (BOOL)_disableSecureBackup:(id *)a3
{
  return [(CDPDSecureBackupController *)self _disableSecureBackupWithEnableInfo:0 error:a3];
}

- (BOOL)_disableSecureBackupWithEnableInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CDPDSecureBackupController *)self delegate];
  uint64_t v8 = [v7 circlePeerIDForSecureBackupController:self];

  if (v8)
  {
    id v9 = [(CDPDSecureBackupConfiguration *)self->_configuration escrowAuthInfoForCreateEscrowRecordFlow:0];
    id v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = MEMORY[0x263EFFA88];
    [v10 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F329F8]];
    [v10 setObject:v11 forKey:*MEMORY[0x263F32AE8]];
    [v10 setObject:v8 forKey:*MEMORY[0x263F32A90]];
    objc_opt_class();
    uint64_t v12 = *MEMORY[0x263F32A70];
    id v13 = [v6 objectForKeyedSubscript:*MEMORY[0x263F32A70]];
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    int v17 = [v14 BOOLValue];
    if (v17)
    {
      id v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:]();
      }

      [v10 setObject:MEMORY[0x263EFFA88] forKey:v12];
    }
    uint64_t v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:]();
    }

    char v16 = [(CDPDSecureBackupProxy *)self->_secureBackupProxy disableWithInfo:v10 error:a4];
  }
  else
  {
    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:]();
    }

    if (a4)
    {
      _CDPStateError();
      char v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (void)disableRecoveryKeyWithCompletion:(id)a3
{
  id v5 = self->_context;
  id v6 = a3;
  unsigned int v7 = [(CDPContext *)v5 backupActivity];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 3058721123;
  }
  [(CDPContext *)v5 setBackupActivity:v8];
  id v9 = _Block_copy(v6);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke;
  aBlock[3] = &unk_264330098;
  id v10 = v9;
  id v21 = v10;
  uint64_t v11 = v5;
  uint64_t v20 = v11;
  uint64_t v12 = _Block_copy(aBlock);
  id v18 = 0;
  [(CDPDSecureBackupController *)self disableRecoveryKey:&v18];
  id v13 = v18;
  if ([v13 isAuthenticationError])
  {
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController disableRecoveryKeyWithCompletion:]();
    }

    context = self->_context;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke_153;
    v16[3] = &unk_26432EDC0;
    void v16[4] = self;
    id v17 = v12;
    [(CDPContext *)context reauthenticateUserWithCompletion:v16];
  }
  else if (v12)
  {
    (*((void (**)(void *, id))v12 + 2))(v12, v13);
  }
}

uint64_t __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  char v3 = *(void **)(a1 + 32);
  return [v3 setBackupActivity:0];
}

void __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke_153(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v10 = 0;
    [v6 disableRecoveryKey:&v10];
    id v7 = v10;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = v5;
    }
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
}

- (BOOL)disableRecoveryKey:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Removing recovery key", buf, 2u);
  }

  id v6 = [(CDPDSecureBackupController *)self octagonTrustProxy];
  id v11 = 0;
  int v7 = [v6 disableRecoveryKey:&v11];
  id v8 = v11;

  id v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Removed recovery key result: %{BOOL}d, error: %@", buf, 0x12u);
  }

  if (a3) {
    *a3 = v8;
  }

  return v7;
}

- (void)disableRecoveryKeyFromAllSystemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Removing recovery key from All systems", buf, 2u);
  }

  id v14 = 0;
  [(CDPDSecureBackupController *)self disableRecoveryKey:&v14];
  id v6 = v14;
  id v13 = 0;
  [(CDPDSecureBackupController *)self _disableRecoveryKeyFromSOS:&v13];
  id v7 = v13;
  if (([v6 isAuthenticationError] & 1) != 0 || objc_msgSend(v7, "isAuthenticationError"))
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupController disableRecoveryKeyWithCompletion:]();
    }

    context = self->_context;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __77__CDPDSecureBackupController_disableRecoveryKeyFromAllSystemsWithCompletion___block_invoke;
    v11[3] = &unk_26432EDC0;
    void v11[4] = self;
    id v12 = v4;
    [(CDPContext *)context reauthenticateUserWithCompletion:v11];
  }
  else if (v4)
  {
    if (v6) {
      id v10 = v6;
    }
    else {
      id v10 = v7;
    }
    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }
}

void __77__CDPDSecureBackupController_disableRecoveryKeyFromAllSystemsWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v13 = 0;
    [v6 disableRecoveryKey:&v13];
    id v7 = v13;
    id v8 = *(void **)(a1 + 32);
    id v12 = 0;
    [v8 _disableRecoveryKeyFromSOS:&v12];
    id v9 = v12;
  }
  else
  {
    id v7 = 0;
    id v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    if (v7) {
      id v11 = v7;
    }
    else {
      id v11 = v9;
    }
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

- (void)_disableRecoveryKeyFromSOS:(id *)a3
{
  if ([(CDPDSecureBackupController *)self _isSOSEnabled]
    && [(CDPDSecureBackupController *)self _isInSOSCircle])
  {
    id v5 = [(CDPDSecureBackupController *)self secureBackupProxy];
    id v9 = 0;
    int v6 = [v5 removeRecoveryKeyFromSOS:&v9];
    id v7 = v9;

    if (v7 || !v6)
    {
      if (a3)
      {
        id v8 = v7;
        goto LABEL_11;
      }
    }
    else if (a3)
    {
      id v8 = 0;
LABEL_11:
      *a3 = v8;
    }

    return;
  }
  if (a3) {
    *a3 = 0;
  }
}

+ (id)_sanitizedInfoDictionary:(id)a3
{
  char v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = *MEMORY[0x263F32A80];
  id v5 = [v3 objectForKey:*MEMORY[0x263F32A80]];

  if (v5) {
    [v3 setObject:@"< REDACTED >" forKey:v4];
  }
  uint64_t v6 = *MEMORY[0x263F329E0];
  id v7 = [v3 objectForKey:*MEMORY[0x263F329E0]];

  if (v7) {
    [v3 setObject:@"< REDACTED >" forKey:v6];
  }
  uint64_t v8 = *MEMORY[0x263F329C8];
  id v9 = [v3 objectForKey:*MEMORY[0x263F329C8]];

  if (v9) {
    [v3 setObject:@"< REDACTED >" forKey:v8];
  }
  uint64_t v10 = *MEMORY[0x263F32A98];
  id v11 = [v3 objectForKey:*MEMORY[0x263F32A98]];

  if (v11) {
    [v3 setObject:@"< REDACTED >" forKey:v10];
  }
  id v12 = [v3 objectForKey:@"kPCSMetadataEscrowedKeys"];

  if (v12) {
    [v3 setObject:@"< REDACTED >" forKey:@"kPCSMetadataEscrowedKeys"];
  }
  id v13 = (void *)[v3 copy];

  return v13;
}

+ (id)_printableAccountInfo:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = [v3 allKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v3 objectForKeyedSubscript:v9];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        id v12 = [v3 objectForKeyedSubscript:v9];
        if (isKindOfClass)
        {
          id v13 = @"< array with %lu items >";
        }
        else
        {
          objc_opt_class();
          char v14 = objc_opt_isKindOfClass();

          if ((v14 & 1) == 0) {
            continue;
          }
          id v12 = [v3 objectForKeyedSubscript:v9];
          id v13 = @"< dictionary with %lu keys >";
        }
        id v15 = objc_msgSend(NSString, "stringWithFormat:", v13, objc_msgSend(v12, "count"));
        [v3 setObject:v15 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  uint64_t v16 = (void *)[v3 copy];

  return v16;
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPDSecureBackupProxy)secureBackupProxy
{
  return self->_secureBackupProxy;
}

- (void)setSecureBackupProxy:(id)a3
{
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (CDPDOctagonTrustProxy)octagonTrustProxy
{
  return self->_octagonTrustProxy;
}

- (void)setOctagonTrustProxy:(id)a3
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

- (int64_t)icscRepairTotalRetries
{
  return self->_icscRepairTotalRetries;
}

- (void)setIcscRepairTotalRetries:(int64_t)a3
{
  self->_icscRepairTotalRetries = a3;
}

- (int64_t)icscRepairRetryDelay
{
  return self->_icscRepairRetryDelay;
}

- (void)setIcscRepairRetryDelay:(int64_t)a3
{
  self->_icscRepairRetryDelay = a3;
}

- (BOOL)isSimulateNonViableEscrowRecordEnabled
{
  return self->_isSimulateNonViableEscrowRecordEnabled;
}

- (void)setIsSimulateNonViableEscrowRecordEnabled:(BOOL)a3
{
  self->_isSimulateNonViableEscrowRecordEnabled = a3;
}

- (BOOL)simulateEPThrottle
{
  return self->_simulateEPThrottle;
}

- (void)setSimulateEPThrottle:(BOOL)a3
{
  self->_simulateEPThrottle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedAccountInfo, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:secureBackupProxy:octagonTrustProxy:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "**** DEBUG **** Simulate escrow proxy throttling mode is ENABLED", v2, v3, v4, v5, v6);
}

- (void)initWithContext:secureBackupProxy:octagonTrustProxy:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "**** DEBUG **** Simulate non-viable records mode is ENABLED", v2, v3, v4, v5, v6);
}

- (void)fetchEscrowRecordsWithOptionForceFetch:completion:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Fetching escrow records with %@", v3, v4, v5, v6, v7);
}

void __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "fetchEscrowRecordsWithCompletion: failed to fetch escrow records: %@", v2, v3, v4, v5, v6);
}

void __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Fetched Escrow Records %@", v2, v3, v4, v5, v6);
}

- (void)fetchAllEscrowRecordsWithOptionForceFetch:completion:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Fetching all escrow records with %@", v3, v4, v5, v6, v7);
}

void __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "fetchAllEscrowRecordsWithOptionForceFetch: failed to fetch escrow records: %@", v2, v3, v4, v5, v6);
}

void __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Fetched All Escrow Records %@", v2, v3, v4, v5, v6);
}

- (void)accountInfoWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [(id)objc_opt_class() _printableAccountInfo:*a2];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v3, v4, "Using cached SecureBackup account info %@", v5, v6, v7, v8, v9);
}

void __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)objc_opt_class() _printableAccountInfo:*(void *)(*(void *)(a1 + 32) + 48)];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Non-cached SecureBackup account info fetched %@", v4, v5, v6, v7, v8);
}

- (void)_accountInfoWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Fetching account info with %@", v3, v4, v5, v6, v7);
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "getBackupRecordDevicesWithOptionForceFetch fetched 0 records", v2, v3, v4, v5, v6);
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xEu);
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "getBackupRecordDevicesWithOptionForceFetch fetched %lu records", v3, v4, v5, v6, v7);
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "getBackupRecordDevicesWithOptionForceFetch returned!", v2, v3, v4, v5, v6);
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "getBackupRecordDevicesWithOptionForceFetch: Failed to check for secure backup records: %@", v2, v3, v4, v5, v6);
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "fetch escrow records returned error %@", v2, v3, v4, v5, v6);
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_54_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "fetch all escrow records returned error %@", v2, v3, v4, v5, v6);
}

void __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SecureBackup returned error %@", v2, v3, v4, v5, v6);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Already using multiple ICSC, no need to prompt for adoption", v2, v3, v4, v5, v6);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Single ICSC that is complex or random and not using multiple ICSC, prompting for adoption...", v2, v3, v4, v5, v6);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Single ICSC that is NOT random or complex, deleting old record and enabling multiple-ICSC", v2, v3, v4, v5, v6);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to get backup record devices with error: %@", v2, v3, v4, v5, v6);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_80_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Single ICSC record deleted, proceeding with enable of secure backup", v2, v3, v4, v5, v6);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_80_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to delete single-ICSC backup while attempting to enable secure backup: %@", v2, v3, v4, v5, v6);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_82_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Accepted multiple ICSC, deleting old record...", v2, v3, v4, v5, v6);
}

void __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to fetch escrow records for OT only viability check: %{public}@", v2, v3, v4, v5, v6);
}

- (void)checkForExistingRecordMatchingPredicate:forceFetch:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Checking if the peer has a secure backup: %@", v2, v3, v4, v5, v6);
}

void __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_89_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Check for existing backup failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)supportsRecoveryKeyWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "SOS isRecoveryKeySet threw error: %@", v2, v3, v4, v5, v6);
}

- (void)supportsRecoveryKeyWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "OT isRecoveryKeySet threw error: %@", v2, v3, v4, v5, v6);
}

- (void)supportsRecoveryKeyWithError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Forcing recovery key support by preference (com.apple.corecdp: ForceRecoveryKeySupport)", v2, v3, v4, v5, v6);
}

- (void)supportsWalrusRecoveryKeyWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_enableSecureBackupWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_enableSecureBackupWithContext called.", v2, v3, v4, v5, v6);
}

void __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_authenticatedEnableSecureBackupIncludingFallbackWithContext succeeded", v2, v3, v4, v5, v6);
}

void __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "_authenticatedEnableSecureBackupIncludingFallbackWithContext failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_retryRepairWithContext:(uint64_t)a1 retryCount:completion:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v2, v3, "Will retry in %@ second(s)... Retry number: %ld", v4, v5, v6, v7, v8);
}

- (void)_retryRepairWithContext:retryCount:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Re-authenticating after error... Retry number: %ld...", v2, v3, v4, v5, v6);
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Posting followup for failed async SecureBackup path with error %@", v2, v3, v4, v5, v6);
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Within retry, _authenticatedEnableSecureBackupWithContext succeeded.", v2, v3, v4, v5, v6);
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Within retry, _authenticatedEnableSecureBackupWithContext failed with error: %@", v2, v3, v4, v5, v6);
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_103_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Retry count has reached the maximum limit. Bubbling up previous retry error: %@", v2, v3, v4, v5, v6);
}

- (void)enableSecureBackupWithRecoveryKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Re-authenticating after error from authenticatedEnableSecureBackupWithRecoveryKey: %@", v2, v3, v4, v5, v6);
}

- (void)authenticatedEnableSecureBackupWithRecoveryKey:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "authenticatedEnableSecureBackupWithRecoveryKey received a nil recoveryKey", v2, v3, v4, v5, v6);
}

- (void)authenticatedEnableSecureBackupWithRecoveryKey:error:.cold.2()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Attempting to enable SecureBackup with recovery key using info %@", v3, v4, v5, v6, v7);
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_authenticatedEnableSecureBackupWithContext succeeded", v2, v3, v4, v5, v6);
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Retrying _authenticatedEnableSecureBackupWithContext by falling back to SBD cache.", v2, v3, v4, v5, v6);
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Even if the error is the missing cached passphrase error, we only add fallback logic with the feature flag turned on.", v2, v3, v4, v5, v6);
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Errors that aren't the missing cached passphrase error don't get fallback logic.", v2, v3, v4, v5, v6);
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "_authenticatedEnableSecureBackupWithContext failed with error: %@", v2, v3, v4, v5, v6);
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_111_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_authenticatedEnableSecureBackupWithContext succeeded after falling back to SBD cached secret", v2, v3, v4, v5, v6);
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_111_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Nested _authenticatedEnableSecureBackupWithContext failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.1()
{
  __assert_rtn("-[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:]", "CDPDSecureBackupController.m", 851, "unlockType == MCUnlockScreenSimple || simplePasscodeType == MCNotSimplePasscode");
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.2()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Attempting to enable SecureBackup with validated local secret using info %@", v3, v4, v5, v6, v7);
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Failed to escrow account recovery data due to missing recovery token", v2, v3, v4, v5, v6);
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Failed to escrow account recovery data due to missing MID", v2, v3, v4, v5, v6);
}

- (void)_authenticatedEnableSecureBackupWithContext:(void *)a1 fallbackState:completion:.cold.5(void *a1)
{
  uint64_t v2 = [a1 telemetryFlowID];
  uint8_t v9 = [a1 telemetryDeviceSessionID];
  OUTLINED_FUNCTION_6_0(&dword_218640000, v3, v4, "Passing telemetry flow ID %{public}@ and deviceSession ID %{public}@ to secureBackupProxy", v5, v6, v7, v8, 2u);
}

- (void)_authenticatedEnableSecureBackupWithContext:(uint64_t)a3 fallbackState:(uint64_t)a4 completion:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.7()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Using cached secret with updated client metadata %@", v3, v4, v5, v6, v7);
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Using cached secret and managed config reports simplePasscodeLength=%li", v2, v3, v4, v5, v6);
}

- (void)_authenticatedEnableSecureBackupWithContext:(uint64_t)a3 fallbackState:(uint64_t)a4 completion:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Forcing purge of cached secret by preference (com.apple.corecdp: ForceCachedSecretPurge)", v2, v3, v4, v5, v6);
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.11()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Enabled SecureBackup!", v2, v3, v4, v5, v6);
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Failed to enable with CDPContext local secret. Let's try again with SBD cached secret.", v2, v3, v4, v5, v6);
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Using sync mode. Prompting user to enter local secret using delegate %@", v2, v3, v4, v5, v6);
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Using async mode. Failing early which should trigger a CFU.", v2, v3, v4, v5, v6);
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Failed to enable SecureBackup because no cached secret was present when expected", v2, v3, v4, v5, v6);
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to enable SecureBackup with error %@", v2, v3, v4, v5, v6);
}

void __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Failed to get local secret", v2, v3, v4, v5, v6);
}

void __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Attempt to enable Secure Backup again now that we have the local secret", v2, v3, v4, v5, v6);
}

- (void)_shouldUseSBDCacheWithSecureBackupContext:fallbackState:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Forcing use of cached secret by preference (com.apple.corecdp: ForceUseCachedSecret)", v2, v3, v4, v5, v6);
}

void __50__CDPDSecureBackupController__currentAnisetteData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Failed to fetch Anisette data! Error: %@", v2, v3, v4, v5, v6);
}

- (void)performEscrowRecoveryWithData:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithContextData: success!", v2, v3, v4, v5, v6);
}

- (void)performEscrowRecoveryWithData:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "performEscrowRecoveryWithContextData: failed to recover: %@", v2, v3, v4, v5, v6);
}

- (void)performEscrowRecoveryWithData:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithData: calling performEscrowRecoveryWithContextData", v2, v3, v4, v5, v6);
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performSilentEscrowRecoveryWithCDPContext: cdp context does not support optimized recovery", v2, v3, v4, v5, v6);
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "performSilentEscrowRecoveryWithCDPContext: fetched 0 escrow records, exiting", v2, v3, v4, v5, v6);
}

- (void)performSilentEscrowRecoveryWithCDPContext:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performSilentEscrowRecoveryWithCDPContext: performing silent restore now", v2, v3, v4, v5, v6);
}

- (void)performSilentEscrowRecoveryWithCDPContext:(os_log_t)log error:.cold.5(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "performSilentEscrowRecoveryWithCDPContext: calling new recovery with %lu records", buf, 0xCu);
}

- (void)performSilentEscrowRecoveryWithCDPContext:(uint64_t)a3 error:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performSilentEscrowRecoveryWithCDPContext: invoked", v2, v3, v4, v5, v6);
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performSilentEscrowRecoveryWithCDPContext: fetched 0 escrow records", v2, v3, v4, v5, v6);
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "performSilentEscrowRecoveryWithCDPContext: fetched %lu multiple icsc records", v3, v4, v5, v6, v7);
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performSilentEscrowRecoveryWithCDPContext: single icsc", v2, v3, v4, v5, v6);
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "performSilentEscrowRecoveryWithCDPContext: failed to fetch escrow records: %@", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: attempting silent burn", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: chosen record is empty, aborting recovery", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: escrow recovery succeeded", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: failed to perform escrow recovery: %@", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: record checks out, continuing with restore", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: need to perform a single icsc restore, choosing old recovery SPI", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: attempting remote restore", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: joined via recovery key!", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext failed to join via recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: attempting recovery key recovery", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: fetching RK from the keychain", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: using recovery key from recoveryContext", v2, v3, v4, v5, v6);
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "performEscrowRecoveryWithRecoveryContext: invoked with fallbackState=%ld", v2, v3, v4, v5, v6);
}

void __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "performEscrowRecoveryWithData: failed to recover via cached recovery key, but an error was not reported. There was also an error checking recovery key support: %@", v2, v3, v4, v5, v6);
}

void __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "performEscrowRecoveryWithData: failed to recover via cached recovery key. error: %@", v2, v3, v4, v5, v6);
}

- (void)validateAndRepairRecoveryKeyMismatchWithContext:authProvider:circleProxy:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Validating RK against OT because no mismatch exists", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Successfully registered IDMS RK to Octagon and SOS", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failure setting IDMS Recovery Key in SOS with error: %@", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failure setting IDMS Recovery Key in Octagon with error: %@", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Validated RK against IDMS successfully", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Validated RK against Octagon successfully", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Validated RK against SOS successfully", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Recovery Key is not valid in any observing system", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Successfully registered Octagon RK to IDMS and SOS", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failure setting Octagon Recovery Key in SOS with error: %@", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_147_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failure setting Octagon Recovery Key in IDMS with error: %@", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Successfully registered SOS RK to IDMS and Octagon", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failure setting SOS Recovery Key in Octagon with error: %@", v2, v3, v4, v5, v6);
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_148_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failure setting SOS Recovery Key in IDMS with error: %@", v2, v3, v4, v5, v6);
}

- (void)_isRecoveryKeySetInOctagonWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Setting Recovery Set in Octagon failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_isRecoveryKeySetInSOSWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Received error while checking if RK is set in SOS: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_isRecoveryKeySetInSOSWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "SOS not enabled to check for RK", v2, v3, v4, v5, v6);
}

- (void)_setRecoveryKeyInIDMSWithContext:circleProxy:authProvider:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "generateVerifierWithRecoveryKey failed with error: %@", v2, v3, v4, v5, v6);
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

- (void)_recoverBackupDictionaryWithContext:(void *)a1 fallbackState:(uint64_t)a2 error:.cold.4(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 device];
  uint64_t v10 = +[CDPDSecureBackupController _sanitizedInfoDictionary:a2];
  OUTLINED_FUNCTION_6_0(&dword_218640000, v4, v5, "Attempting to recover SecureBackup secret from device %@ using info %@", v6, v7, v8, v9, 2u);
}

- (void)_recoveryInfoDictionaryFromContext:(uint64_t)a3 usePreviouslyCachedSecret:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Re-authenticating after error from _deleteAllBackupRecordsWithCompletion: %@", v2, v3, v4, v5, v6);
}

- (void)_deleteAllBackupRecordsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Error attempting to delete all backup records %@", v2, v3, v4, v5, v6);
}

- (void)_deleteAllBackupRecordsWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Attempting to delete all SecureBackup records with info %@", v3, v4, v5, v6, v7);
}

void __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Re-authenticating after error from _deleteSingleICSCBackupWithCompletion: %@", v2, v3, v4, v5, v6);
}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to get account info while deleting single-iCSC backup: %@", v2, v3, v4, v5, v6);
}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "No existing single-iCSC backup found to delete", v2, v3, v4, v5, v6);
}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Deleting existing single-iCSC backup...", v2, v3, v4, v5, v6);
}

- (void)disableSecureBackupWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Re-authenticating after error from _disableSecureBackupWithCompletion: %@", v2, v3, v4, v5, v6);
}

- (void)_disableSecureBackupWithEnableInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Failed to disable SecureBackup because no local peerID could be found", v2, v3, v4, v5, v6);
}

- (void)_disableSecureBackupWithEnableInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_7_1();
  v0 = +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v1, v2, "Attempting to disable SecureBackup with info %@", v3, v4, v5, v6, v7);
}

- (void)_disableSecureBackupWithEnableInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Setting non-viable repair key on securebackup disable info", v2, v3, v4, v5, v6);
}

- (void)disableRecoveryKeyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Re-authenticating after error from disableRecoveryKeyWithCompletion: %@", v2, v3, v4, v5, v6);
}

@end